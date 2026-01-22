//Divisible by 9 fsm
//RTL
module divisible_by_9(input clk,rst,seq,output reg out);
reg [3:0]state,nextstate;
parameter s0=4'b0000,
			 s1=4'b0001,
			 s2=4'b0010,
			 s3=4'b0011,
			 s4=4'b0100,
			 s5=4'b0101,
			 s6=4'b0110,
			 s7=4'b0111,
			 s8=4'b1000;
always@(posedge clk)
	begin
		if(rst)
			state<=s0;
		else
			state<=nextstate;
	end
always@(*)
	begin
		case(state)
			s0:if(!seq)
					nextstate=s0;
					else
					nextstate=s1;
			s1:if(seq)
					nextstate=s3;
					else
					nextstate=s2;
			s2:if(seq)
					nextstate=s5;
					else
					nextstate=s4;
			s3:if(seq)
					nextstate=s7;
					else
					nextstate=s6;
			s4:if(seq)
					nextstate=s0;
					else
					nextstate=s8;
			s5:if(seq)
					nextstate=s2;
					else
					nextstate=s1;
			s6:if(seq)
					nextstate=s4;
					else
					nextstate=s3;
			s7:if(seq)
					nextstate=s6;
					else
					nextstate=s5;
			s8:if(seq)
					nextstate=s8;
					else
					nextstate=s7;
			default:nextstate=s0;
		endcase
		
	end
	always @(posedge clk)
	begin
	if(rst)
	out<=1'b0;
	else
	begin
	case(state)
	s0:if(!seq)
			out<=1'b1;
			else
			out<=1'b0;
	s4:if(seq)
			out<=1'b1;
			else
			out<=1'b0;
		endcase
	end
	end
endmodule
//Test bench
module divisible_by_9_tb();
	reg clk;
	reg rst;
	reg seq;
	wire out;
	divisible_by_9 dut (.clk(clk),.rst(rst),.seq(seq),.out(out));
	initial 
		begin
			clk=0;
			forever #5 clk=~clk;
		end
		task reset();
		begin
			@(negedge clk)
			rst=1;
			#10;
			@(negedge clk)
				rst=0;
			end
		endtask
		task t1(input a);
		begin
		@(negedge clk)	
			seq=a;
			end
		endtask
	initial
		begin
		seq=0;
		#5;
		rst=1'b1;
		#10;
		rst=1'b0;
		#15;
		t1(1);
		t1(0);
		t1(0);
		t1(1);
	#100;
			$finish;
		end
endmodule