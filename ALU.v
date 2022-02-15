module ALU (A, B, controlUnitIn, aluOut, cOut, negative, zero, parity, overflow)
	
	input [31:0] A, b;
	input [6:0] controlUnitIn;
	output [31:0] aluOut;
	output cOut, negative, zero, parity, overflow;
	integer i;
	
	always @(*) begin
	
		case (controlUnitIn)
		
			7'b0000000:
				
				aluOut <= A | B;
				
				/* for (i=0; i < 32; i = i + 1) begin
					
					aluOut[i] <= A[i] || B[i];
					
					/*
					if (A[i] == && B[i] == 0)
						aluOut[i] <= 0;
					end
					
					else begin
						aluOut[i] <= 1;
					end
				
				end */
					
			7'b0000001:
			
				aluOut <= A & B;
			
				/* for (i=0; i < 32; i = i + 1) begin
					
					aluOut[i] <= A[i] && B[i];
					
				end	*/
	
			7'b0000010:
			
				aluOut <= A ^ B;
			
				/* for (i=0; i < 32; i = i + 1) begin
					
					aluOut[i] <= A[i] ^ B[i];
					
				end	*/ 
	
			7'b0000011:
			
				for (i=0; i < 32; i = i + 1) begin
					controlUnitIn
				
				// adder
				
			7'b0000100:
			
				//subtractor
			
			7'b0000101:
			
				//shifter
			
		endcase
	
	end
	
endmodule
	
	