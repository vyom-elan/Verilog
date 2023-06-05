//Static task

task sum(input[7:0] a, b, output[7:0]c);
  begin 
    c=a+b;
  end
endtask

  task sum;
    input [7:0] a,b;
    output [7:0]c;
    begin
      c=a+b;
    end
  endtask
  initial begin
    reg[7:0] x,y,z;
    sum(x,y,z);
  end
