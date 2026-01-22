module u_d_c(input clk,reset,load,ctrl,input[3:0]d_in,output reg [3:0]q_out);
always@(posedge clk)
begin
	if(reset)
		q_out<=4'b0000;
	else if (load)
		q_out<=d_in;
	else if(ctrl==1)
	begin
		if(q_out==4'b1111)
			q_out<=4'b0000;
		else
			q_out<=q_out+1'b1;
	end
	else
	begin
		if(q_out==4'b0000)
			q_out<=4'b1111;
		else
			q_out<=q_out-1'b1;
	end
end
endmodule
	
