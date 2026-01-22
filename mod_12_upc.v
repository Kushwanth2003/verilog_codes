module up_counter(input clk,reset,load,input [3:0]data_in,output reg [3:0]count);
always@(posedge clk)
begin
	if(reset)
		count<=4'b0000;
	else if(load)
		count<=data_in;
	else if
		(count>=4'b1011)
	        count<=4'b0000;
	else
		count<=count+1'b1;
end
endmodule
