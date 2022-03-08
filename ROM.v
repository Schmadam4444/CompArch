module ROM(addr, en, romOut);

input [5:0] addr;
reg[31:0] ROM[63:0];
output reg [31:0] romOut;
input en;

	always @(*) begin
	
		while (en) begin

			romOut <= ROM[addr];
			
		end

	end

endmodule
