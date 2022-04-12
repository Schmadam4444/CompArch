module Mux6 (in0, in1, sel, out);

	input [5:0] in0, in1;
	input sel;
	output reg [5:0] out;
	
	always @(*) begin
	
		case (sel)
		
			1'b0: out <= in0;
			1'b1: out <= in1;
		
		endcase
	
	end

endmodule
