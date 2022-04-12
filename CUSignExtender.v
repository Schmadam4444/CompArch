module CUSignExtender(In, Out)

	input [5:0] In;
	output [31:] Out;
	
	Out[5:0] <= In[5:0];
	Out[31:0] <= 1'b0;
	
endmodule

