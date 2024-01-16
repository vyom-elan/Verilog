module fsm_reac_tmr_test;
  
  
  // Inputs
  reg start;		
  reg stop;  
  reg clock;  
  reg reset_bar;	   
  
  // Outputs
  wire duration;
  wire cheat;
   
  
  // Instantiate the Device Under Test (DUT)
  FSM_REAC_TMR_LOGIC DUT(			
    .START(start),
    .STOP(stop),    
    .CLOCK(clock),
    .RESET_BAR(reset_bar),
    .DURATION(duration),    
    .CHEAT(cheat)
  );
  

  initial begin
    
    // Dump timing diagram information for EPWave viewer
    $dumpfile("dump.vcd");
    $dumpvars(1, fsm_reac_tmr_test);
       
    // initialize the signals
    $display ("  ");
    $display ("====== Test Reaction Timer Logic =======");  
    $display ("  ");

    start = 0;
    stop = 0;
    clock = 0;
   
    #1 reset_tmr();    
    #2 display_status();		// wait for reset
    
    #5 start = 1;
    $display ("Start Pressed. DURATION should go high.");
	#4 display_status();  
    #6 stop  = 1;
    $display ("Stop Pressed after start. DURATION should go low.");    
	#4 display_status();
	#1 start = 0;
	#1 stop = 0;    
    $display ("  ");
    
    #1 reset_tmr();    
    #2 display_status();   
    #5 stop = 1;
    $display ("Stop Pressed before start. CHEAT should go high.");    
	#4 display_status();  
    #6 start  = 1;
	#1 start = 0;
	#1 stop = 0;         
    #1 reset_tmr();    
    #2 display_status();		// wait for reset    
    $display ("  ");
    
    $display ("Now press Stop multiple times through start. CHEAT should go high.");    
    #5 stop = 1;
    #3 stop = 0;
    #3 stop = 1;
    #3 stop = 0;
    #1 start = 1;
    #3 stop = 1;
    #3 stop = 0;
    #3 stop = 1;
    #3 stop = 0;   
	#4 display_status();  
	#1 start = 0;
	#1 stop = 0;           
    #1 reset_tmr();      
    #2 display_status();		// wait for reset    
    $display ("  ");    
    
  	#5 $finish;   
end    

  // set up continuous clock
  always #1 clock = ~clock;  
  
     
    
// reset time
task reset_tmr;
  begin
    #1
    reset_bar = 0;
    #1
    reset_bar = 1;    
    $display ("Timer Logic Reset. DURATION and CHEAT should be low.");
//    $display ("======================");
  end
endtask     

// show LED state
task display_status;
  begin 
    $display ("DURATION = %h; CHEAT = %h", duration, cheat);
//    $display ("======================");
  end
endtask  
  
  
endmodule
