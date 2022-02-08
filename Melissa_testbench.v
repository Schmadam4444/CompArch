module Melissa_testbench();

	reg D, clk, rst, en;
	wire Q;
	
	Melissa test (D, clk, rst, en, Q);
	
	initial begin
		D <= 1'b0;
		clk <= 1'b0;
		rst <= 1'b1;
		en <= 1'b1;
	end
	
	always #10 clk <= ~clk;
	always #25 D <= ~D;

	initial begin
		#750 en <= 1'b0;
		#50 en <= 1'b1;
		#500 rst <= 1'b0;
		#50 rst <= 1'b1;
	end
	
	initial #1500 $stop;
	

endmodule
