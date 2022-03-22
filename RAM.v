module RAM (RW, EN, addr, in, out);

	input RW, EN;
	input [31:0] addr;
	input [31:0] in;
	reg [31:0] RAM[255:0];
	output reg [31:0] out;

	always @(*) begin
	
		if (EN) begin
			
			case(RW)
				
				1'b0: out <= RAM[addr];
				1'b1: RAM[addr] <= in;
				
			endcase
		end
	end
endmodule
 