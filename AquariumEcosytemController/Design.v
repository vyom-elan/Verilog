`timescale 1ns/1ps
module AquariumController(input [7:0] temperature_sensor,
    					  input [7:0] humidity_sensor,
    					  input waterlvl_sensor,
                          input clk,
    					  output pump_control,
    					  output [7:0] display_data);
  	reg [7:0] temperature;
  	reg [7:0] humidity;
  	reg [7:0] desired_temperature;
  	reg [7:0] desired_humidity;
    reg waterlvl_pos;  //positive - means more water can be stored in the tank
    reg pump_on;
    always @(posedge clk) 
    begin
        temperature <= temperature_sensor;
        humidity <= humidity_sensor;
      if (temperature < desired_temperature && humidity < desired_humidity && waterlvl_pos) 
        begin
            pump_on <= 1'b1;
        end 
        else 
        begin
            pump_on <= 1'b0;
        end
    end
    assign pump_control = pump_on;
endmodule
