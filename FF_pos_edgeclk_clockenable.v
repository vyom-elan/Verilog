module ff(clk,d,ce,q);
	input clk, d, s;
	output q;
	reg q;
	always @(posedge clk)
	begin 
		if(ce)
			q<=d;
	end
endmodule