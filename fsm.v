module fsm(input clk,rst,seq_in,output reg d_out);
reg[2:0]state,next_state;
parameter s0=3'b000,
			s1=3'b001,
			s2=3'b010,
			s3=3'b011,
			s4=3'b100;
  always@(posedge clk)
  begin
	  if(rst)
		  next_state<=s0;
	  else
		  state<=next_state;
		  end
	  always@(state,seq_in)
	  begin
		  next_state=s0;
		  case(state)
			  s0:if(seq_in==1)next_state=s1;
			  else next_state=s0;
			  s1:if(seq_in==1)next_state=s2;
			  else next_state=s0;
			  s2:if(seq_in==0)next_state=s3;
			  else next_state=s2;
			  s3:if(seq_in==1)next_state=s4;
			  else next_state=s0;
			  s4:if(seq_in==1)next_state=s2;
			  else next_state=s0;
		  endcase
  end
  always@(posedge clk)
  begin
	case(state)
	  s0:begin
		  if(seq_in==1)
		  begin
			  d_out=0;
		  end
		  else
		  begin
			  d_out=0;
		  end
	  end
	   s1:begin
		  if(seq_in==1)
		  begin
			  d_out=0;
		  end
		  else
		  begin
			  d_out=0;
		  end
	  end
	   s2:begin
		  if(seq_in==0)
		  begin
			  d_out=0;
		  end
		  else
		  begin
			  d_out=0;
		  end
	  end
	   s3:begin
		  if(seq_in==1)
		  begin
			  d_out=0;
		  end
		  else
		  begin
			  d_out=0;
		  end
	  end
	   s4:begin
		  if(seq_in==1)
		  begin
			  d_out=1;
		  end
		  else
		  begin
			  d_out=0;
		  end
	  end
	  endcase
	  end
	  endmodule
