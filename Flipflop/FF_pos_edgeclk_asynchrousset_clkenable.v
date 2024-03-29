module ff(clk,d,ce,pre,q);
	input clk,ce,pre;
	input [3:0] d;
	output [3:0] q;
	reg [3:0] q;
	always @(posedge clk or posedge pre)
	begin
		if(pre)
			q<=4'b111;
		else if (ce)
			q<=d;
	end
endmodule
