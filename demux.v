module demux(input i,s,output y0,y1);
assign y0=~s&i;
assign y1=s&i;
endmodule
