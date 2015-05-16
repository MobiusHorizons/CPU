`include "width.v"
module demux(
clock,
enable,
mux_in,
out_0,
out_1,
out_2,
out_3,
out_4,
out_5,
out_6,
out_7,
out_8,
out_9,
out_A,
out_B,
out_C,
out_D,
out_E,
out_F
);

input clock;
input reset;
input enable;
input [3:0] mux_in;
output out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7;
output out_8, out_9, out_A, out_B, out_C, out_D, out_E, out_F;

wire clock;
wire reset;
wire enable;
wire [3:0] mux_in;

reg out_0;
reg out_1;
reg out_2;
reg out_3;
reg out_4;
reg out_5;
reg out_6;
reg out_7;
reg out_8;
reg out_9;
reg out_A;
reg out_B;
reg out_C;
reg out_D;
reg out_E;
reg out_F;

always @ (posedge clock)
begin : DEMUX

	if (enable == 1'b1) begin
		// reset all one's
		out_0 = 0;
		out_1 = 0;
		out_2 = 0;
		out_3 = 0;
		out_4 = 0;
		out_5 = 0;
		out_6 = 0;
		out_7 = 0;
		out_8 = 0;
		out_9 = 0;
		out_A = 0;
		out_B = 0;
		out_C = 0;
		out_D = 0;
		out_E = 0;
		out_F = 0;

		case (mux_in)
			4'h0: out_0 = 1;
			4'h1: out_1 = 1;
			4'h2: out_2 = 1;
			4'h3: out_3 = 1;
			4'h4: out_4 = 1;
			4'h5: out_5 = 1;
			4'h6: out_6 = 1;
			4'h7: out_7 = 1;
			4'h8: out_8 = 1;
			4'h9: out_9 = 1;
			4'hA: out_A = 1;
			4'hB: out_B = 1;
			4'hC: out_C = 1;
			4'hD: out_D = 1;
			4'hE: out_E = 1;
			4'hF: out_F = 1;
		endcase
	end
end

endmodule
