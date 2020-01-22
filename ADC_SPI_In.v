module ADC_SPI_In (clock, reset, spi_clock_in, spi_data_in, data_out, data_received);
	input wire clock;
	input wire reset;
	input wire spi_clock_in;
	input wire spi_data_in;
	output reg [0:15] data_out;
	output reg data_received;

	reg [11:0] idle_count;
	reg [3:0] receive_bit = 1'b0;
	reg clk_state;

	parameter IDLETIME = 16'h1FF;

	reg [1:0] SPISlaveState;
	parameter state_waiting = 2'b00;
	parameter state_receiving = 2'b01;
	parameter state_received = 2'b10;

	initial begin
		SPISlaveState = state_waiting;
		//receive_bit = 16'b0;
		idle_count = 15'b0;
		data_received = 1'b0;
	end

	always @(posedge clock or posedge reset) begin
		if (reset) begin
			SPISlaveState <= state_waiting;
			receive_bit <= 16'b0;
			idle_count <= 16'b0;
		end
		else begin
			case (SPISlaveState)
				state_waiting:
					if (spi_clock_in == 1'b1) begin
						SPISlaveState <= state_receiving;
						receive_bit <= 0;
						clk_state <= 1'b0;
						data_received <= 1'b0;
						//data_out <= 16'b0;
					end

				state_receiving:
					if (clk_state == 1'b0 && spi_clock_in == 1'b1) begin		// SPI clock transitioning low to high ie halfway through clock cycle
						if (receive_bit == 15)
							SPISlaveState <= state_received;
						data_out[receive_bit] <= spi_data_in;
						receive_bit <= receive_bit + 1'b1;
						clk_state <= 1'b1;
						idle_count <= 15'b0;
					end
					else if (clk_state == 1'b1 && spi_clock_in == 1'b0) begin
						clk_state <= 1'b0;
						idle_count <= 15'b0;
					end
					else if(clk_state == spi_clock_in) begin						// Abort if SPI clock gets stuck in one state before transfer completed
						// provisional error handling for noise on the line
						if (clk_state == 1'b1 && idle_count == 3 && data_out[receive_bit - 1] != spi_data_in) begin
							data_out[receive_bit - 1] <= spi_data_in;
						end
						else
						if (idle_count > IDLETIME)
							SPISlaveState <= state_waiting;
						idle_count <= idle_count + 1'b1;
					end
				
				state_received:
					//if (spi_clock_in == 1'b0)
					begin
						data_received <= 1'b1;
						SPISlaveState <= state_waiting;
					end
			endcase
		end
	end

endmodule