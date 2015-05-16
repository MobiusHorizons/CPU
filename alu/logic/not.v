module bit_not(
	clock,
	enable,
	operand,
	result
);

	input  clock, enable;
	input  `DATA_WIDTH operand;
	output `DATA_WIDTH result;

	wire clock;
	wire enable;
	wire `DATA_WIDTH operand;
	reg  `DATA_WIDTH result;

	always @ (posedge clock) begin
		if (enable == 1'b1 ) begin
			result = #2 ~ operand;
		end
	end
endmodule
	
