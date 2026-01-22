module full_subtractor(input a,b,c_in,output difference,barrow);
	
assign difference = a ^ b ^ c_in;
assign barrow = ~a & b | b & c_in | ~a & c_in;

endmodule