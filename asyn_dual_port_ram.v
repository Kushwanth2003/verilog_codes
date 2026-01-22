module asyn_dual_port_ram(clk,rst,we_in,rd_in,we_addr,rd_addr,data_in,data_out);
   input clk,rst,we_in,rd_in;
   input [2:0]we_addr,rd_addr;
   input [15:0] data_in;
   output reg [15:0]data_out;
   reg[15:0]mem[7:0];
   integer i;
   always@(posedge clk or posedge rst)
   begin
	   if(rst)
			begin
				for(i=0;i<8;i=i+1)
			begin
			   mem[i]<=16'b0;
			end
				data_out<=16'b0;
			end
		else
			begin
				if(we_in && !rd_in)
					mem[we_addr]<=data_in;
				else if(!we_in && rd_in)
					data_out<=mem[rd_addr];
		   end
	   end
   endmodule
