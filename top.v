`timescale 1ns / 1ns

module top(dac_spi_cs, dac_spi_data, dac_spi_clock, adc_spi_nss, adc_spi_data, adc_spi_clock, rstn);

	input wire rstn;       // from SW1 pushbutton
	wire rst;
	assign rst = ~rstn;

	// DAC settings
	output wire dac_spi_cs;
	output wire dac_spi_data;
	output wire dac_spi_clock;
	reg [23:0] dac_data;
	reg send;
	
	// ADC settings
	input wire adc_spi_nss;
	input wire adc_spi_clock;
	input wire adc_spi_data;
	wire [15:0] adc_data;
	wire adc_data_received;
	
	// Timing settings
	reg [15:0] sample_pos;					
	reg [15:0] sample_timer = 1'b0;
	reg [15:0] frequency;
	parameter SAMPLERATE = 16'd44000;
	parameter SAMPLEINTERVAL = 16'd2015;			// Clock frequency / sample rate - eg 88.67Mhz / 44khz = 2015
	
	// Sample settings
	parameter SEND_CHANNEL_A = 8'b00110001;		// Write to DAC Channel A

	// Initialise fpga clock
	wire fpga_clock;
	OSCH #(.NOM_FREQ("88.67")) rc_oscillator(.STDBY(1'b0), .OSC(fpga_clock), .SEDSTDBY());

	// Initialise ADC SPI input microcontroller
	ADC_SPI_In adc(.reset(rst), .spi_nss(adc_spi_nss), .spi_clock_in(adc_spi_clock), .spi_data_in(adc_spi_data), .data_out(adc_data), .data_received(adc_data_received));

	// initialise DAC SPI (Maxim5134)
	DAC_SPI_Out dac(.clock_in(fpga_clock), .reset(rst), .data_in(dac_data), .send(send), .spi_cs_out(dac_spi_cs), .spi_clock_out(dac_spi_clock), .spi_data_out(dac_spi_data));

	initial begin
		sample_timer = 1'b0;
		send = 1'b0;
	end


	always @(posedge fpga_clock or posedge rst) begin
		if (rst) begin
			sample_timer <= 1'b0;
			send <= 1'b0;
			sample_pos <= 1'b0;
		end
		else begin
			// process incoming ADC data
			if (adc_data_received) begin
				//dac_data <= {SEND_CHANNEL_A, adc_data};
				frequency <= adc_data;
			end
			
			// increment sample position by frequency
			dac_data <= {SEND_CHANNEL_A, sample_pos};
			
			// send DAC data out once sample timer reaches apporpriate count
			if (sample_timer > SAMPLEINTERVAL) begin
				sample_pos <= (sample_pos + frequency) % SAMPLERATE;
				sample_timer <= 1'b0;
				send <= 1'b1;
			end
			else begin
				sample_timer <= sample_timer + 1'b1;
				send <= 1'b0;
			end
		end
	end

endmodule