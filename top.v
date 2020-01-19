`timescale 1ns / 1ns

module top(dac_spi_cs, dac_spi_data, dac_spi_clock, adc_spi_data, adc_spi_clock, rstn);

	input wire rstn;       // from SW1 pushbutton
	wire rst;
	assign rst = ~rstn;

	// DAC settings
	output wire dac_spi_cs;
	output wire dac_spi_data;
	output wire dac_spi_clock;
	wire dac_sending;
	reg [23:0] dac_data;
	
	// ADC settings
	input wire adc_spi_clock;
	input wire adc_spi_data;
	wire [15:0] adc_data;
	wire adc_data_received;
	
	// Top timing settings
	reg send;
	reg [23:0] send_counter = 23'h00;
	reg [15:0] counter = 16'h00;
	reg [1:0] state;

	parameter SENDINTERVAL = 23'd3624;


	parameter state_waiting	= 2'b00;
	parameter state_send		= 2'b01;
	parameter state_sending	= 2'b10;
	parameter state_sent		= 2'b11;

	wire fpga_clock;
	OSCH #(.NOM_FREQ("133.00")) rc_oscillator(.STDBY(1'b0), .OSC(fpga_clock), .SEDSTDBY());

	// Initialise ADC SPI input microcontroller
	SPISlave dut(.clock(fpga_clock), .reset(rst), .spi_clock_in(adc_spi_clock), .spi_data_in(adc_spi_data), .data_out(adc_data), .data_received(adc_data_received));


	// initialise DAC SPI (Maxim5134)
	DacSPI dac(.clock_in(fpga_clock), .reset(rst), .data_in(dac_data), .send(send), .spi_cs_out(dac_spi_cs), .spi_clock_out(dac_spi_clock), .spi_data_out(dac_spi_data));

	parameter SEND_CHANNEL_A = 8'b00110001;		// Write to DAC Channel A
	initial begin
		state = state_waiting;
		counter = 1'b1;
		send_counter = 1'b0;
		send = 1'b0;
	end


	always @(posedge fpga_clock or posedge rst) begin
		if (rst) begin
			state <= state_waiting;
			counter <= 1'b1;
			send_counter <= 1'b0;
		end
		else begin
			// process incoming ADC data
			if (adc_data_received) begin
				dac_data <= {SEND_CHANNEL_A, adc_data};
			end
			
			// send DAC data out
			case (state)
				state_waiting:
					begin
						send_counter <= send_counter + 1'b1;
						if (send_counter > SENDINTERVAL) begin
							counter <= counter + 16'd64;
							state <= state_send;
						end
					end
				state_send:
					begin
						//dac_data <= {SEND_CHANNEL_A, counter};
						send <= 1'b1;
						state <= state_sent;
					end
				state_sent:
					begin
						state <= state_waiting;
						send <= 1'b0;
						send_counter <= 1'b0;
					end

			endcase
		end
	end

//	assign top_cs = dac_sending;		// NB stops working without this line ????

endmodule