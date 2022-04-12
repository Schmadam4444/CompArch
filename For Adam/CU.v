module CU(word, Bsel, Asel, PCsel, REGwen, IMMsel, BRun, ALUop, WBsel, MEMrw, Q6, Beq, Blt);

	input [31:0] word;
	input Beq, Blt;
	input [4:0] Q6;
	output reg [6:0] ALUop;
	output reg Bsel, Asel, PCsel, REGwen, IMMsel, BRun, WBsel, MEMrw;
	
	always @(*) begin
		
		if (word[6:0] < 7'b0001101) begin
		
			IMMsel <= 1'b0;
			Bsel <= 1'b0;
		
		end
		
		if (word[6:0] > 7'b0001100) begin//I-Type instructions all have an opcode value larger than all the R-Type instructions in our system
		
			IMMsel <= 1'b1;
			Bsel <= 1'b1;
		
		end
		

		if (word[6:0] < 7'b0001111) begin//I made LW and SW have the opcode 0001101 and 0001110
		
			Asel <= 1'b0; //Asel is 1 for branch
		
		end
		
		if (word[6:0] > 7'b0001110) begin//I made LW and SW have the opcode 0001101 and 0001110
		
			Asel <= 1'b1; //Asel is 1 for branch
		
		end

		
		BRun <= 1'b1; //Always comparing unsigned #s?
		
		ALUop <= word[6:0]; //opcode is 7 LSBs of the instruction word
		
		if ((word[6:0] < 7'b0001101) || (word[6:0] > 7'b0001110)) begin//for all non LW/SW instructions
		
		MEMrw <= 1'b1; // Read from memory so we don't overwrite
		WBsel <= 1'b1; //Choose ALU value
		
		end
		
		
		if (word[6:0] == 7'b0001101) begin
		
			MEMrw <= 1'b1; //If instruction is LW, we read from the memory
			WBsel <= 1'b0; //Choose to write back memory value
		
		end
		
		
		if (word[6:0] == 7'b0001110) begin//Write for LW
		
			MEMrw <= 1'b0; //Write to memory
			WBsel <= 1'b1; //Don't care, ALU won't take write back
		
		end
		
		if (word[6:0] < 7'b0001111) begin//For any instruction besides branching
		
			PCsel <= 1'b0;
			
		end
		
		
		if (word[6:0] == 7'b0001111) begin//Beq definition for PCsel
		
			if (Beq == 1'b1) begin
			
				PCsel <= 1'b1;
				
			end 
			
			else begin
				
				PCsel <= 1'b0;
				
			end
		
		end
		
		
		if (word[6:0] == 7'b0010000) begin//Bne definition for PCsel
		
			if (Beq != 1'b1) begin
			
				PCsel <= 1'b1;
			
			end
			
			else begin
				
				PCsel <= 1'b0;
			
			end
		
		end
		
		
		if (word[6:0] == 7'b0010001) begin//Bge definition for PCsel
		
			if (Blt == 1'b0) begin
			
				PCsel <= 1'b1;
				
			end
			
			else begin
				
				PCsel <= 1'b0;
				
			end
		
		end
		
		if (word[6:0] == 7'b0010010) begin//Blt definition for PCsel
		
			if (Blt == 1'b1) begin
				
				PCsel <= 1'b1;
				
			end
			
			else begin
			
				PCsel <= 1'b0;
			
			end
		
		end
		
		if (word[19:15] == Q6) begin
			
			REGwen <= 1'b1;
			
		end
		
		else begin
		
			REGwen <= 1'b0;
			
		end
		
		
	end
	
endmodule
