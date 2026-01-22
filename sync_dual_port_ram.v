module sync_dual_port_ram(clk,rst,we_in,wr_addr_in,re_in,rd_addr_in,data_in,data_out);
 input[3:0]wr_addr_in;
 input [3:0]rd_addr_in;
 input we_in,re_in,clk,rst;
 input [7:0]data_in;
 output reg [7:0]data_out;
 reg[7:0]mem[15:0];
 integer i;
 always@(posedge clk)
 begin
	if(rst)
	 begin
		 for(i=0;i<16;i=i+1)
		 begin
			 mem[i]<=8'b0;
		 end
			 data_out<=8'b0;
	 end
	else 
	 begin	
	 	if(we_in && !re_in)
			 mem[wr_addr_in]<=data_in;
	
		 else if(!we_in && re_in)
			 data_out<=mem[rd_addr_in];		 
 	 end
 end

 endmodule
