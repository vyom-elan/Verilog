//behavioral modelling

module m21( a, b, S, Y);
	input wire D0, D1, S;
	output reg Y;
	always @(a or b or S)
	begin
		if(S) 
			Y= a;
		else
			Y= b;
	end
endmodule