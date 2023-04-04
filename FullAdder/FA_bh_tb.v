/*Test bench to verify full adder design*/
/*For behavioral design*/

'timescale 1ns/100ps'   /*time unit is 1nano second and precision is 100ps*/
module FA_bh_tb;
	reg a,b,cin; /*for input*/
	wire s,c; /*output*/
	FA_bh FA1(s,c,a,b,cin)  ;
	initial
	begin
	$monitor("time=%d \t a=%b \t b=%b \t cin=%b \t s=%b \t c=%b, $time,a,b,cin,s,c")
	a=0;
	b=0;
	cin=0;   
	#10 a=1; /*{a,b,cin}=100->10ns*/
	#10 b=1; /*{a,b,cin}=110->20ns*/
	#10 cin=1; /*{a,b,cin}=111>30ns    these represent the time*/ 
	#10 $stop; /*to suspend the simulation*/
	end
endmodule
