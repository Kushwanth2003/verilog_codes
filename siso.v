module siso(input clk,rst,d_in,output reg q);
	reg [2:0]w;
always@(posedge clk)
	begin
	 if(rst)
	 begin
		q=0;
		w[2:0]=0;
	 end
	else 
	begin
	 	w[2]=d_in;
		 w[1]=w[2];
		 w[0]=w[1];
		 q=w[0];
	end
	end
endmodule

