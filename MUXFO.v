module mux2to1 (input  a, input  b, input  sel, output  y);

    assign y = (sel == 1'b0) ? a : b;

endmodule





module mux4to1_with_true_complement (

    input  [3:0] a,

    input  [3:0] b,

    input  [3:0] c,

    input  [3:0] d,

    input  [1:0] sel,

    output  [3:0] y,

    output  [3:0] y_b);

    wire  [1:0] sel_1, sel_2;

    wire [3:0] ab, cd;

    mux2to1 mux1 (.a(a), .b(b), .sel(sel[1]), .y(ab));

    mux2to1 mux2 (.a(c), .b(d), .sel(sel[1]), .y(cd));

    mux2to1 mux3 (.a(ab), .b(cd), .sel(sel[0]), .y(y));

    mux2to1 mux4 (.a(~ab), .b(~cd), .sel(sel[0]), .y(y_b));

endmodule
