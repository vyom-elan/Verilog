module encoder_4_two(input en, input a, output op)
	input en;
  input[3:0] a;
  output reg[1:0] op;
	always @(en,a)
	begin
		if(en==1)
		begin
      if(a[3]==1) y=2'b11;
      else if(a[2]==1) op=2'b10;
      else if(a[1]==1) op=2'b01;
      else if(a[0]==1) op=2'b00;
			else
			op=2'b00;
		end
		else 
			op=2'bzz;              //enable is zero a high impedance value is given
	end
endmodule
