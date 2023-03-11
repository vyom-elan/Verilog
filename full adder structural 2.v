module FA_st2(s,c,a,b,cin);
	input a,b,cin;
	output s,c;
	wire N1,N2,N3;
	HA_df HA_df_1(N1,N2,a,b);
	HA_df HA_df_2(S3,N3,N1,Cin);
	or or1(c,N2,N3);
endmodule