//-----------------------------------------------------------------------------
// IntMulFixedLatRTL_0x7f55c24023a1407
//-----------------------------------------------------------------------------
// dump-vcd: True
// verilator-xinit: zeros
`default_nettype none
module IntMulFixedLatRTL
(
  input  wire [   0:0] clk,
  input  wire [  63:0] req_msg,
  output wire [   0:0] req_rdy,
  input  wire [   0:0] req_val,
  input  wire [   0:0] reset,
  output wire [  31:0] resp_msg,
  input  wire [   0:0] resp_rdy,
  output wire [   0:0] resp_val
);

  // ctrl temporaries
  wire   [   0:0] ctrl$resp_rdy;
  wire   [   0:0] ctrl$clk;
  wire   [   0:0] ctrl$req_val;
  wire   [   0:0] ctrl$b_lsb;
  wire   [   0:0] ctrl$reset;
  wire   [   0:0] ctrl$a_mux_sel;
  wire   [   0:0] ctrl$resp_val;
  wire   [   0:0] ctrl$result_mux_sel;
  wire   [   0:0] ctrl$add_mux_sel;
  wire   [   0:0] ctrl$result_reg_en;
  wire   [   0:0] ctrl$b_mux_sel;
  wire   [   0:0] ctrl$req_rdy;

  IntMulFixedLatCtrlRTL_0x7f55c24023a1407 ctrl
  (
    .resp_rdy       ( ctrl$resp_rdy ),
    .clk            ( ctrl$clk ),
    .req_val        ( ctrl$req_val ),
    .b_lsb          ( ctrl$b_lsb ),
    .reset          ( ctrl$reset ),
    .a_mux_sel      ( ctrl$a_mux_sel ),
    .resp_val       ( ctrl$resp_val ),
    .result_mux_sel ( ctrl$result_mux_sel ),
    .add_mux_sel    ( ctrl$add_mux_sel ),
    .result_reg_en  ( ctrl$result_reg_en ),
    .b_mux_sel      ( ctrl$b_mux_sel ),
    .req_rdy        ( ctrl$req_rdy )
  );

  // dpath temporaries
  wire   [   0:0] dpath$a_mux_sel;
  wire   [   0:0] dpath$clk;
  wire   [   0:0] dpath$result_mux_sel;
  wire   [   0:0] dpath$add_mux_sel;
  wire   [   0:0] dpath$result_reg_en;
  wire   [   0:0] dpath$b_mux_sel;
  wire   [  31:0] dpath$req_msg_b;
  wire   [  31:0] dpath$req_msg_a;
  wire   [   0:0] dpath$reset;
  wire   [  31:0] dpath$resp_msg;
  wire   [   0:0] dpath$b_lsb;

  IntMulFixedLatDpathRTL_0x7f55c24023a1407 dpath
  (
    .a_mux_sel      ( dpath$a_mux_sel ),
    .clk            ( dpath$clk ),
    .result_mux_sel ( dpath$result_mux_sel ),
    .add_mux_sel    ( dpath$add_mux_sel ),
    .result_reg_en  ( dpath$result_reg_en ),
    .b_mux_sel      ( dpath$b_mux_sel ),
    .req_msg_b      ( dpath$req_msg_b ),
    .req_msg_a      ( dpath$req_msg_a ),
    .reset          ( dpath$reset ),
    .resp_msg       ( dpath$resp_msg ),
    .b_lsb          ( dpath$b_lsb )
  );

  // signal connections
  assign ctrl$b_lsb           = dpath$b_lsb;
  assign ctrl$clk             = clk;
  assign ctrl$req_val         = req_val;
  assign ctrl$reset           = reset;
  assign ctrl$resp_rdy        = resp_rdy;
  assign dpath$a_mux_sel      = ctrl$a_mux_sel;
  assign dpath$add_mux_sel    = ctrl$add_mux_sel;
  assign dpath$b_mux_sel      = ctrl$b_mux_sel;
  assign dpath$clk            = clk;
  assign dpath$req_msg_a      = req_msg[63:32];
  assign dpath$req_msg_b      = req_msg[31:0];
  assign dpath$reset          = reset;
  assign dpath$result_mux_sel = ctrl$result_mux_sel;
  assign dpath$result_reg_en  = ctrl$result_reg_en;
  assign req_rdy              = ctrl$req_rdy;
  assign resp_msg             = dpath$resp_msg;
  assign resp_val             = ctrl$resp_val;



endmodule // IntMulFixedLatRTL_0x7f55c24023a1407
`default_nettype wire

//-----------------------------------------------------------------------------
// IntMulFixedLatCtrlRTL_0x7f55c24023a1407
//-----------------------------------------------------------------------------
// dump-vcd: False
// verilator-xinit: zeros
`default_nettype none
module IntMulFixedLatCtrlRTL_0x7f55c24023a1407
(
  output reg  [   0:0] a_mux_sel,
  output reg  [   0:0] add_mux_sel,
  input  wire [   0:0] b_lsb,
  output reg  [   0:0] b_mux_sel,
  input  wire [   0:0] clk,
  output reg  [   0:0] req_rdy,
  input  wire [   0:0] req_val,
  input  wire [   0:0] reset,
  input  wire [   0:0] resp_rdy,
  output reg  [   0:0] resp_val,
  output reg  [   0:0] result_mux_sel,
  output reg  [   0:0] result_reg_en
);

  // register declarations
  reg    [   5:0] counter$in_;
  reg    [   1:0] curr_state__0;
  reg    [   1:0] current_state__1;
  reg    [   0:0] do_sh;
  reg    [   0:0] do_sh_add;
  reg    [   1:0] next_state__0;
  reg    [   1:0] state$in_;

  // localparam declarations
  localparam ADD_MUX_SEL_ADD = 0;
  localparam ADD_MUX_SEL_RESULT = 1;
  localparam ADD_MUX_SEL_X = 0;
  localparam A_MUX_SEL_LD = 1;
  localparam A_MUX_SEL_LSH = 0;
  localparam A_MUX_SEL_X = 0;
  localparam B_MUX_SEL_LD = 1;
  localparam B_MUX_SEL_RSH = 0;
  localparam B_MUX_SEL_X = 0;
  localparam RESULT_MUX_SEL_0 = 1;
  localparam RESULT_MUX_SEL_ADD = 0;
  localparam RESULT_MUX_SEL_X = 0;
  localparam STATE_CALC = 1;
  localparam STATE_DONE = 2;
  localparam STATE_IDLE = 0;

  // state temporaries
  wire   [   0:0] state$reset;
  wire   [   0:0] state$clk;
  wire   [   1:0] state$out;

  RegRst_0x9f365fdf6c8998a state
  (
    .reset ( state$reset ),
    .in_   ( state$in_ ),
    .clk   ( state$clk ),
    .out   ( state$out )
  );

  // counter temporaries
  wire   [   0:0] counter$reset;
  wire   [   0:0] counter$clk;
  wire   [   5:0] counter$out;

  RegRst_0x25d3e5fb40ca6d59 counter
  (
    .reset ( counter$reset ),
    .in_   ( counter$in_ ),
    .clk   ( counter$clk ),
    .out   ( counter$out )
  );

  // signal connections
  assign counter$clk   = clk;
  assign counter$reset = reset;
  assign state$clk     = clk;
  assign state$reset   = reset;


  // PYMTL SOURCE:
  //
  // @s.combinational
  // def state_transitions():
  //
  //       curr_state = s.state.out
  //       next_state = s.state.out
  //
  //       # Transistions out of IDLE state
  //
  //       if ( s.state.out == s.STATE_IDLE ):
  //         if ( s.req_val and s.req_rdy ):
  //           next_state = s.STATE_CALC
  //
  //       # Transistions out of CALC state
  //
  //       if ( s.state.out == s.STATE_CALC ):
  //         if s.counter.out == 0:
  //           next_state = s.STATE_DONE
  //
  //       # Transistions out of DONE state
  //
  //       if ( s.state.out == s.STATE_DONE ):
  //         if ( s.resp_val and s.resp_rdy ):
  //           next_state = s.STATE_IDLE
  //
  //       s.state.in_.value = next_state

  // logic for state_transitions()
  always @ (*) begin
    curr_state__0 = state$out;
    next_state__0 = state$out;
    if ((state$out == STATE_IDLE)) begin
      if ((req_val&&req_rdy)) begin
        next_state__0 = STATE_CALC;
      end
      else begin
      end
    end
    else begin
    end
    if ((state$out == STATE_CALC)) begin
      if ((counter$out == 0)) begin
        next_state__0 = STATE_DONE;
      end
      else begin
      end
    end
    else begin
    end
    if ((state$out == STATE_DONE)) begin
      if ((resp_val&&resp_rdy)) begin
        next_state__0 = STATE_IDLE;
      end
      else begin
      end
    end
    else begin
    end
    state$in_ = next_state__0;
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def state_outputs():
  //
  //       current_state = s.state.out
  //
  //       # In IDLE state we simply wait for inputs to arrive and latch them
  //
  //       if current_state == s.STATE_IDLE:
  //
  //         s.req_rdy.value        = 1
  //         s.resp_val.value       = 0
  //
  //         s.a_mux_sel.value      = A_MUX_SEL_LD
  //         s.b_mux_sel.value      = B_MUX_SEL_LD
  //         s.result_mux_sel.value = RESULT_MUX_SEL_0
  //         s.result_reg_en.value  = 1
  //         s.add_mux_sel.value    = ADD_MUX_SEL_X
  //
  //         s.counter.in_.value    = 31
  //
  //       # In CALC state we iteratively add/shift to caculate mult
  //
  //       elif current_state == s.STATE_CALC:
  //
  //         s.do_sh_add.value = (s.b_lsb == 1) # do shift and add
  //         s.do_sh.value     = (s.b_lsb == 0) # do shift but no add
  //
  //         s.req_rdy.value        = 0
  //         s.resp_val.value       = 0
  //
  //         s.a_mux_sel.value      = A_MUX_SEL_LSH
  //         s.b_mux_sel.value      = B_MUX_SEL_RSH
  //         s.result_mux_sel.value = RESULT_MUX_SEL_ADD
  //         s.result_reg_en.value  = 1
  //         if s.do_sh_add:
  //           s.add_mux_sel.value  = ADD_MUX_SEL_ADD
  //         else:
  //           s.add_mux_sel.value  = ADD_MUX_SEL_RESULT
  //
  //         s.counter.in_.value    = s.counter.out - 1
  //
  //       # In DONE state we simply wait for output transition to occur
  //
  //       elif current_state == s.STATE_DONE:
  //
  //         s.req_rdy.value        = 0
  //         s.resp_val.value       = 1
  //
  //         s.a_mux_sel.value      = A_MUX_SEL_X
  //         s.b_mux_sel.value      = B_MUX_SEL_X
  //         s.result_mux_sel.value = RESULT_MUX_SEL_X
  //         s.result_reg_en.value  = 0
  //         s.add_mux_sel.value    = ADD_MUX_SEL_X
  //
  //         s.counter.in_.value    = 31

  // logic for state_outputs()
  always @ (*) begin
    current_state__1 = state$out;
    if ((current_state__1 == STATE_IDLE)) begin
      req_rdy = 1;
      resp_val = 0;
      a_mux_sel = A_MUX_SEL_LD;
      b_mux_sel = B_MUX_SEL_LD;
      result_mux_sel = RESULT_MUX_SEL_0;
      result_reg_en = 1;
      add_mux_sel = ADD_MUX_SEL_X;
      counter$in_ = 31;
    end
    else begin
      if ((current_state__1 == STATE_CALC)) begin
        do_sh_add = (b_lsb == 1);
        do_sh = (b_lsb == 0);
        req_rdy = 0;
        resp_val = 0;
        a_mux_sel = A_MUX_SEL_LSH;
        b_mux_sel = B_MUX_SEL_RSH;
        result_mux_sel = RESULT_MUX_SEL_ADD;
        result_reg_en = 1;
        if (do_sh_add) begin
          add_mux_sel = ADD_MUX_SEL_ADD;
        end
        else begin
          add_mux_sel = ADD_MUX_SEL_RESULT;
        end
        counter$in_ = (counter$out-1);
      end
      else begin
        if ((current_state__1 == STATE_DONE)) begin
          req_rdy = 0;
          resp_val = 1;
          a_mux_sel = A_MUX_SEL_X;
          b_mux_sel = B_MUX_SEL_X;
          result_mux_sel = RESULT_MUX_SEL_X;
          result_reg_en = 0;
          add_mux_sel = ADD_MUX_SEL_X;
          counter$in_ = 31;
        end
        else begin
        end
      end
    end
  end


endmodule // IntMulFixedLatCtrlRTL_0x7f55c24023a1407
`default_nettype wire

//-----------------------------------------------------------------------------
// RegRst_0x9f365fdf6c8998a
//-----------------------------------------------------------------------------
// dtype: 2
// reset_value: 0
// dump-vcd: False
// verilator-xinit: zeros
`default_nettype none
module RegRst_0x9f365fdf6c8998a
(
  input  wire [   0:0] clk,
  input  wire [   1:0] in_,
  output reg  [   1:0] out,
  input  wire [   0:0] reset
);

  // localparam declarations
  localparam reset_value = 0;



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       if s.reset:
  //         s.out.next = reset_value
  //       else:
  //         s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    if (reset) begin
      out <= reset_value;
    end
    else begin
      out <= in_;
    end
  end


endmodule // RegRst_0x9f365fdf6c8998a
`default_nettype wire

//-----------------------------------------------------------------------------
// RegRst_0x25d3e5fb40ca6d59
//-----------------------------------------------------------------------------
// dtype: 6
// reset_value: 31
// dump-vcd: False
// verilator-xinit: zeros
`default_nettype none
module RegRst_0x25d3e5fb40ca6d59
(
  input  wire [   0:0] clk,
  input  wire [   5:0] in_,
  output reg  [   5:0] out,
  input  wire [   0:0] reset
);

  // localparam declarations
  localparam reset_value = 31;



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       if s.reset:
  //         s.out.next = reset_value
  //       else:
  //         s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    if (reset) begin
      out <= reset_value;
    end
    else begin
      out <= in_;
    end
  end


endmodule // RegRst_0x25d3e5fb40ca6d59
`default_nettype wire

//-----------------------------------------------------------------------------
// IntMulFixedLatDpathRTL_0x7f55c24023a1407
//-----------------------------------------------------------------------------
// dump-vcd: False
// verilator-xinit: zeros
`default_nettype none
module IntMulFixedLatDpathRTL_0x7f55c24023a1407
(
  input  wire [   0:0] a_mux_sel,
  input  wire [   0:0] add_mux_sel,
  output wire [   0:0] b_lsb,
  input  wire [   0:0] b_mux_sel,
  input  wire [   0:0] clk,
  input  wire [  31:0] req_msg_a,
  input  wire [  31:0] req_msg_b,
  input  wire [   0:0] reset,
  output wire [  31:0] resp_msg,
  input  wire [   0:0] result_mux_sel,
  input  wire [   0:0] result_reg_en
);

  // wire declarations
  wire   [  31:0] rshifter_out;
  wire   [  31:0] lshifter_out;
  wire   [  31:0] add_mux_out;


  // a_reg temporaries
  wire   [   0:0] a_reg$reset;
  wire   [  31:0] a_reg$in_;
  wire   [   0:0] a_reg$clk;
  wire   [  31:0] a_reg$out;

  Reg_0x1eed677bd3b5c175 a_reg
  (
    .reset ( a_reg$reset ),
    .in_   ( a_reg$in_ ),
    .clk   ( a_reg$clk ),
    .out   ( a_reg$out )
  );

  // result_reg temporaries
  wire   [   0:0] result_reg$reset;
  wire   [  31:0] result_reg$in_;
  wire   [   0:0] result_reg$clk;
  wire   [   0:0] result_reg$en;
  wire   [  31:0] result_reg$out;

  RegEn_0x1eed677bd3b5c175 result_reg
  (
    .reset ( result_reg$reset ),
    .in_   ( result_reg$in_ ),
    .clk   ( result_reg$clk ),
    .en    ( result_reg$en ),
    .out   ( result_reg$out )
  );

  // add temporaries
  wire   [   0:0] add$clk;
  wire   [  31:0] add$in0;
  wire   [  31:0] add$in1;
  wire   [   0:0] add$reset;
  wire   [   0:0] add$cin;
  wire   [   0:0] add$cout;
  wire   [  31:0] add$out;

  Adder_0x20454677a5a72bab add
  (
    .clk   ( add$clk ),
    .in0   ( add$in0 ),
    .in1   ( add$in1 ),
    .reset ( add$reset ),
    .cin   ( add$cin ),
    .cout  ( add$cout ),
    .out   ( add$out )
  );

  // add_mux temporaries
  wire   [   0:0] add_mux$reset;
  wire   [  31:0] add_mux$in_$000;
  wire   [  31:0] add_mux$in_$001;
  wire   [   0:0] add_mux$clk;
  wire   [   0:0] add_mux$sel;
  wire   [  31:0] add_mux$out;

  Mux_0x7e8c65f0610ab9ca add_mux
  (
    .reset   ( add_mux$reset ),
    .in_$000 ( add_mux$in_$000 ),
    .in_$001 ( add_mux$in_$001 ),
    .clk     ( add_mux$clk ),
    .sel     ( add_mux$sel ),
    .out     ( add_mux$out )
  );

  // lshifter temporaries
  wire   [   0:0] lshifter$reset;
  wire   [   0:0] lshifter$shamt;
  wire   [  31:0] lshifter$in_;
  wire   [   0:0] lshifter$clk;
  wire   [  31:0] lshifter$out;

  LeftLogicalShifter_0x5d427925091d8256 lshifter
  (
    .reset ( lshifter$reset ),
    .shamt ( lshifter$shamt ),
    .in_   ( lshifter$in_ ),
    .clk   ( lshifter$clk ),
    .out   ( lshifter$out )
  );

  // a_mux temporaries
  wire   [   0:0] a_mux$reset;
  wire   [  31:0] a_mux$in_$000;
  wire   [  31:0] a_mux$in_$001;
  wire   [   0:0] a_mux$clk;
  wire   [   0:0] a_mux$sel;
  wire   [  31:0] a_mux$out;

  Mux_0x7e8c65f0610ab9ca a_mux
  (
    .reset   ( a_mux$reset ),
    .in_$000 ( a_mux$in_$000 ),
    .in_$001 ( a_mux$in_$001 ),
    .clk     ( a_mux$clk ),
    .sel     ( a_mux$sel ),
    .out     ( a_mux$out )
  );

  // b_mux temporaries
  wire   [   0:0] b_mux$reset;
  wire   [  31:0] b_mux$in_$000;
  wire   [  31:0] b_mux$in_$001;
  wire   [   0:0] b_mux$clk;
  wire   [   0:0] b_mux$sel;
  wire   [  31:0] b_mux$out;

  Mux_0x7e8c65f0610ab9ca b_mux
  (
    .reset   ( b_mux$reset ),
    .in_$000 ( b_mux$in_$000 ),
    .in_$001 ( b_mux$in_$001 ),
    .clk     ( b_mux$clk ),
    .sel     ( b_mux$sel ),
    .out     ( b_mux$out )
  );

  // result_mux temporaries
  wire   [   0:0] result_mux$reset;
  wire   [  31:0] result_mux$in_$000;
  wire   [  31:0] result_mux$in_$001;
  wire   [   0:0] result_mux$clk;
  wire   [   0:0] result_mux$sel;
  wire   [  31:0] result_mux$out;

  Mux_0x7e8c65f0610ab9ca result_mux
  (
    .reset   ( result_mux$reset ),
    .in_$000 ( result_mux$in_$000 ),
    .in_$001 ( result_mux$in_$001 ),
    .clk     ( result_mux$clk ),
    .sel     ( result_mux$sel ),
    .out     ( result_mux$out )
  );

  // rshifter temporaries
  wire   [   0:0] rshifter$reset;
  wire   [   0:0] rshifter$shamt;
  wire   [  31:0] rshifter$in_;
  wire   [   0:0] rshifter$clk;
  wire   [  31:0] rshifter$out;

  RightLogicalShifter_0x5d427925091d8256 rshifter
  (
    .reset ( rshifter$reset ),
    .shamt ( rshifter$shamt ),
    .in_   ( rshifter$in_ ),
    .clk   ( rshifter$clk ),
    .out   ( rshifter$out )
  );

  // b_reg temporaries
  wire   [   0:0] b_reg$reset;
  wire   [  31:0] b_reg$in_;
  wire   [   0:0] b_reg$clk;
  wire   [  31:0] b_reg$out;

  Reg_0x1eed677bd3b5c175 b_reg
  (
    .reset ( b_reg$reset ),
    .in_   ( b_reg$in_ ),
    .clk   ( b_reg$clk ),
    .out   ( b_reg$out )
  );

  // signal connections
  assign a_mux$clk          = clk;
  assign a_mux$in_$000      = lshifter_out;
  assign a_mux$in_$001      = req_msg_a;
  assign a_mux$reset        = reset;
  assign a_mux$sel          = a_mux_sel;
  assign a_reg$clk          = clk;
  assign a_reg$in_          = a_mux$out;
  assign a_reg$reset        = reset;
  assign add$clk            = clk;
  assign add$in0            = a_reg$out;
  assign add$in1            = result_reg$out;
  assign add$reset          = reset;
  assign add_mux$clk        = clk;
  assign add_mux$in_$000    = add$out;
  assign add_mux$in_$001    = result_reg$out;
  assign add_mux$reset      = reset;
  assign add_mux$sel        = add_mux_sel;
  assign add_mux_out        = add_mux$out;
  assign b_lsb              = b_reg$out[0];
  assign b_mux$clk          = clk;
  assign b_mux$in_$000      = rshifter_out;
  assign b_mux$in_$001      = req_msg_b;
  assign b_mux$reset        = reset;
  assign b_mux$sel          = b_mux_sel;
  assign b_reg$clk          = clk;
  assign b_reg$in_          = b_mux$out;
  assign b_reg$reset        = reset;
  assign lshifter$clk       = clk;
  assign lshifter$in_       = a_reg$out;
  assign lshifter$reset     = reset;
  assign lshifter$shamt     = 1'd1;
  assign lshifter_out       = lshifter$out;
  assign resp_msg           = result_reg$out;
  assign result_mux$clk     = clk;
  assign result_mux$in_$000 = add_mux_out;
  assign result_mux$in_$001 = 32'd0;
  assign result_mux$reset   = reset;
  assign result_mux$sel     = result_mux_sel;
  assign result_reg$clk     = clk;
  assign result_reg$en      = result_reg_en;
  assign result_reg$in_     = result_mux$out;
  assign result_reg$reset   = reset;
  assign rshifter$clk       = clk;
  assign rshifter$in_       = b_reg$out;
  assign rshifter$reset     = reset;
  assign rshifter$shamt     = 1'd1;
  assign rshifter_out       = rshifter$out;



endmodule // IntMulFixedLatDpathRTL_0x7f55c24023a1407
`default_nettype wire

//-----------------------------------------------------------------------------
// Reg_0x1eed677bd3b5c175
//-----------------------------------------------------------------------------
// dtype: 32
// dump-vcd: False
// verilator-xinit: zeros
`default_nettype none
module Reg_0x1eed677bd3b5c175
(
  input  wire [   0:0] clk,
  input  wire [  31:0] in_,
  output reg  [  31:0] out,
  input  wire [   0:0] reset
);



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    out <= in_;
  end


endmodule // Reg_0x1eed677bd3b5c175
`default_nettype wire

//-----------------------------------------------------------------------------
// RegEn_0x1eed677bd3b5c175
//-----------------------------------------------------------------------------
// dtype: 32
// dump-vcd: False
// verilator-xinit: zeros
`default_nettype none
module RegEn_0x1eed677bd3b5c175
(
  input  wire [   0:0] clk,
  input  wire [   0:0] en,
  input  wire [  31:0] in_,
  output reg  [  31:0] out,
  input  wire [   0:0] reset
);



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       if s.en:
  //         s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    if (en) begin
      out <= in_;
    end
    else begin
    end
  end


endmodule // RegEn_0x1eed677bd3b5c175
`default_nettype wire

//-----------------------------------------------------------------------------
// Adder_0x20454677a5a72bab
//-----------------------------------------------------------------------------
// nbits: 32
// dump-vcd: False
// verilator-xinit: zeros
`default_nettype none
module Adder_0x20454677a5a72bab
(
  input  wire [   0:0] cin,
  input  wire [   0:0] clk,
  output wire [   0:0] cout,
  input  wire [  31:0] in0,
  input  wire [  31:0] in1,
  output wire [  31:0] out,
  input  wire [   0:0] reset
);

  // register declarations
  reg    [  32:0] t0__0;
  reg    [  32:0] t1__0;
  reg    [  32:0] temp;

  // localparam declarations
  localparam twidth = 33;

  // signal connections
  assign cout = temp[32];
  assign out  = temp[31:0];


  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //
  //       # Zero extend the inputs by one bit so we can generate an extra
  //       # carry out bit
  //
  //       t0 = zext( s.in0, twidth )
  //       t1 = zext( s.in1, twidth )
  //
  //       s.temp.value = t0 + t1 + s.cin

  // logic for comb_logic()
  always @ (*) begin
    t0__0 = { { twidth-32 { 1'b0 } }, in0[31:0] };
    t1__0 = { { twidth-32 { 1'b0 } }, in1[31:0] };
    temp = ((t0__0+t1__0)+cin);
  end


endmodule // Adder_0x20454677a5a72bab
`default_nettype wire

//-----------------------------------------------------------------------------
// Mux_0x7e8c65f0610ab9ca
//-----------------------------------------------------------------------------
// dtype: 32
// nports: 2
// dump-vcd: False
// verilator-xinit: zeros
`default_nettype none
module Mux_0x7e8c65f0610ab9ca
(
  input  wire [   0:0] clk,
  input  wire [  31:0] in_$000,
  input  wire [  31:0] in_$001,
  output reg  [  31:0] out,
  input  wire [   0:0] reset,
  input  wire [   0:0] sel
);

  // localparam declarations
  localparam nports = 2;


  // array declarations
  wire   [  31:0] in_[0:1];
  assign in_[  0] = in_$000;
  assign in_[  1] = in_$001;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //       assert s.sel < nports
  //       s.out.v = s.in_[ s.sel ]

  // logic for comb_logic()
  always @ (*) begin
    out = in_[sel];
  end


endmodule // Mux_0x7e8c65f0610ab9ca
`default_nettype wire

//-----------------------------------------------------------------------------
// LeftLogicalShifter_0x5d427925091d8256
//-----------------------------------------------------------------------------
// inout_nbits: 32
// shamt_nbits: 1
// dump-vcd: False
// verilator-xinit: zeros
`default_nettype none
module LeftLogicalShifter_0x5d427925091d8256
(
  input  wire [   0:0] clk,
  input  wire [  31:0] in_,
  output reg  [  31:0] out,
  input  wire [   0:0] reset,
  input  wire [   0:0] shamt
);



  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //       s.out.value = s.in_ << s.shamt

  // logic for comb_logic()
  always @ (*) begin
    out = (in_<<shamt);
  end


endmodule // LeftLogicalShifter_0x5d427925091d8256
`default_nettype wire

//-----------------------------------------------------------------------------
// RightLogicalShifter_0x5d427925091d8256
//-----------------------------------------------------------------------------
// inout_nbits: 32
// shamt_nbits: 1
// dump-vcd: False
// verilator-xinit: zeros
`default_nettype none
module RightLogicalShifter_0x5d427925091d8256
(
  input  wire [   0:0] clk,
  input  wire [  31:0] in_,
  output reg  [  31:0] out,
  input  wire [   0:0] reset,
  input  wire [   0:0] shamt
);



  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //       s.out.value = s.in_ >> s.shamt

  // logic for comb_logic()
  always @ (*) begin
    out = (in_>>shamt);
  end


endmodule // RightLogicalShifter_0x5d427925091d8256
`default_nettype wire

