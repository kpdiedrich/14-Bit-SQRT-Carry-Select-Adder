// 14 Bit SQRT Carry Select Adder
// Keith Diedrich

module SQRT_CSA14bit (
	input [13:0] a,
	input [13:0] b,
	input cin,
	output [13:0] sumtot,
	output cout
);

wire [13:0] p;
wire [13:0] g;
wire c10, c20, c11, c21, c1, c2;		// Slice 1, bits 0 to 1
wire c30, c31, c3, c40, c41, c4, c50, c51, c5;
wire c60, c61, c6, c70, c71, c7, c80, c81, c8, c90, c91, c9;
wire c100, c101, cten, c110, c111, celvn, c120, c121, c12, c130, c131, c13, c140, c141, c14;
wire [13:0] sum;

// Computing all initial G's and P's
assign p[0] = a[0] ^ b[0];
assign g[0] = a[0] & b[0];
assign p[1] = a[1] ^ b[1];
assign g[1] = a[1] & b[1];
assign p[2] = a[2] ^ b[2];
assign g[2] = a[2] & b[2];
assign p[3] = a[3] ^ b[3];
assign g[3] = a[3] & b[3];
assign p[4] = a[4] ^ b[4];
assign g[4] = a[4] & b[4];
assign p[5] = a[5] ^ b[5];
assign g[5] = a[5] & b[5];
assign p[6] = a[6] ^ b[6];
assign g[6] = a[6] & b[6];
assign p[7] = a[7] ^ b[7];
assign g[7] = a[7] & b[7];
assign p[8] = a[8] ^ b[8];
assign g[8] = a[8] & b[8];
assign p[9] = a[9] ^ b[9];
assign g[9] = a[9] & b[9];
assign p[10] = a[10] ^ b[10];
assign g[10] = a[10] & b[10];
assign p[11] = a[11] ^ b[11];
assign g[11] = a[11] & b[11];
assign p[12] = a[12] ^ b[12];
assign g[12] = a[12] & b[12];
assign p[13] = a[13] ^ b[13];
assign g[13] = a[13] & b[13];

// Bits 0 to 1
// Assume Cin = 0
assign c10 = g[0];
assign c20 = g[1] | p[1] & g[0];
// Assume Cin = 1
assign c11 = g[0] | p[0] & 1;
assign c21 = g[1] | p[1] & g[0] | p[1] & p[0] & 1;

assign sum[0] = p[0] ^ cin;
mux x1(c10, c11, cin, c1);
assign sum[1] = p[1] ^ c1;
mux x2(c20, c21, cin, c2);
assign sum[2] = p[2] ^ c2;

// Bits 2 to 4
// Assume C2 = 0
assign c30 = g[2] | p[2] & 0;
assign c40 = g[3] | p[3] & g[2] | p[3] & p[2] & 0;
assign c50 = g[4] | p[4] & g[3] | p[4] & p[3] & g[2] | p[4] & p[3] & p[2] & 0;
// Assume C2 = 1
assign c31 = g[2] | p[2] & 1;
assign c41 = g[3] | p[3] & g[2] | p[3] & p[2] & 1;
assign c51 = g[4] | p[4] & g[3] | p[4] & p[3] & g[2] | p[4] & p[3] & p[2] & 1;	// Carry out slice 2

mux x3(c30, c31, c2, c3);
assign sum[3] = p[3] ^ c3;
mux x4(c40, c41, c2, c4);
assign sum[4] = p[4] ^ c4;
mux x5(c50, c51, c2, c5);
assign sum[5] = p[5] ^ c5;

// Bits 5 to 8	
// Assume C5 = 0
assign c60 = g[5] | p[5] & 0;
assign c70 = g[6] | p[6] & g[5] | p[6] & p[5] & 0;
assign c80 = g[7] | p[7] & g[6] | p[7] & p[6] & g[5] | p[7] & p[6] & p[5] & 0;
assign c90 = g[8] | p[8] & g[7] | p[8] & p[7] & g[6] | p[8] & p[7] & p[6] & g[5] | p[8] & p[7] & p[6] & p[5] & 0;
// Assume C5 = 1
assign c61 = g[5] | p[5] & 1;
assign c71 = g[6] | p[6] & g[5] | p[6] & p[5] & 1;
assign c81 = g[7] | p[7] & g[6] | p[7] & p[6] & g[5] | p[7] & p[6] & p[5] & 1;
assign c91 = g[8] | p[8] & g[7] | p[8] & p[7] & g[6] | p[8] & p[7] & p[6] & g[5] | p[8] & p[7] & p[6] & p[5] & 1;

mux x6(c60, c61, c5, c6);
assign sum[6] = p[6] ^ c6;
mux x7(c70, c71, c5, c7);
assign sum[7] = p[7] ^ c7;
mux x8(c80, c81, c5, c8);
assign sum[8] = p[8] ^ c8;
mux x9(c90, c91, c5, c9);
assign sum[9] = p[9] ^ c9;

// Bits 9 to 13
// Assume C9 = 0
assign c100 = g[9] | p[9] & 0;
assign c110 = g[10] | p[10] & g[9] | p[10] & p[9] & 0;
assign c120 = g[11] | p[11] & g[10] | p[11] & p[10] & g[9] | p[11] & p[10] & p[9] & 0;
assign c130 = g[12] | p[12] & g[11] | p[12] & p[11] & g[10] | p[12] & p[11] & p[10] & g[9] | p[12] & p[11] & p[10] & p[9] & 0;
assign c140 = g[13] | p[13] & g[12] | p[13] & p[12] & g[11] | p[13] & p[12] & p[11] & g[10] | p[13] & p[12] & p[11] & p[10] & g[9] | p[13] & p[12] & p[11] & p[10] & p[9] & 0; 

// Assume C9 = 1
assign c101 = g[9] | p[9] & 1;
assign c111 = g[10] | p[10] & g[9] | p[10] & p[9] & 1;
assign c121 = g[11] | p[11] & g[10] | p[11] & p[10] & g[9] | p[11] & p[10] & p[9] & 1;
assign c131 = g[12] | p[12] & g[11] | p[12] & p[11] & g[10] | p[12] & p[11] & p[10] & g[9] | p[12] & p[11] & p[10] & p[9] & 1;
assign c141 = g[13] | p[13] & g[12] | p[13] & p[12] & g[11] | p[13] & p[12] & p[11] & g[10] | p[13] & p[12] & p[11] & p[10] & g[9] | p[13] & p[12] & p[11] & p[10] & p[9] & 1; 

mux x10(c100, c101, c9, cten);
assign sum[10] = p[10] ^ cten;
mux x11(c110, c111, c9, celvn);
assign sum[11] = p[11] ^ celvn;
mux x12(c120, c121, c9, c12);
assign sum[12] = p[12] ^ c12;
mux x13(c130, c131, c9, c13);
assign sum[13] = p[13] ^ c13;
mux x14(c140, c141, c9, c14);
assign sumtot = {sum[13:0]};
assign cout = c14;

endmodule