module p4a(a,c,p,q)
	output [3:0]a;
	output c;
	input [3:0]p,q;
	wire c1,c2,c3;			//for inner functionalities
	ha u1(a[0],c1,p[0],q[0]);
	fa u2(a[1],c2,p[1],q[1],c1);
	fa u3(a[2],c3,p[2],q[2],c2);
	fa u4(a[3],c,p[3],q[3],c3);
endmodule