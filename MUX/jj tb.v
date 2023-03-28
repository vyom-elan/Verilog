module tb_jk;
	reg j;
	reg k;
	reg clk;
	always35 clk=~clk;
	jk_ff jk0(.j(j),
			.k(k),
			.clk(clk),
			.q(q));
	initial begin
	j<=0;
	k<=0;
	#5j<=0;