module RegFile_testbench(rs1, rs2, readOut1, readOut2, rd, readEn, writeEn, dataIn, en, clk, reset);

	output reg en, clk, reset, readEn, writeEn;
	output reg [31:0] dataIn;
	output wire [4:0] rd, rs1, rs2;
	output wire [31:0] readOut1, readOut2;

	/* reg [31:0] rf[31:0]; 32 32 bit registers
	integer i; loop variable */

	RegFile dut (en, clk, reset, readEn, writeEn, dataIn, rd, readOut1, readOut2)

		initial begin
			en <= 1'b1
			clk <= 1'b0
			reset <= 1'b0
			readEn <= 1'b1
			writeEn <= 1'b1
			rd <= 5'b00000
			dataIn <= 32'b00000000000000000000000000000001;
			
		end
		
		
		always #10 clk <= ~clk
		
		initial begin
			for(rd = 0, rd < 32, rd = rd + 1) begin
				rf[rd] <= dataIn;
			end
		end
			
		initial begin
			for(rs1 = 0
			
			


