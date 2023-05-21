//Mux 8x1 dataflow modelling

module mux_E_O_df(input D0, D1, D2, D3, D4, D5, D6, D7, S0, S1, S2, output out);
  wire T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11;
  not(T1, S0);
  not(T2, S1);
  not(T3, S2);
  and(T4, D0, T1, T2, T3), (T5, D1, S0, T2, T3);
  and(T6, D2, T1, S1, T3), (T7, D3, S0, S1, T3);
  and(T8, D4, T1, T2, S2), (T9, D5, S0, T2, S2);
  and(T10, D6, T1, S1, S2), (T11, D7, S0, S1, S2);
  or(out, T4, T5, T6, T7, T8, T9, T10, T11);
endmodule
