module BranchComparator(A, B, Beq, Blt);

	input [31:0] A, B;
	output reg Blt, Beq;
	
	always @(*) begin
	
		if (A > B) begin
			
			Blt <= 1'b0;
			Beq <= 1'b0;
		
		end
		
		if (A == B) begin
		
			Blt <= 1'b0;
			Beq <= 1'b1;
			
		end
		
		if (A < B) begin
		
			Blt <= 1'b1;
			Beq <= 1'b0;
			
		end
		
	end
	
endmodule
