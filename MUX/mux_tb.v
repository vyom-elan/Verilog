module mux_tb();
    wire f;
	reg [1:0] sel;
	reg [3:0] a;
    muxfone mux(.f(f), .a(a), .sel(sel));
	initial begin
		a[0] = 1;
        a[1] = 0;
        a[2] = 0;
        a[3] = 1;
        sel[0] = 0;
		sel[1] = 0;
        if (f != 1) $display("Test case 1 failed = %d", f);
		a[0] = 1;
        a[1] = 0;
        a[2] = 0;
        a[3] = 1;
        sel[0] = 0;
        sel[1] = 1;
      if (f != 0) $display("Test case 2 failed= %d", f);
		a[0] = 1;
        a[1] = 0;
        a[2] = 0;
        a[3] = 1;
        sel[0] = 1;
		sel[1] = 0;
      if (f != 0) $display("Test case 3 failed %d", f);
		a[0] = 1;
        a[1] = 0;
        a[2] = 0;
        a[3] = 1;
        sel[0] = 1;
		sel[1] = 1;
      if (f != 1) $display("Test case 4 failed %d", f);	
    $finish;
    end
endmodule
 