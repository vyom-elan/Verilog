module CSkipfour(cout,S,A,B,cin);
    output [3:0]S;
    output cout;
    input [3:0]A,B;
    input cin;
    wire c1,c2,c3,c4,P0,P1,P2,P3;
    full_adder F1(S[0],c1,A[0],B[0],CIN);
    full_adder F2(S[1],c2,A[1],B[1],c1);
    full_adder F3(S[2],c3,A[2],B[2],c2);
    full_adder F4(S[3],Cout,A[3],B[3],c3);
    and g0(p0,A[0],B[0]);
    and g1(p1,A[1],B[1]);
    and g2(p2,A[2],B[2]);
    and g3(p3,A[3],B[3]);
 mux2x1 m1(cout1,c3,cout,se1); //seperate mux module
 endmodule;
