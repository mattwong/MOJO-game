/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module statemachine_5 (
    input clk,
    input rst,
    input addbt,
    input subbt,
    input mulbt,
    input startbt,
    input clrbt,
    input [15:0] fromreg,
    output reg [2:0] ra,
    output reg [5:0] alufn,
    output reg [2:0] bsel,
    output reg [2:0] asel,
    output reg we,
    output reg [2:0] wa,
    output reg [15:0] toreg
  );
  
  
  
  localparam IDLE_state = 4'd0;
  localparam SELPROB_state = 4'd1;
  localparam PROB_state = 4'd2;
  localparam ADD_state = 4'd3;
  localparam SUB_state = 4'd4;
  localparam MUL_state = 4'd5;
  localparam CLR_state = 4'd6;
  localparam CMP_state = 4'd7;
  localparam CHECKRES_state = 4'd8;
  localparam CHECKLN_state = 4'd9;
  localparam MOVELN1_state = 4'd10;
  localparam MOVELN2_state = 4'd11;
  localparam MOVELN3_state = 4'd12;
  localparam CHGLN_state = 4'd13;
  localparam END_state = 4'd14;
  
  reg [3:0] M_state_d, M_state_q = IDLE_state;
  
  always @* begin
    M_state_d = M_state_q;
    
    alufn = 1'h0;
    ra = 1'h0;
    bsel = 1'h0;
    asel = 1'h0;
    we = 1'h0;
    wa = 1'h0;
    toreg = 1'h0;
    
    case (M_state_q)
      IDLE_state: begin
        if (startbt == 1'h1) begin
          M_state_d = SELPROB_state;
        end
      end
      SELPROB_state: begin
        we = 1'h1;
        wa = 3'h1;
        toreg = 16'h0005;
        M_state_d = PROB_state;
      end
      PROB_state: begin
        if (addbt == 1'h1) begin
          M_state_d = ADD_state;
        end
        if (subbt == 1'h1) begin
          M_state_d = SUB_state;
        end
        if (mulbt == 1'h1) begin
          M_state_d = MUL_state;
        end
        if (clrbt == 1'h1) begin
          M_state_d = CLR_state;
        end
      end
      ADD_state: begin
        alufn = 1'h0;
        asel = 3'h0;
        bsel = 3'h1;
        we = 1'h1;
        wa = 1'h0;
        M_state_d = CMP_state;
      end
      SUB_state: begin
        alufn = 6'h01;
        asel = 3'h0;
        bsel = 3'h1;
        we = 1'h1;
        wa = 3'h0;
        M_state_d = CMP_state;
      end
      MUL_state: begin
        alufn = 6'h02;
        asel = 1'h0;
        bsel = 3'h3;
        we = 1'h1;
        wa = 1'h0;
        M_state_d = CMP_state;
      end
      CLR_state: begin
        alufn = 6'h02;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h1;
        wa = 1'h0;
        M_state_d = CMP_state;
      end
      CMP_state: begin
        alufn = 6'h33;
        asel = 3'h0;
        bsel = 3'h7;
        we = 1'h1;
        wa = 3'h5;
        M_state_d = CHECKRES_state;
      end
      CHECKRES_state: begin
        ra = 3'h5;
        if (fromreg == 1'h1) begin
          M_state_d = CHECKLN_state;
        end else begin
          M_state_d = PROB_state;
        end
      end
      CHECKLN_state: begin
        ra = 3'h6;
        if (fromreg == 2'h0) begin
          M_state_d = MOVELN1_state;
        end
        if (fromreg == 2'h1) begin
          M_state_d = MOVELN2_state;
        end
        if (fromreg == 2'h2) begin
          M_state_d = MOVELN3_state;
        end
      end
      MOVELN1_state: begin
        alufn = 6'h20;
        bsel = 3'h1;
        we = 1'h1;
        wa = 3'h2;
        asel = 3'h2;
        ra = 3'h2;
        if (fromreg == 5'h10) begin
          M_state_d = CHGLN_state;
        end else begin
          M_state_d = PROB_state;
        end
      end
      MOVELN2_state: begin
        alufn = 6'h20;
        bsel = 3'h1;
        we = 1'h1;
        wa = 3'h3;
        asel = 3'h3;
        ra = 3'h3;
        if (fromreg == 5'h10) begin
          M_state_d = CHGLN_state;
        end else begin
          M_state_d = PROB_state;
        end
      end
      MOVELN3_state: begin
        alufn = 6'h20;
        bsel = 3'h1;
        we = 1'h1;
        wa = 3'h4;
        asel = 3'h4;
        ra = 3'h4;
        if (fromreg == 5'h10) begin
          M_state_d = END_state;
        end else begin
          M_state_d = PROB_state;
        end
      end
      CHGLN_state: begin
        alufn = 6'h00;
        bsel = 3'h1;
        we = 1'h1;
        wa = 3'h6;
        asel = 3'h6;
        M_state_d = PROB_state;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule