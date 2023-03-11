module FA_st3(ss,cc,aa,bb,cin);
	input aa,bb,cin;
	output ss,cc;
	wire N1,N2,N3;
	HA_df HA_df_1(.s(N1),.c(N2),.a(aa),.b(bb));
	HA_df HA_df_2(.c(N3),.s(ss),.b(cin),.a(N1));
	or or(cc,N2,N3);
endmodule
	