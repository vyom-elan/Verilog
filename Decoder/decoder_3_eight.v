module decoder_3_eight( a,op,en);
  input [2:0]  a;
  input en;
  output [7:0] op;
  reg [7:0] op;
 always @( in or en)
	begin
      if (en) 
        begin
          out=8'd0;
          case (in)
              3'b000: op[0]=1'b1;
              3'b001: op[1]=1'b1;
              3'b010: op[2]=1'b1;
              3'b011: op[3]=1'b1;
              3'b100: op[4]=1'b1;
              3'b101: op[5]=1'b1;
              3'b110: op[6]=1'b1;
              3'b111: op[7]=1'b1;
              default: op=8'd0;
          endcase
        end
  else 
    op=8'd0;
  end
endmodule
