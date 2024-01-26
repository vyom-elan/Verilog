module mux_2_to_1(a, b, out,outbar, sel);
  input a, b, sel;
  output out, outbar;
  assign out = sel ? a : b;
  assign outbar = ~out;
endmodule
