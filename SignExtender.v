module SignExtender(Int, Ext);
	
	input [11:0] Int;
	output reg [31:0] Ext;
	integer i;
	
	always @(*) begin
	
		Ext[11:0] <= Int[11:0];
		
		for(i = 12; i < 32; i = i + 1) begin
			
			Ext[i] <= Int[11];
			
		end
			
	end
	
endmodule
		
	
		