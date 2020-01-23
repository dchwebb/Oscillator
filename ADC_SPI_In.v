module ADC_SPI_In (reset, spi_nss, spi_clock_in, spi_data_in, data_out, data_received);

	input wire reset;
	input wire spi_nss;
	input wire spi_clock_in;
	input wire spi_data_in;
	output reg [0:15] data_out;
	output reg data_received;
	reg [3:0] receive_bit;

	reg [1:0] SPISlaveState;
	parameter state_waiting = 2'b00;
	parameter state_receiving = 2'b01;
	parameter state_received = 2'b10;

	initial begin
		SPISlaveState = state_waiting;
		data_received = 1'b0;
	end

	always @(posedge spi_clock_in or posedge spi_nss or posedge reset) begin
		if (spi_nss || reset) begin
			SPISlaveState <= state_waiting;
		end
		else begin
			case (SPISlaveState)
				state_waiting:
					begin
						SPISlaveState <= state_receiving;
						receive_bit <= 1'b1;
						data_received <= 1'b0;
						$display("Received bit cleared in waiting %b", data_received);
						data_out[0] <= spi_data_in;
					end

				state_receiving:
					begin
						data_out[receive_bit] <= spi_data_in;
						receive_bit <= receive_bit + 1'b1;
						if (receive_bit == 15) begin
							SPISlaveState <= state_received;
							data_received <= 1'b1;
							$display("Received bit set in receiving %b", data_received);
						end
					end

				state_received:
					begin
						data_received <= 1'b1;
						$display("Received bit set %b", data_received);
						SPISlaveState <= state_waiting;
					end
			endcase
		end
	end

endmodule