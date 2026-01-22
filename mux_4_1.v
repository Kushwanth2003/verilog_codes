
module mux_41(input a,b,c,d,s,s1,output y);
wire w1,w2;
  mux mux1(.a(a),.b(b),.s(s),.y(w1));
  mux mux2(.a(c),.b(d),.s(s),.y(w2));
  mux mux3(.a(w1),.b(w2),.s(s1),.y(y));
 endmodule

