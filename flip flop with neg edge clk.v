module flop(clk,d,clr,q);
	input clk, d, clr;
	output q;
	reg q;
	always @(negedge clk posedge clr)
		begin
			if(clr)
				q <=1'b0;
			else 
				q <=d;
		end
endmodule