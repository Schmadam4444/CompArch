module Plus4 (in, out);

	input [5:0] in;
	output reg [5:0] out;
	
	always @(*) out <= in + 4;

endmodule
