//Nested Replication

module rep;
	reg[1:0] a;
	reg[2:0] b;
	intial begin
		a<=2;
		b<=4;
		#10;
		$display("a=%b b=%b res=%b", a, b, {a, b, 3'b000, {{2{a}}, {3{b}}}});
	end
endmodule
	