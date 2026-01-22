/*Write an RTL code to generate 40 MHz with 40% duty cycle, 20 MHz with 20% duty cycle and 20 
MHz with 40% duty cycle from the 100MHz input clock signal. Verify the design by driving a 
100MHz clock signal. */
RTL:- 
module clk_divider(input clk,rst,output clk40_40,clk20_20,clk20_40); 
 reg [2:0]count; 
 reg a1,a2,a3; 
always@(posedge clk) 
 begin 
  if(rst) 
   count<=0; 
  else 
   begin 
    if(count==4) 
     count<=0; 
    else 
     count<=count+1; 
   end 
 end 
 always@(posedge clk) 
  begin 
   if(count==0) 
    a1<=1; 
   else 
    a1<=0; 
  end 
 always@(negedge clk) 
  begin 
   if(count==3) 
    a2<=1; 
   else 
    a2<=0; 
  end 
 always@(posedge clk) 
  begin 
   if(count==0 || count==1) 
    a3<=1; 
   else 
    a3<=0; 
  end 
assign clk40_40=a1 | a2; 
assign clk20_20=a1; 
assign clk20_40=a3;  
endmodule 
 
TESTBENCH:- 
module clk_divider_tb; 
 // Inputs 
 reg clk; 
 reg rst; 
 // Outputs 
 wire clk40_40; 
 wire clk20_20; 
 wire clk20_40;  
 clk_divider dut (.clk(clk),.rst(rst),.clk40_40(clk40_40),.clk20_20(clk20_20),.clk20_40(clk20_40)); 
 initial 
  begin 
   clk=0; 
   forever #5 clk=~clk; 
  end 
 task reset(); 
  begin 
   @(negedge clk) 
    rst=1; 
   @(negedge clk) 
    rst=0; 
  end 
 endtask 
 initial 
  begin 
   reset(); 
   #500 $finish; 
  end     
endmodule