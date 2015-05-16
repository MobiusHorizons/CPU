`include "inverter.v"
module in_tb();

reg clock, enable;
reg  signed `DATA_WIDTH in;
wire signed `DATA_WIDTH out;

initial begin
	$display( "time\t clk enable in	out");
	$monitor( "%g\t %b	%b	%d	%d",
		$time, clock, enable, in, out);
  in = 0;
	clock = 1;
	enable = 0;
	#10 enable = 1;
	#100 enable = 0;
	#5 $finish;
end

always begin

  #1 if (enable == 1'b1 && clock == 1'b0 ) begin
    in = in + 1;
  end
  #1 clock = ~clock;
end

inverter U_invert (
	clock,
	enable,
  in,
	out
);

endmodule
