module comparator(input a,b,ouput lt,gt,eq);
assign lt = a < b;
assign gt = a > b;
assign eq = a == b;
endmodule
