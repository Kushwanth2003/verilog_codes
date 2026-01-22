
module sr_latch(input s,r,output q,qb);

nor n1(q,r,qb);
nor n2(qb,s,q);
endmodule
