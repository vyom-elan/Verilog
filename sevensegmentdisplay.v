module sevensegment (input [3:0] data,
                     output reg [6:0] segment);
  always @ ( * ) 
  case (data) 
  0: segment = 7'b111_1110; 
  1: segment = 7'b011_0000; 
  2: segment = 7'b110_1101;
  3: segment = 7'b111_1001;
  4: segment = 7'b011_0011;
  5: segment = 7'b101_1011;
  default: segment = 7'b111_1110; //display 0 by default
  endcase
endmodule
