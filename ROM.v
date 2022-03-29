module ROM(addr, en, romOut);

input [5:0] addr;
reg[31:0] ROM[63:0];
output reg [31:0] romOut;
input en;
integer i;

	initial begin
		for(i = 0; i < 64; i = i + 1)
			ROM[i] <= i;
	end

	always @(*) begin
	
		if (en) begin

			romOut <= ROM[addr];
			
		end

	end

endmodule
