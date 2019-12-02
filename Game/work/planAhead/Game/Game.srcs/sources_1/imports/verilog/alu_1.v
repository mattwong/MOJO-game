/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_1 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] s,
    output reg z,
    output reg n,
    output reg v
  );
  
  
  
  wire [16-1:0] M_adder_s;
  wire [1-1:0] M_adder_z;
  wire [1-1:0] M_adder_v;
  wire [1-1:0] M_adder_n;
  reg [16-1:0] M_adder_a;
  reg [16-1:0] M_adder_b;
  reg [1-1:0] M_adder_alufn;
  adder_16bit_17 adder (
    .a(M_adder_a),
    .b(M_adder_b),
    .alufn(M_adder_alufn),
    .s(M_adder_s),
    .z(M_adder_z),
    .v(M_adder_v),
    .n(M_adder_n)
  );
  
  wire [16-1:0] M_bool_s;
  reg [16-1:0] M_bool_a;
  reg [16-1:0] M_bool_b;
  reg [4-1:0] M_bool_alufn;
  boolean_16bit_18 bool (
    .a(M_bool_a),
    .b(M_bool_b),
    .alufn(M_bool_alufn),
    .s(M_bool_s)
  );
  
  wire [16-1:0] M_shift_s;
  reg [16-1:0] M_shift_a;
  reg [4-1:0] M_shift_b;
  reg [2-1:0] M_shift_alufn;
  shifter_16bit_19 shift (
    .a(M_shift_a),
    .b(M_shift_b),
    .alufn(M_shift_alufn),
    .s(M_shift_s)
  );
  
  wire [16-1:0] M_compare_s;
  reg [6-1:0] M_compare_alufn;
  reg [1-1:0] M_compare_z;
  reg [1-1:0] M_compare_v;
  reg [1-1:0] M_compare_n;
  compare16bit_20 compare (
    .alufn(M_compare_alufn),
    .z(M_compare_z),
    .v(M_compare_v),
    .n(M_compare_n),
    .s(M_compare_s)
  );
  
  wire [16-1:0] M_mul_s;
  reg [16-1:0] M_mul_a;
  reg [16-1:0] M_mul_b;
  multiply_16bit_21 mul (
    .a(M_mul_a),
    .b(M_mul_b),
    .s(M_mul_s)
  );
  
  always @* begin
    s[0+15-:16] = 1'h0;
    v = 1'h0;
    n = 1'h0;
    z = 1'h0;
    M_adder_a[0+15-:16] = a[0+15-:16];
    M_adder_b[0+15-:16] = b[0+15-:16];
    M_adder_alufn[0+0-:1] = alufn[0+0-:1];
    M_mul_a[0+15-:16] = a[0+15-:16];
    M_mul_b[0+15-:16] = b[0+15-:16];
    M_bool_a[0+15-:16] = a[0+15-:16];
    M_bool_b[0+15-:16] = b[0+15-:16];
    M_bool_alufn[0+3-:4] = alufn[0+3-:4];
    M_shift_a[0+15-:16] = a[0+15-:16];
    M_shift_b[0+3-:4] = b[0+3-:4];
    M_shift_alufn[0+1-:2] = alufn[0+1-:2];
    M_compare_alufn[0+5-:6] = alufn[0+5-:6];
    M_compare_z = M_adder_z;
    M_compare_v = M_adder_v;
    M_compare_n = M_adder_n;
    if (alufn[4+1-:2] == 2'h0) begin
      if (alufn[1+0-:1] == 1'h0) begin
        s[0+15-:16] = M_adder_s[0+15-:16];
      end
      if (alufn[1+0-:1] == 1'h1) begin
        s[0+15-:16] = M_mul_s[0+15-:16];
      end
      z = M_adder_z;
      v = M_adder_v;
      n = M_adder_n;
    end
    if (alufn[4+1-:2] == 2'h1) begin
      s[0+15-:16] = M_bool_s[0+15-:16];
    end
    if (alufn[4+1-:2] == 2'h2) begin
      s[0+15-:16] = M_shift_s[0+15-:16];
    end
    if (alufn[4+1-:2] == 2'h3) begin
      s[0+15-:16] = M_compare_s[0+15-:16];
    end
  end
endmodule
