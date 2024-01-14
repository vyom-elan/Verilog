module CSkipA8(output [7:0] sum, output cout, input [7:0] a, b);
  wire cout0, cout1, e;
  RCA4 rca0(sum[3:0], cout0, a[3:0], b[3:0], 0);
  RCA4 rca1(sum[7:4], cout1, a[7:4], b[7:4], e);
  SkipLogic skip0(e, a[3:0], b[3:0], 0, cout0);
  SkipLogic skip1(cout, a[7:4], b[7:4], e, cout1);
endmodule
