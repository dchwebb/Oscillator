module SPISlave (clock, reset, SPIClk, SPIData, data_out, data_received);
	input wire clock;
	input wire reset;
	input wire SPIClk;
	input wire SPIData;
	output reg [15:0] data_out;
	output reg data_received;

	reg [15:0] idle_count;
	reg [3:0] receive_bit;
	reg clk_state;

	parameter IDLETIME = 16'h1FF;

	reg [1:0] SPISlaveState;
	parameter state_waiting = 2'b00;
	parameter state_receiving = 2'b01;
	parameter state_received = 2'b10;

	initial begin
		SPISlaveState = state_waiting;
		receive_bit = 16'b0;
		idle_count = 15'b0;
		data_received = 1'b0;
	end

	always @(posedge clock or posedge reset) begin
		if (reset) begin
			SPISlaveState <= state_waiting;
			receive_bit <= 16'b0;
			idle_count <= 15'b0;
		end
		else begin
			case (SPISlaveState)
				state_waiting:
					if (SPIClk) begin
						SPISlaveState <= state_receiving;
						receive_bit <= 0;
						clk_state <= 1'b0;
						data_received = 1'b0;
					end

				state_receiving:
					if (clk_state == 1'b0 && SPIClk == 1'b1) begin		// SPI clock transitioning low to high ie halfway through clock cycle
						if (receive_bit == 15)
							SPISlaveState <= state_received;
						data_out[receive_bit] <= SPIData;
						receive_bit <= receive_bit + 1'b1;
						clk_state <= 1'b1;
						idle_count <= 15'b0;
					end
					else if (clk_state == 1'b1 && SPIClk == 1'b0) begin
						clk_state <= 1'b0;
						idle_count <= 15'b0;
					end
					else if(clk_state == SPIClk) begin						// Abort if SPI clock gets stuck in one state before transfer completed
						if (idle_count > IDLETIME)
							SPISlaveState <= state_waiting;
						idle_count <= idle_count + 1'b1;
					end
				state_received:
					if (SPIClk == 1'b0) begin
						data_received = 1'b1;
						SPISlaveState <= state_waiting;
					end
			endcase
		end
	end

endmodule