/*counter*/

module up_counter(Ct,rst,clk);
	input clk,rst;
	output[7:0] Ct;
	reg[7:0] Ct_temp;					/*temp variable for counter*/
	always@(posedge clk)
		if(!rst)
			ct_temp<=8'd0;
		else
			ct_temp<=ct_temp+1;
	assign count = ct_temp;
endmodule
