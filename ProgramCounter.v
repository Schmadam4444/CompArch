module ProgramCounter(Clk, Write, Result, Next, Reset);
	
	input [31:0] Next;
	input Clk, Write, Reset;
	output reg [31:0] Result;
	
	initial begin
	
		Result <= 32'b00000000;
		
	end
	
	always @(posedge Clk)
	begin
		if (Reset == 1)
		begin
		
			Result <=32'b00000000;
			
		end
		
		else
		
		begin
			
			if (Write == 1) begin
			
				Result <= Next;
			
			end
		end
	end
endmodule