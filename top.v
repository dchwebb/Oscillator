`timescale 1ns / 1ns

module top(dac_spi_cs, dac_spi_data, dac_spi_clock, adc_spi_nss, adc_spi_data, adc_spi_clock, rstn, crystal_osc, err_out, debug_out);

	input wire rstn;       // from SW1 pushbutton
	wire reset;
	assign reset = ~rstn;

	// Debug settings
	output reg err_out;
	output reg debug_out;
	reg [31:0] debug_sample;

	// SinLUT settings
	reg [8:0] lut_addr = 9'b0;
	wire lut_enable = 1'b1;
	wire [15:0] lut_value;

	// Smaple position RAM
	reg [9:0] sp_addr;
	reg sp_write;
	wire [15:0] sp_readdata;
	reg [15:0] sp_writedata;
	
	// DAC settings
	output wire dac_spi_cs;
	output wire dac_spi_data;
	output wire dac_spi_clock;
	reg [23:0] dac_data;
	reg dac_send;

	// ADC settings
	input wire adc_spi_nss;
	input wire adc_spi_clock;
	input wire adc_spi_data;
	wire [15:0] adc_data;
	wire adc_data_received;

	// output settings
	reg [31:0] output_sample;

	// Timing settings
	input wire crystal_osc;
	reg [15:0] sample_pos;
	reg [15:0] sample_pos2;
	reg [15:0] sample_timer = 1'b0;
	reg [15:0] freq_increment;						// Sample position offset incrementing by n * freqency for each harmonic
	reg [15:0] frequency = 16'd2000;
	parameter SAMPLERATE = 16'd48000;
	parameter SAMPLEINTERVAL = 16'd1750;			// Clock frequency / sample rate - eg 88.67Mhz / 44khz = 2015 OR 84MHz / 48kHz = 1750
	parameter LUTSIZE = 1500;
	//reg [9:0] lut_pos = 10'b0;

	// Sample settings
	parameter SEND_CHANNEL_A = 8'b00110001;		// Write to DAC Channel A

	//	Initialise 84MHz PLL clock from dev board 12 MHz crystal (dev board pin C8)
	wire fpga_clock;
	OscPll pll(.CLKI(crystal_osc), .CLKOP(fpga_clock));

	// Initialise fpga clock
	//wire fpga_clock;
	//OSCH #(.NOM_FREQ("88.67")) rc_oscillator(.STDBY(1'b0), .OSC(fpga_clock), .SEDSTDBY());

	// Initialise Sine LUT
	//SineLUT sin_lut (.Address(lut_addr), .OutClock(fpga_clock), .OutClockEn(lut_enable), .Reset(reset), .Q(lut_value));
	Sin_qlut sinlut (.Address(lut_addr), .OutClock(fpga_clock), .OutClockEn(lut_enable), .Reset(reset), .Q(lut_value));

	// Initialise Sample Position RAM
	Sample_Pos_RAM sample_pos_ram(.din(sp_writedata), .addr(sp_addr), .write_en(sp_write), .clk(fpga_clock), .dout(sp_readdata));
	
	// Initialise ADC SPI input microcontroller
	ADC_SPI_In adc(.reset(reset), .clock(fpga_clock), .spi_nss(adc_spi_nss), .spi_clock_in(adc_spi_clock), .spi_data_in(adc_spi_data), .data_out(adc_data), .data_received(adc_data_received));

	// initialise DAC SPI (Maxim5134)
	DAC_SPI_Out dac(.clock_in(fpga_clock), .reset(reset), .data_in(dac_data), .send(dac_send), .spi_cs_out(dac_spi_cs), .spi_clock_out(dac_spi_clock), .spi_data_out(dac_spi_data));

	always @(posedge adc_data_received) begin
		err_out <=  ~err_out; //(adc_data < 1000)? 1'b0 : 1'b1;
		frequency <= adc_data;
	end

	always @(posedge fpga_clock or posedge reset) begin
		if (reset) begin
			sample_timer <= 1'b0;
			dac_send <= 1'b0;
			sample_pos <= 1'b0;
			sample_pos2 <= 1'b0;
			lut_addr <= 1'b0;
		end
		else begin

			if (sample_timer == 0) begin
				// increment sample position by frequency
				sample_pos <= (sample_pos + frequency) % SAMPLERATE;		// number of items in sine LUT is 1375 (32*1500=48000Hz) which means that we can divide by 32 to get correct position
 
				if (sample_pos >= SAMPLERATE * 3 / 4)
					lut_addr <= (SAMPLERATE - sample_pos) >> 5;
				else if (sample_pos >= SAMPLERATE / 2)
					lut_addr <= (sample_pos - SAMPLERATE / 2) >> 5;
				else if (sample_pos >= SAMPLERATE / 4)
					lut_addr <= (SAMPLERATE / 2 - sample_pos) >> 5;
				else
					lut_addr <= sample_pos >> 5;
			end
			else if (sample_timer == 1) begin
				sp_writedata <= sample_pos;
				sp_write <= 1'b1;
				sp_addr <= 1'b0;
				freq_increment <= (frequency << 1) % SAMPLERATE;		// set up next sample position offset
			end
			else if (sample_timer == 2) begin
				sp_write <= 1'b0;				
				if (sample_pos >= SAMPLERATE / 2)
					output_sample <= 16'h8000 - lut_value;
				else
					output_sample <= 16'h8000 + lut_value;

				// increment sample position by frequency
				sample_pos2 <= (sample_pos2 + freq_increment) % SAMPLERATE;		// number of items in sine LUT is 1375 (32*1375=44000Hz) which means that we can divide by 32 to get correct position
					
//				lut_addr <= sample_pos2 >> 5;
				
			end
			else if (sample_timer == 3) begin
				freq_increment <= (freq_increment + frequency) % SAMPLERATE;
			end
			else if (sample_timer == 4) begin
				//output_sample <= output_sample + lut_value;
			end




			// send DAC data out once sample timer reaches appropriate count
			if (sample_timer > SAMPLEINTERVAL) begin
				debug_sample <= output_sample;
				dac_data <= {SEND_CHANNEL_A, output_sample[16:1]};		// effectively divide output sample by 2 to avoid overflow caused by adding multiple sine waves

				sample_timer <= 1'b0;
				dac_send <= 1'b1;
			end
			else begin
				sample_timer <= sample_timer + 1'b1;
				dac_send <= 1'b0;
			end
		end
	end

endmodule