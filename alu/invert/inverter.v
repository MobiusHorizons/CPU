module inverter(
clock,
enable,
data_in,
data_out
);

input clock;
input reset;
input enable;

input  `DATA_WIDTH  data_in;
output `DATA_WIDTH data_out;

wire clock;
wire reset;
wire enable;

wire `DATA_WIDTH data_in;
reg  `DATA_WIDTH data_out;




always @ (posedge clock)
begin : INV

	if (enable == 1'b1) begin
		data_out = #1 0 - data_in;
	end
end

endmodule
