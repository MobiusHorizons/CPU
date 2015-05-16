`include "../add/adder.v"
`include "../subtract/subtracter.v"
`include "../multiply/multiplier.v"
`include "../divide/divider.v"
`include "../invert/inverter.v"
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

output enable_add, enable_sub, enable_mul, enable_div, enable_inv;

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
reg  `DATA_WIDTH result;

reg logic_clock;

wire enable_add;
wire enable_sub;
wire enable_mul;
wire enable_div;
wire enable_inv;
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
  end
end

demux CMD_demux(
	clock,
  enable,
	cmd,
	enable_add,
	enable_sub,
	enable_mul,
  enable_div,
	enable_inv,
	unused,
	unused,
	unused,
	unused,
	unused,
	unused,
	unused,
	unused,
	unused,
	unused,
	unused
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

endmodule
