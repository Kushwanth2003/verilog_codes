module fsm(clk,rst,ser_in,out); 
input clk,rst,ser_in; 
output reg out; 
reg dout; 
reg [1:0]count,neg_count; 
reg [2:0]state,next_state; 
wire new_clk; 
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100; 
always@(posedge clk) 
begin 
 if(rst) 
 count<=0; 
 else 
 begin 
  if(count==2) 
  	count<=0; 
  else 
  	count<=count+1; 
 end 
end 
always@(negedge clk) 
begin 
 if(rst) 
 	neg_count<=0; 
 else 
	 neg_count<=count; 
end 
assign new_clk=count[0]|neg_count[0]; 
always@(posedge new_clk) 
begin 
 if(rst) 
	 state<=s0; 
 else 
 	state<=next_state; 
end 
always@(state,ser_in) 
begin 
 case(state) 
 s0:begin 
 	if(ser_in==1) 
     	 begin 
  		next_state=s1; 
  		dout=0; 
     	 end 
	else 
 	 begin 
  	   next_state=s0; 
 		 dout=0; 
 	 end 
    end 
 s1:begin 
 	if(ser_in==0) 
 	 begin 
  		next_state=s2; 
 		 dout=0; 
	  end 
	 else 
 	   begin 
 		 next_state=s1; 
 		 dout=0; 
          end 
    end 
 s2:begin 
 	if(ser_in==1) 
	  begin 
  		next_state=s3; 
  		dout=0; 
 	 end 
 	else 
  	  begin 
  		next_state=s0; 
  		dout=0; 
  	  end 
    end 
 s3:begin 
 	if(ser_in==1) 
  	  begin 
  		next_state=s1; 
  		dout=1; 
 	  end 
 	else 
  	  begin 
  		next_state=s2; 
  		dout=0; 
  	  end 
    end 
 	default:next_state=s0; 
 endcase 
end 
always@(posedge new_clk) 
begin 
 if(rst) 
	 out<=1'b0; 
 else 
 	out<=dout; 
end 
endmodule 
 
module fsm_tb(); 
reg clk,ser_in,rst; 
wire out; 
fsm dut(clk,rst,ser_in,out); 
task reset(); 
   begin 
	@(negedge clk) 
	rst=1'b1; 
	@(negedge clk) 
	rst=1'b0; 
   end 
endtask 
task stim(input a); 
  begin 
	@(negedge dut.new_clk) 
	ser_in=a;   
  end 
endtask 
initial 
begin 
	clk=0; 
	forever #16.6 clk=~clk; 
end 
initial begin 
reset;#200; 
stim(0); 
#100; 
stim(0); 
stim(1);stim(0);stim(1);stim(1); 
#2000 $finish; 
end 
endmodule