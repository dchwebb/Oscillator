`timescale 1ns / 1ns

module top(dac_spi_cs, dac_spi_data, dac_spi_clock, adc_spi_nss, adc_spi_data, adc_spi_clock, rstn, crystal_osc, err_out, debug_out);

	input wire rstn;       // from SW1 pushbutton
	wire rst;
	assign rst = ~rstn;
	
	// Debug settings
	output reg err_out;
	output wire debug_out;

	// SinLUT settings
	reg [10:0] lut_addr = 11'b0;
	wire lut_enable = 1'b1;
	wire [15:0] lut_value;

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

	// Timing settings
	input wire crystal_osc;
	reg [15:0] sample_pos;
	reg [15:0] sample_timer = 1'b0;
	reg [15:0] frequency = 16'd220;
	parameter SAMPLERATE = 16'd44000;
	parameter SAMPLEINTERVAL = 16'd1909;			// Clock frequency / sample rate - eg 88.67Mhz / 44khz = 2015 OR 84MHz / 44kHz = 1909
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
	SineLUT sin_lut (.Address(lut_addr), .OutClock(fpga_clock), .OutClockEn(lut_enable), .Reset(rst), .Q(lut_value));

	// Initialise ADC SPI input microcontroller
	ADC_SPI_In adc(.reset(rst), .clock(fpga_clock), .spi_nss(adc_spi_nss), .spi_clock_in(adc_spi_clock), .spi_data_in(adc_spi_data), .data_out(adc_data), .data_received(adc_data_received), .debug_out(debug_out));

	// initialise DAC SPI (Maxim5134)
	DAC_SPI_Out dac(.clock_in(fpga_clock), .reset(rst), .data_in(dac_data), .send(dac_send), .spi_cs_out(dac_spi_cs), .spi_clock_out(dac_spi_clock), .spi_data_out(dac_spi_data));

	always @(posedge adc_data_received) begin
		err_out <=  ~err_out; //(adc_data < 1000)? 1'b0 : 1'b1;
		frequency <= adc_data;
	end

	always @(posedge fpga_clock or posedge rst) begin
		if (rst) begin
			sample_timer <= 1'b0;
			dac_send <= 1'b0;
			sample_pos <= 1'b0;
			lut_addr <= 1'b0;
		end
		else begin

			if (sample_timer == 0) begin
				// increment sample position by frequency
				sample_pos <= (sample_pos + frequency) % SAMPLERATE;		// number of items in sine LUT is 1375 (32*1375=44000Hz) which means that we can divide by 32 to get correct position
				lut_addr <= sample_pos >> 5;
			end
			else if (sample_timer == 1) begin
				dac_data <= {SEND_CHANNEL_A, lut_value};
			end
			
			
			

			// send DAC data out once sample timer reaches apporpriate count
			if (sample_timer > SAMPLEINTERVAL) begin
				
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