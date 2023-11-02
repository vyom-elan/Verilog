module priorityencoder(y,a,b,c,d);
  input [0:7] y;
  output reg a,b,c,d;
  always@(*)
    begin
      casex(y)
        8'b00000000 : begin {a,b,c} = 3'b000; d = 1'b0; end
        8'b10000000 : begin {a,b,c} = 3'b000; d = 1'b1; end
        8'bx1000000 : begin {a,b,c} = 3'b001; d = 1'b1; end
        8'bxx100000 : begin {a,b,c} = 3'b010; d = 1'b1; end
        8'bxxx10000 : begin {a,b,c} = 3'b011; d = 1'b1; end
        8'bxxxx1000 : begin {a,b,c} = 3'b100; d = 1'b1; end
        8'bxxxxx100 : begin {a,b,c} = 3'b101; d = 1'b1; end
        8'bxxxxxx10 : begin {a,b,c} = 3'b110; d = 1'b1; end
        8'bxxxxxxx1 : begin {a,b,c} = 3'b111; d = 1'b1; end
        default begin {a,b,c} = 3'b000; d=1'b0; end
        endcase
    end
endmodule
