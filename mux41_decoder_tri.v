
module mux41_decoder_tri(input a,b,c,d,e,f, output wor y);
 wire w0,w1,w2,w3;
 decoder d1(a,b,w0,w1,w2,w3);
 tristate t1(c,w0,y);
 tristate t2(d,w1,y);
 tristate t3(e,w2,y);
 tristate t4(f,w3,y);
 endmodule

