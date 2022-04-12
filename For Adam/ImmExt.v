module ImmExt (in, out, immSel);

	input immSel;
	input [11:0] in;
	output reg [31:0] out;
	
	always @(*) begin
	
		out[11:0] <= in[11:0];
		
		case (in[11])
		
			1'b0: out[31:12] <= 20'b00000000000000000000;
			1'b1: out[31:12] <= 20'b11111111111111111111;
		
		endcase
	
	end

endmodule
