module ROM_testbench(addr, en, romOut);
	
	output reg [4:0] addr;
	output reg [31:0] romOut;
	output reg en;
	
	
	ROM dut (addr, en, romOut);
		
		initial begin 
			en <= 1'b1;
			addr <= 5'b00000;
			#1000 $stop;
		end
		
		always begin
			#10 addr <= addr + 1;
		end
		
endmodule
			
			
		
	
	