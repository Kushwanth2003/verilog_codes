module dual_clk(input clk_1,clk_2,rst,output reg clkout1_2,output clkout1_4,clkout2_3,clkout2_5); 
reg [1:0]count1,count2,neg_count2; 
 reg [2:0]count3,neg_count3;  
 always@(posedge clk_1) 
 begin 
  if(rst) 
   clkout1_2<=0; 
  else 
   clkout1_2<=~clkout1_2; 
 end 
  
 always@(posedge clk_1) 
 begin 
  if(rst) 
   count1<=0; 
  else 
   count1<=count1+1; 
 end 
assign clkout1_4=count1[1]; 
 
 always@(posedge clk_2) 
 begin 
  if(rst) 
   count2<=0; 
  else 
   begin 
    if(count2==2) 
     count2<=0; 
    else 
     count2<=count2+1; 
   end 
 end 
 always@(negedge clk_2) 
 begin 
  if(rst) 
   neg_count2<=0; 
  else 
   neg_count2<=count2; 
 end 
assign clkout2_3=count2[1]|neg_count2[1]; 
 
 always@(posedge clk_2) 
 begin 
  if(rst) 
   count3<=0; 
  else 
   begin 
    if(count3==4) 
     count3<=0; 
    else 
     count3<=count3+1; 
   end 
 end 
 always@(negedge clk_2) 
 begin 
  if(rst) 
   neg_count3<=0; 
  else 
   neg_count3<=count3; 
 end 
assign clkout2_5=count3[1]|neg_count3[1]; 
 
endmodule 
 
TESTBENCH:- 
module dual_clk_tb;  
 // Inputs 
 reg clk_1; 
 reg clk_2; 
 reg rst; 
 reg clk; 
 // Outputs 
 wire clkout1_2; 
 wire clkout1_4; 
 wire clkout2_3; 
 wire clkout2_5; 
 dual_clk dut (.clk_1(clk_1),.clk_2(clk_2),.rst(rst),.clkout1_2(clkout1_2),.clkout1_4(clkout1_4),.clkout2_3(clkout2_3),.clkout2_5(clkout2_5)); 
  
 always 
  begin 
   #5 clk=0; 
   #5 clk=1; 
  end 
 always 
  begin 
   #5 clk_1=0; 
   #5 clk_1=1; 
  end 
 always 
  begin 
   #5 clk_2=0; 
   #5 clk_2=1; 
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
  #10; 
 end 
       
endmodule 