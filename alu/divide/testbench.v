`include "divider.v"
module divider_tb();

reg clock, enable;
reg  `DATA_WIDTH op1;
reg  `DATA_WIDTH op2;
wire `DATA_WIDTH result;

initial begin
	$display( "time\t clk enable adder");
	$monitor( "%g\t %b	%b	%d / %d  =%d",
		$time, clock, enable, op1, op2, result);
  op1 = 0;
  op2 = 0;
	clock = 1;
	enable = 0;
	#10 enable = 1;
	#1280 enable = 0;
	#5 $finish;
end

always begin

  #4 if (enable == 1'b1 && clock == 1'b0 ) begin
    if ( op1 == 4'hf) begin // wrap arround
       op1 <= 0;
       op2 <= op2+1;
    end
    else begin
      op1 <= op1 + 1;
    end
  end
  #1 clock = ~clock;
end

divider U_divider (
	clock,
	enable,
  op1,
  op2,
	result
);

endmodule
