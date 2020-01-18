`timescale 1ns / 1ns

module top(spi_cs, spi_data, spi_clock, rstn);

	wire top_cs;
	output wire spi_cs;
	output wire spi_data;
	output wire spi_clock;
	input wire rstn;       // from SW1 pushbutton
	wire rst;
	assign rst = ~rstn;

	parameter SENDINTERVAL = 23'd3624;

	wire dac_sending;
	reg [23:0] dac_data;
	reg send;
	reg [15:0] counter = 16'h00;
	reg [23:0] send_counter = 23'h00;
	reg [1:0] state;

	parameter state_waiting	= 2'b00;
	parameter state_send		= 2'b01;
	parameter state_sending	= 2'b10;
	parameter state_sent		= 2'b11;

	wire fpga_clock;
	OSCH #(.NOM_FREQ("133.00")) rc_oscillator(.STDBY(1'b0), .OSC(fpga_clock), .SEDSTDBY());

	// initialise DAC SPI (Maxim5134)
	DacSPI dac(.clock_in(fpga_clock), .reset(rst), .data_in(dac_data), .send(send), .spi_cs_out(spi_cs), .spi_clock_out(spi_clock), .spi_data_out(spi_data));

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
						dac_data <= {SEND_CHANNEL_A, counter};
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