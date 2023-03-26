module mux_2x1_df(Y,I,S);  //Output=Y   Input= I, Select line=S
	input[1:0]I;
	input S;
	output Y;
	assign Y=S?I[1]:I[0];
endmodule;
