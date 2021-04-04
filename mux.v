// Keith Diedrich
module mux (a, b, s, out);	// a and b are assuming Cin = 1 and 0
	input a, b;
	input s;		// Incoming carry
	output out;		// Sum		

wire out;
assign out = s ? b : a;		// b -> Cin = 1 and a -> Cin = 0
endmodule