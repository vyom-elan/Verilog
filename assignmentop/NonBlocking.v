module nonblocking_assignment (
  input logic a,
  input logic b,
  output logic a_swapped,
  output logic b_swapped
);
  logic temp;
  always_comb begin
    temp <= a;
    a_swapped <= b;
    b_swapped <= temp;
  end
endmodule
