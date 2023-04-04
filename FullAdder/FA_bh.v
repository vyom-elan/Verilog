/*behavioral full adder*/

module FA_bh(s,c,a,b,cin);	
	input a,b,cin;
	output reg s,c;
	always@(*)
	begin
		s=a^b^cin;
		c=a&b|b&cin|cin&a;
	end
endmodule
