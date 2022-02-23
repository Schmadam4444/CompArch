module ALU (A, B, controlUnitIn, aluOut, carry, cOut, negative, zero, parity, overflow);
	
	input [31:0] A, B;
	input [6:0] controlUnitIn;
	output reg [31:0] aluOut;
	output carry, cOut, negative, zero, parity, overflow;
	integer i;
	
	always @(*) begin
	
		case (controlUnitIn)
		
			7'b0000000: //OR
				
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
					
			7'b0000001: //AND
			
				aluOut <= A & B;
			
				/* for (i=0; i < 32; i = i + 1) begin
					
					aluOut[i] <= A[i] && B[i];
					
				end	*/
	
			7'b0000010: //XOR
			
				aluOut <= A ^ B;
			
				/* for (i=0; i < 32; i = i + 1) begin
					
					aluOut[i] <= A[i] ^ B[i];
					
				end	*/ 
	
			7'b0000011: // adder
			;
			/*	for (i=0; i < 32; i = i + 1) begin
				
					if (A[i] == 0 && B[i] == 0 && carry == 0) begin
						aluOut[i] <= 1'b0;
						carry <= 1'b0;
					end
					
					if((A[i] == 1 && B[i] == 0 && carry == 0)) || (A[i] == 0 && B[i] == 1 && carry == 0) || (A[i] == 0 && B[i] == 0 && carry == 1)) begin
						aluOut[i] <= 1'b1;
						carry <= 1'b0;
					end 
					
					if((A[i] == 1 && B[i] == 1 && carry == 0)) || (A[i] == 0 && B[i] == 1 && carry == 1) || (A[i] == 1 && B[i] == 0 && carry == 1)) begin
						aluOut[i] <= 1'b0;
						carry <= 1'b1;
					end 
					
					if (A[i] == 1 && B[i] == 1 && carry == 1) begin
						aluOut[i] <= 1'b1;
						carry <= 1'b1;
					end
						
				end */
				
			7'b0000100:
			
			;
				//subtractor
			
			7'b0000101: //up shifter (x2)
			
				/* for (i = 30; i > 0; i = i - 1) begin
					A[i] <= A[i-32'b1];
				end
				
				A[0] <= 0; */
				
				aluOut <= A << 1;
				
			7'b0000110: //down shifter (/2)
			
				/* for (i = 0; i < 30; i = i + 1) begin
					A[i] <= A[i + 1'b1];
				end
				A[30] <= 0; */
				
				aluOut <= A >> 1;
				
			
		endcase
	
	end
	
endmodule
	
	