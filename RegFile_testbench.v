module RegFile_testbench(rs1, rs2, readOut1, readOut2, rd, readEn, writeEn, dataIn, en, clk, reset);

	output reg en, clk, reset, readEn, writeEn;
	output reg [31:0] dataIn;
	output reg [4:0] rd, rs1, rs2;
	output [31:0] readOut1, readOut2;

	RegFile dut (rs1, rs2, readOut1, readOut2, rd, readEn, writeEn, dataIn, en, clk, reset);

		initial begin
			en <= 1'b1; //enable on
			clk <= 1'b0; //clock set to 0
			reset <= 1'b0; //reset set to 0
			readEn <= 1'b0; //read enable off
			writeEn <= 1'b1; //write enable on
			rd <= 5'b00010; //destination register set to 0
			rs1 <= 5'b00001; //source register 1 set to 0
			rs2 <= 5'b00000; //source register 1 set to 0
			dataIn <= 32'b00000000000000000000000000000000; //input data set to 0
			#3050 $stop; //stop at time = 750
		end
		
		
		always #1 clk <= ~clk; //clock cycle 1 ps
		
		always begin
			#10 dataIn <= $random; //random value for dataIn
			rd <= rd + 1; //destination register increment
			#20 writeEn <= 1'b0;
			#30 readEn <= 1'b1;
			#30 writeEn <= 1'b1;
			#20 readEn <= 1'b0;
			rs1 <= rs1 + 1; //destination register increment
			rs2 <= rs2 + 1; //destination register increment
		end
		
		
endmodule
			
			
			
			
	
			
			


