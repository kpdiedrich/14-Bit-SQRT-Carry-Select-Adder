// Keith Diedrich
module SQRT_CSA14bit_tb;

	// Inputs
	reg [13:0] a;
	reg [13:0] b;
	reg cin;

	// Outputs
	wire [13:0] sumtot;
	wire cout;

	SQRT_CSA14bit uut (
		.a(a),
		.b(b),
		.cin(cin),
		.sumtot(sumtot),
		.cout(cout)
	);

	initial begin
		// Initial inputs
		a = 0;
		b = 0;
		cin = 0;

		#100

		// Add Stimulus Here
		//a = 14'h0000;
		//b = 14'h0000;
		//cin = 0;

		//a = 14'h0001;
		//b = 14'hFFFF;
		//cin = 0;

		//a = 14'hFFFF;
		//b = 14'h0001;
		//cin = 0;

		//a = 14'hFFFF;
		//b = 14'hFFFF;
		//cin = 0;

		//a = 14'h1111;
		//b = 14'h1111;
		//cin = 0;

		//a = 14'h36A2;
		//b = 14'h50B7;
		//cin = 0;

		//a = 14'hABCD;
		//b = 14'h1234;
		//cin = 0;

		//a = 14'h3579;
		//b = 14'h2B35;
		//cin = 0;

		//a = 14'h2468;
		//b = 14'hDB00;
		//cin = 0;

		a = 14'h3A14;
		b = 14'h32BF;
		cin = 0;

	end
endmodule
