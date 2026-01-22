
module full_adder(input a,b,cin, output sum,carry);
    assign sum=a^b^cin;
    assign carry=(a&b)|(b&cin)|(cin&a);
endmodule

module ripple_carry_adder(input [3:0]a,b,input cin,output[3:0]sum,output carry);
    wire [2:0]w;
    full_adder fa0(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.carry(w0));
    full_adder fa1(.a(a[1]),.b(b[1]),.cin(w0),.sum(sum[1]),.carry(w1));
    full_adder fa2(.a(a[2]),.b(b[2]),.cin(w1),.sum(sum[2]),.carry(w2));
    full_adder fa3(.a(a[3]),.b(b[3]),.cin(w2),.sum(sum[3]),.carry(carry));
 endmodule

