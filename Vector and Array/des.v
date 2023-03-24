module des();
	reg[7:0] mem1;
	reg[7:0] mem2 [0:3];
	reg[15:0] mem3 [0:3][0:1];
	intial begin
		int i;
		mem1=8'ha9;
		$display("mem1=0x%0h", mem1);
		mem2[0]=8'haa;
		mem2[1]=8'hbb;
		mem2[2]=8'hcc;
		mem2[3]=8'hdd;
		for(i=0;i<4;i=i+1)begin
			$display("mem2[%0d]=0x%0h", i, mem2[i]);
		end
		for(int i=0; i<4; i=i+1)
		begin
			$display("mem2[%0d] = 0x%0h", i, mem2[i]);
		end
		for(int i=0; i<4; i=i+1)begin
			for(int j=0; j<4; j=j+1)begin
				mem3[i][j]=i+j;
				$display("mem3[%0d][%0d]=0x%oh", i, j, mem3[i][j]);
			end
		end
	end
endmodule