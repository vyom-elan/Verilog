module PISO(D,clk,clr,load,Q);
  input clk,clr,load;
  input [3:0]D;
  output Q;
  reg [3:0] T;
  
  always@(posedge clk or posedge clr)
    begin
      if(clr)
        T<=4'b0000;
      else if (load)
        T<=D;
      else
        begin
          T[1]<=T[0];
          T[2]<=T[1];
          T[3]<=T[2];
        end
    end
  assign Q = T[3];
endmodule
