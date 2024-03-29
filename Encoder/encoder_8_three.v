//module code for encoder
//behavioral modelling

module encoder_8_three(input en, input a, output op)
	input en;
	input[7:0] a;
	output reg[2:0] op;
	always @(en,a)
	begin
		if(en==1)
		begin
			if(a[7]==1) y=3'b111;
			else if(a[6]==1) op=3'b110;
			else if(a[5]==1) op=3'b101;
			else if(a[4]==1) op=3'b100;
			else if(a[3]==1) op=3'b011;
			else if(a[2]==1) op=3'b010;
			else if(a[1]==1) op=3'b001;
			else
			op=3'b000;
		end
		else 
			op=3'bzzz;              //enable is zero a high impedance val is given
	end
endmodule
