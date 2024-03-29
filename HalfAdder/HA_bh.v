#half adder for behavioral style design

module HA_bh(s,c,a,b);
	input a,b;
	output reg s,c;
	always@(a,b)
	begin 
		s=a^b;    #for XOR gate
		c=a&b;	  #for AND gate
	end
endmodule
