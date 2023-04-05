#half adder dataflow design style

module HA(s,c,a,b);          #s=sum, c=carry, a=input 1, b=input 2
input a,b;
output s,c;
assign s=a^b;
assign c=a&b;
endmodule
