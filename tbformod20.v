//testbench for mod 20 counter

module tb;
	reg clk,rstn;
	reg[3:0] out;
	
	mod20_count u0(.clk(clk), .rstn(rstn), .out(out));
	
	always #20 clk=~clk;
	initial begin 
		{clk,rstn}<=0;
		#20 rstn<=1;
		#450 $finish;
	end
endmodule