//replication
//if a=100, b=10 res=100100101010
module des;
	reg [1:0] a;
	reg [2:0] a;
	initial begin 
		a<=2;
		b<=4;
		#10;
		$display("a=%b b=%b res=%b", a, b, {{2{a}}, {3{b}});							//a is repeated twice b is repeated thrice
	end
endmodule