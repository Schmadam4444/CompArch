module ALU (A, B, opcode, O, cOut, negative, zero, parity, overflow, clk);
	
	input [31:0] A, B;
	input [6:0] opcode;
	input clk;
	output reg [31:0] O;
	output reg cOut, negative, zero, parity, overflow;
	integer i, parityCount, signedFlag, sameSign;
	 
	always @(posedge clk) begin
	
		case (opcode)
		
			7'b0000000:
				
				O <= A | B; //OR
					
			7'b0000001:
			
				O <= A & B; //AND
			
			7'b0000010:
			
				O <= A ^ B; //XOR
			
			7'b0000011:
			
				O <= A + B; //ADD
				
				
					
			/*
			7'b0000100:
			
				//subtractor
			
			7'b0000101:
			
				//shifter
			*/
		endcase
		
		//NEGATIVE
		negative <= (O[31] == 1)? 1'b1: 1'b0;
		
		//PARITY
		parityCount = 0;
		for (i = 0; i < 32; i = i + 1)
			parityCount = (O[i] == 1)? parityCount + 1: parityCount;
		
			parity <= (parityCount % 2 == 0)? 1'b1: 1'b0;
		
		//OVERFLOW
		signedFlag = (opcode == 7'b0000011)? 1'b1: 1'b0;
		sameSign = (A[31] == B[31])? 1'b1: 1'b0;
		overflow <= (signedFlag == 1'b1 && sameSign == 1'b1 && cOut == 1'b1)? 1'b1: 1'b0;
		
		//ZERO 
		zero <= (O == 32'b0)? 1'b1: 1'b0;
		
	end
	
endmodule
