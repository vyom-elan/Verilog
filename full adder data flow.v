/*Full adder data flow*/
module FA_df(s,c,a,b,cin);
	output s,c;
	assign s=a^b^cin;
	assign c=a&b|b&cin|cin&a;
endmodule
