//mux 4x1 structural  modelling

module and_gate(output a, input b, c, d);   //declaring AND gate
assign a = b & c & d;
endmodule

module not_gate(output f, input e); //declaring NOT gate
assign e = ~ f;
endmodule

module or_gate(output l, input m, n, o, p);   //declaring OR gate
assign l = m | n | o | p;
endmodule

module mux_F_O_st(out, a, b, c, d, s0, s1);
  output out;
  input a, b, c, d, s0, s1;
  wire s0bar, s1bar, T1, T2, T3;
  not_gate u1(s1bar, s1);
  not_gate u2(s0bar, s0);
  and_gate u3(T1, a, s0bar, s1bar);
  and_gate u4(T2, b, s0, s1bar);
  and_gate u5(T3, c, s0bar, s1);
  and_gate u6(T4, d, s0, s1);
  or_gate u7(out, T1, T2, T3, T4);
endmodule
