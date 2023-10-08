module RisingEdge_DFlipFlop(D,clk,Q);
input D; 
input clk; 
output Q; 
always @(posedge clk) 
begin
 Q <= D; 
end 
endmodule 
