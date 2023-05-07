module gt_mux(op,a,b,sel);
  output op;
  input sel,a,b;
  wire w1,w2,selb;
  and(w1,b,sel),(w2,a,selb);
  not(selb,sel);
  or(op,w1,w2);
endmodule
