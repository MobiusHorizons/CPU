`include "width.v"
`include "add/adder.v"
`include "subtract/subtracter.v"
`include "multiply/multiplier.v"
`include "divide/divider.v"
`include "invert/inverter.v"
`include "shift/rshift.v"
`include "shift/lshift.v"
`include "logic/and.v"
`include "logic/or.v"
`include "logic/nand.v"
`include "logic/nor.v"
`include "logic/xor.v"
`include "logic/not.v"
`include "demux_4.v"


module alu (
	clock,
	enable,
	cmd,
	op1,
	op2,
	result
);

	input clock, enable;
	input  [3:0] cmd;
	input  `DATA_WIDTH op1;
	input  `DATA_WIDTH op2;
	output `DATA_WIDTH result;


	wire clock;
	wire enable;
	wire [3:0] cmd;
	wire `DATA_WIDTH op1;
	wire `DATA_WIDTH op2;
	wire `DATA_WIDTH result_add;
	wire `DATA_WIDTH result_sub;
	wire `DATA_WIDTH result_mul;
	wire `DATA_WIDTH result_div;
	wire `DATA_WIDTH result_inv;
	wire `DATA_WIDTH result_rshift;
	wire `DATA_WIDTH result_lshift;
	wire `DATA_WIDTH result_and;
	wire `DATA_WIDTH result_or;
	wire `DATA_WIDTH result_nand;
	wire `DATA_WIDTH result_nor;
	wire `DATA_WIDTH result_xor;
	wire `DATA_WIDTH result_not;
	reg  `DATA_WIDTH result;

	reg logic_clock;

	wire enable_add;
	wire enable_sub;
	wire enable_mul;
	wire enable_div;
	wire enable_inv;
	wire enable_rshift;
	wire enable_lshift;
	wire enable_and;
	wire enable_or;
	wire enable_nand;
	wire enable_nor;
	wire enable_xor;
	wire enable_not;
	wire unused;


	always @ (clock) begin
		#1 logic_clock = clock;
	 	#3 begin
	 		if (enable_add) begin
	    			result = result_add;
	   	 	end
			if (enable_sub) begin
				result = result_sub;
			end
			if (enable_mul) begin
				result = result_mul;
			end
			if (enable_div) begin
				result = result_div;
			end
			if (enable_inv) begin
				result = result_inv;
			end
			if (enable_rshift) begin
				result = result_rshift;
			end
			if (enable_lshift) begin
				result = result_lshift;
			end
			if (enable_and) begin
				result = result_and;
			end
			if (enable_or) begin
				result = result_or;
			end
			if (enable_nand) begin
				result = result_nand;
			end
			if (enable_nor) begin
				result = result_nor;
			end
			if (enable_xor) begin
				result = result_xor;
			end
			if (enable_not) begin
				result = result_not;
			end
	  end
	end

	demux CMD_demux(
		clock,
	  	enable,
		cmd,
		enable_add,	// 0
		enable_sub,	// 1
		enable_mul,	// 2
		enable_div,	// 3
		enable_inv,	// 4
		enable_rshift,	// 5
		enable_lshift,	// 6
		enable_and,	// 7
		enable_or,	// 8
		enable_nand,	// 9
		enable_nor,	// A
		enable_xor,	// B
		enable_not,	// C
		unused,		// D
		unused,		// E
		unused		// F
	);

	adder alu_add(
		logic_clock,
		enable_add,
		op1,
		op2,
		result_add
	);

	subtracter alu_sub(
		logic_clock,
		enable_sub,
		op1,
		op2,
		result_sub
	);

	multiplier alu_mul(
		logic_clock,
		enable_mul,
		op1,
		op2,
		result_mul
	);

	divider alu_div(
		logic_clock,
		enable_div,
		op1,
		op2,
		result_div
	);

	inverter alu_inv(
		logic_clock,
		enable_inv,
		op1,
		result_inv
	);

	rshift alu_rshift(
		logic_clock,
		enable_rshift,
		op1,
		op2,
		result_rshift
	);

	lshift alu_lshift(
		logic_clock,
		enable_lshift,
		op1,
		op2,
		result_lshift
	);

	bit_and alu_and(
		logic_clock,
		enable_and,
		op1,
		op2,
		result_and
	);

	bit_or alu_or(
		logic_clock,
		enable_or,
		op1,
		op2,
		result_or
	);

	bit_nand alu_nand(
		logic_clock,
		enable_nand,
		op1,
		op2,
		result_nand
	);

	bit_nor alu_nor(
		logic_clock,
		enable_nor,
		op1,
		op2,
		result_nor
	);

	bit_xor alu_xor(
		logic_clock,
		enable_xor,
		op1,
		op2,
		result_xor
	);

	bit_not alu_not(
		logic_clock,
		enable_not,
		op1,
		result_not
	);

endmodule
