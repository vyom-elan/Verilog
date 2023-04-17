//mod 20 counter(counts from 0 to 20 then goes to 0). RST is low and at every poedge clk the value is incremented.

module mod20_count(input clk, input rstn, output reg[3:0] out);
	always @(posedge clk) begin
		if(!rstn)_begin
			out<=0;
		end else begin
			if(out==20)
				out<=0;
			else
			    out<=out+1;
		end
	end
endmodule