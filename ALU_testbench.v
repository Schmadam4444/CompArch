module ALU_testbench (A, B, opcode, aluOut, carry, flags);

	output reg [31:0] A, B;
	output reg [6:0] opcode;
	output [31:0] aluOut;
	output carry;
	output [4:0] flags;
	
	ALU test (A, B, opcode, aluOut, carry, flags);
	
	initial begin
		{A,B} <= 32'b0;
		opcode <= 7'b011;
	end
	
	always begin 
		#100;
		A <= $random;
		B <= $random;
		opcode <= opcode + 1;
	end
	
	initial #1500 $stop;

endmodule
