
module bidirectional(inout a,b,input ctrl);
  bufif1(a,b,ctrl);
  bufif0(b,a,ctrl);
  endmodule
