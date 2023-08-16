module decoder_2_four(input en, input a, output op)
	input en;
  input [1:0] a;
  output reg [3:0] op;
	always @(en,a)
	begin
		if(en==1)
		begin
      if(a==2'b00) op[0]=1;
      else if(a==2'b01) op[1]=1;
      else if(a==2'b10) op[2]=1;
      else if(a==2'b11) op[3]=1;
			else
			op=4'b00;
		end
		else 
			op=4'bzz;              //enable is zero a high impedance value is given
	end
endmodule
