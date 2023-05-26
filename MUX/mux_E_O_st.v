//Structural level modelling 

module and_gate(output a, input b, c, d, e); 
  assign a = b & c & d & e; 
endmodule

module not_gate(output f, input g); 
  assign f = ~ g; 
endmodule

module or_gate(output l, input m, n, o, p, q, r, s, t); 
  assign l = m | n | o | p | q | r | s | t; 
endmodule

module m81(out, D0, D1, D2, D3, D4, D5, D6, D7, S0, S1, S2); 
  output out; 
  input D0, D1, D2, D3, D4, D5, D6, D7, S0, S1, S2; 
  wire s0bar, s1bar, T1, T2, T3, T4, T5, T6, T7, T8;
  not_gate u1(s1bar, S1);
  not_gate u2(s0bar, S0);
  not_gate u3(s2bar, S2);
  and_gate u4(T1, D0, s0bar, s1bar, s2bar);
  and_gate u5(T2, D1, S0, s1bar, s2bar);
  and_gate u6(T3, D2, s0bar, S1, s2bar);
  and_gate u7(T4, D3, S0, S1, s2bar);
  and_gate u8(T5, D4, s0bar, s1bar, S2);
  and_gate u9(T6, D5, S0, s1bar, S2);
  and_gate u10(T7, D6, s0bar, S1, S2);
  and_gate u11(T8, D7, S0, S1, S2);
  or_gate u12(out, T1, T2, T3, T4, T5, T6, T7, T8);
endmodule
