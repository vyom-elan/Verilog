module blocking_assignment (
  input logic [7:0] a,
  input logic [7:0] b,
  output logic [7:0] a_swapped,
  output logic [7:0] b_swapped
);
  logic [7:0] temp;
  always_comb begin
    temp = a;
    a_swapped = b;
    b_swapped = temp;
  end
endmodule


