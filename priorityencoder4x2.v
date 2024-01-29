module priorityencoderfxt(input wire [3:0] x, output wire [1:0] y, output wire v);
	 assign y =  x[3] ? 2'b11 : x[2] ? 2'b10 : x[1] ? 2'b01 : 2'b00;
	 assign v = ( x[3] | x[2] | x[1] | x[0] ) ? 1'b1 : 1'b0;
endmodule
