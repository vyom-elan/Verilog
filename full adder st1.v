#full adder

module FA_st(s,c,a,b,cin);          #cin is the carry from previous o/p
	input a,b,cin;
	output s,c;
	wire N1, N2, N3, N4;
	xor xor1(N1,a,b);
	xor xor2(S,N1,Cin);
	and and1(N2,a,b);
	and and2(N3,b,Cin);
	and and3(N4,Cin,a);
	or or1(c,N2,N3,N4);
endmodule