module OR(input a,b,
          output y);
  supply1 vdd;
  supply0 gnd;
  wire t1;
  wire t2;
  pmos p1(t1,vdd,a);
  pmos p2(t2,t1,b);
  nmos n1(t2,gnd,a);
  nmos n2(t2,gnd,b);
  pmos p3(y,vdd,t2);
  nmos n3(y,gnd,t2);
endmodule

