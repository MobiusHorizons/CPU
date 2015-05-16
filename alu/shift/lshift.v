module lshift(
	clock,
	enable,
	data,
	amount,
	result
);

	input  clock, enable;
	input  `DATA_WIDTH data;
	input  `DATA_WIDTH amount;
	output `DATA_WIDTH result;

	wire clock;
	wire enable;
	wire `DATA_WIDTH data;
	wire `DATA_WIDTH amount;
	reg  `DATA_WIDTH result;

	always @ (posedge clock) begin
		if (enable == 1'b1 ) begin
			result = #2 data << amount;
		end
	end

endmodule
