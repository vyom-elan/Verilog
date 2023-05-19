//gate level modelling
module muxfourgtlvl(out, a, b, c, d, s0, s1);
  output out;
  input a, b, c, d, s0, s1;
  wire sobar, s1bar, y1, y2, y3, y4;
  not (s0bar, s0), (s1bar, s1);
  and (y1, a, s0bar, s1bar), (y2, b, s0bar, s1),(y3, c, s0, s1bar), (y4, d, s0, s1);
  or(out, y1, y2, y3, y4);
endmodule
