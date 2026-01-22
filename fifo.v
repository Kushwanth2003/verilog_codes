 module fifo(input clk,rst,wr,rd,input [7:0]data_in,output reg [7:0]data_out,output full,empty);
 reg [4:0]rd_ptr,wr_ptr;
   reg[7:0]mem[15:0];
   assign full=(wr_ptr>15)? 1'b1:1'b0;
   assign empty=(rd_ptr==wr_ptr)? 1'b1:1'b0;
integer i;
   always@(posedge clk)
   begin
	   if(!rst)
	   begin
		   wr_ptr<=0;
		   rd_ptr<=0;
		   for(i=0;i<16;i=i+1)
			   mem[i]=0;
		data_out<=0;
	   end
	   else if(wr && !full)
	   begin
		   mem[wr_ptr]<=data_in;
		   wr_ptr<=wr_ptr+1;
	   end
	   else if(rd && !empty)
	   begin
		   data_out<=mem[rd_ptr];
		   rd_ptr<=rd_ptr+1;
	   end
end
endmodule
