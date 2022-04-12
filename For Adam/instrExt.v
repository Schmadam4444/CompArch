module instrExt (in, out);

	input [5:0] in;
	output reg [31:0] out;
	
	always @(*) begin
		out[5:0] <= in[5:0];
		out[31:6] <= 0;
	end

endmodule
