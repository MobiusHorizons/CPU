module bit_nor(
	clock,
	enable,
	op1,
	op2,
	result
);

	input  clock, enable;
	input  `DATA_WIDTH op1;
	input  `DATA_WIDTH op2;
	output `DATA_WIDTH result;

	wire clock;
	wire enable;
	wire `DATA_WIDTH op1;
	wire `DATA_WIDTH op2;
	reg  `DATA_WIDTH result;

	always @ (posedge clock) begin
		if (enable == 1'b1 ) begin
			result = #2 op1 ~| op2;
		end
	end
endmodule
	
