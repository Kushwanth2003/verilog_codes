module jk_ff(input j,k,reset,clock,output reg q,output qb);
 parameter HOLD=2'b00,
           RESET=2'b01,
	   SET=2'b10,
	   TOGGLE=2'b11;
	   always@(posedge clock)
	   begin
		   if(reset)
			   q<=1'b0;
				
		   else
			begin
			   case({j,k})
				    HOLD:q<=q;
                    RESET:q<=1'b0;
	                SET:q<=1'b1;
	                TOGGLE:q<=~q;
                endcase
            end
	    end
	assign qb=~q;
   endmodule

				   
