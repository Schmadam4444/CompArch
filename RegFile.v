module RegFile(rs1, rs2, readOut1, readOut2, rd, RWen, dataIn, en, clk, reset);

	input [4:0] rs1, rs2; //destrination of read reg
	input [4:0] rd; // address for where value will be written (i or o?)
	output reg [31:0] readOut1, readOut2; //bitstrings read from rs1 and rs2
	input en, clk, reset; // basic
	input RWen; // read enable and write enable
	input [31:0] dataIn; // data written in reg
	reg [31:0] rf[31:0]; // 32 32 bit registers
	integer i; //loop variable


	always @(posedge clk) begin

		if (en) begin
	
			if (reset) begin // loop to set all reg to 0 if reset
		
				for (i=0; i<32; i = i+1) begin
				rf[i] <= 32'b00000000000000000000000000000000;
				end
		
		
			end
		
		
			else if (RWen) begin //read enable
				readOut1 <= rf[rs1];
				readOut2 <= rf[rs2];
			end
		
			
			else if (!RWen) begin //wirte enable
				rf[rd] <= dataIn;
			end
		
		end


	end

endmodule


	
