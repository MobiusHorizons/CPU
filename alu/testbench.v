`include "alu.v"
module calc_f2c;

reg clock, enable;
reg  `DATA_WIDTH opperand;
reg  [3:0] cmd;
reg   signed `DATA_WIDTH accumulator;
wire  signed `DATA_WIDTH out;


wire `DATA_WIDTH result;

initial begin
	$display( "time\t clk	enable	cmd	 op1	acc	 out -- add sub mul div inv");

	$monitor( "%g:\t%b\t%b\t%d\t%d\t%d\t%d",
		$time, clock, enable, cmd, opperand, accumulator, out);
	accumulator = 50;
	opperand = 32;
	cmd = 4'h1;
	clock = 0;
	enable = 0;
	#4 enable = 1;
	#1 clock = 1;
	#5 clock = 0;

	#3 begin
		accumulator = out;
		opperand = 5;
		cmd = 4'h2;
	end
	#2 clock = 1;
	#5 clock = 0;

	#3 begin
		accumulator = out;
		opperand = 9;
		cmd = 4'h3;
	end
	#2 clock = 1;
	#5 clock = 0;
	accumulator = out;
	cmd = 4'h4;
	#5 clock = 1;
	#5 clock = 0;
	#5 enable = 0;
	#5 $finish;
end

//always begin
//  #5 clock = ~clock;
//end

alu U_alu (
	clock,
	enable,
	cmd,
	accumulator,
  opperand,
	out
);

endmodule
