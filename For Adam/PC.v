module PC (in, clk, out);

	input [5:0] in;
	input clk;
	reg [5:0] PCreg;
	output reg [5:0] out;
	
	always @(posedge clk) begin
	
		PCreg <= in;
		out <= PCreg;
		
	end

endmodule
