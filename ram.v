
module ram(input we_in,enable_in,input [3:0]addr_in,inout [7:0]data);				
	reg[7:0]mem[15:0];				 
   always@(data,we_in,enable_in,addr_in)
   begin
      if(we_in && !enable_in)
	    mem[addr_in]=data;
      else
	    mem[addr_in]=mem[addr_in];
   end
   assign data= (enable_in && !we_in) ? mem[addr_in] : 8'hzz;

endmodule 

