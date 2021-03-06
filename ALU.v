module ALU (A, B, opcode, aluOut, carry, flags);
	
	input [31:0] A, B;	//two input words
	reg [32:0] C; //intermediary for addition carry
	reg [31:0] intB;
	input [6:0] opcode; //opcode
	output reg [31:0] aluOut; //output value after operation
	output reg carry = 1'b0; //used for adder/subtractor
	output reg [4:0] flags; //cOut, negative, zero, parity, overflow;
	integer i; //looping variable
	integer parityCount, sameSign, signedFlag;
	
	always @(*) begin
	
		case (opcode)
		
			7'b0000000: //OR
				
				aluOut <= A | B;
					
			7'b0000001: //AND
			
				aluOut <= A & B;
	
			7'b0000010: //XOR
			
				aluOut <= A ^ B;
			
			7'b0000011: begin // adder
			
				aluOut <= A + B;
				C <= {1'b0, A} + {1'b0, B};
				carry <= C[32];
				
			end
			
			7'b0000100: begin //subtractor
			
				aluOut <= A - B;
				C <= {1'b0, A} - {1'b1, B};
				carry <= C[32];
			
			end
			
			7'b0000101: //up shifter (x2)
				
				aluOut <= A << 1;
				
				
			7'b0000110: //down shifter (/2)
				
				aluOut <= A >> 1;
				
			7'b0000111: //Adds 1
			
				aluOut <= A + 1'b1;
			
			7'b0001000: //Subtracts 1
			
				aluOut <= A - 1'b1;
			
			7'b0001001: //Outputs 0 word
			
				aluOut <= 32'b0;
			
			7'b0001010: //NOT
			
				aluOut <= ~A;
			
			7'b0001011: //Outputs value
				
				aluOut <= A;
				
			7'b0001100: //Makes negative
				
				aluOut <= ~A + 1'b1;
				
		endcase
	
	//cOut
		flags[4] <= carry;
	
	//NEGATIVE
		flags[3] <= (aluOut[31] == 1)? 1'b1: 1'b0;
		
		
	//ZERO 
		flags[2] <= (aluOut == 32'b0)? 1'b1: 1'b0;
	

	//PARITY
	parityCount = 0;
	for (i = 0; i < 32; i = i + 1)
		parityCount = (aluOut[i] == 1)? parityCount + 1: parityCount;

		flags[1] <= (parityCount % 2 == 0)? 1'b1: 1'b0;

	//OVERFLOW
	signedFlag = (opcode == 7'b0000011)? 1'b1: 1'b0;
	sameSign = (A[31] == B[31])? 1'b1: 1'b0;
	flags[0] <= (signedFlag == 1'b1 && sameSign == 1'b1 && carry == 1'b1)? 1'b1: 1'b0;
		
	end
	
endmodule
