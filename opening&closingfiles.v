module tb;
	integer fd;
	initial begin
		fd=$fopen("my_file.txt","w");
		$fclose(fd);
	end
endmodule