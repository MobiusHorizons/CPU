`include "../alu/width.v"
module first_counter(
clock,
reset,
enable,
counter_out
);

input clock;
input reset;
input enable;

output `DATA_WIDTH counter_out;

wire clock;
wire reset;
wire enable;

reg `DATA_WIDTH counter_out;




always @ (posedge clock)
begin : COUNTER
	if(reset == 1'b1) begin
		counter_out <= #1 4'b0000;
	end

	else if (enable == 1'b1) begin
		counter_out <= #1 counter_out + 1;
	end
end

endmodule
