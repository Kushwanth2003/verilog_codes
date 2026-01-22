module half_subtractor(input a,b,output difference,barrow);
	
assign difference = a ^ b;
assign barrow = ~a & b;

endmodule
