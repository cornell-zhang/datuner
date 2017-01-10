// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4.2 (lin64) Build 1494164 Fri Feb 26 04:18:54 MST 2016
// Date        : Tue Jan 10 00:10:34 2017
// Host        : ceca20 running 64-bit unknown
// Command     : write_verilog -force
//               /home/xuchang/nas/project/daTuner/evaluation/vivado//daTuner/diffeq1/rank1//output/cpu_impl_netlist.v
// Design      : diffeq_paj_convert
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7vx485tffg1157-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "a8421b7e" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module diffeq_paj_convert
   (Xinport,
    Yinport,
    Uinport,
    Aport,
    DXport,
    Xoutport,
    Youtport,
    Uoutport,
    clk,
    reset);
  input [31:0]Xinport;
  input [31:0]Yinport;
  input [31:0]Uinport;
  input [31:0]Aport;
  input [31:0]DXport;
  output [31:0]Xoutport;
  output [31:0]Youtport;
  output [31:0]Uoutport;
  input clk;
  input reset;

  wire \<const0> ;
  wire \<const1> ;
  wire [31:0]Aport;
  wire [31:0]Aport_IBUF;
  wire [31:16]B;
  wire [31:0]DXport;
  wire [31:0]DXport_IBUF;
  wire GND_2;
  wire [31:0]Uinport;
  wire [31:0]Uinport_IBUF;
  wire [31:0]Uoutport;
  wire [31:0]Uoutport_OBUF;
  wire VCC_2;
  wire [31:0]Xinport;
  wire [31:0]Xinport_IBUF;
  wire [31:0]Xoutport;
  wire \Xoutport[31]_i_10_n_0 ;
  wire \Xoutport[31]_i_11_n_0 ;
  wire \Xoutport[31]_i_13_n_0 ;
  wire \Xoutport[31]_i_14_n_0 ;
  wire \Xoutport[31]_i_15_n_0 ;
  wire \Xoutport[31]_i_16_n_0 ;
  wire \Xoutport[31]_i_17_n_0 ;
  wire \Xoutport[31]_i_18_n_0 ;
  wire \Xoutport[31]_i_19_n_0 ;
  wire \Xoutport[31]_i_1_n_0 ;
  wire \Xoutport[31]_i_20_n_0 ;
  wire \Xoutport[31]_i_22_n_0 ;
  wire \Xoutport[31]_i_23_n_0 ;
  wire \Xoutport[31]_i_24_n_0 ;
  wire \Xoutport[31]_i_25_n_0 ;
  wire \Xoutport[31]_i_26_n_0 ;
  wire \Xoutport[31]_i_27_n_0 ;
  wire \Xoutport[31]_i_28_n_0 ;
  wire \Xoutport[31]_i_29_n_0 ;
  wire \Xoutport[31]_i_30_n_0 ;
  wire \Xoutport[31]_i_31_n_0 ;
  wire \Xoutport[31]_i_32_n_0 ;
  wire \Xoutport[31]_i_33_n_0 ;
  wire \Xoutport[31]_i_34_n_0 ;
  wire \Xoutport[31]_i_35_n_0 ;
  wire \Xoutport[31]_i_36_n_0 ;
  wire \Xoutport[31]_i_37_n_0 ;
  wire \Xoutport[31]_i_4_n_0 ;
  wire \Xoutport[31]_i_5_n_0 ;
  wire \Xoutport[31]_i_6_n_0 ;
  wire \Xoutport[31]_i_7_n_0 ;
  wire \Xoutport[31]_i_8_n_0 ;
  wire \Xoutport[31]_i_9_n_0 ;
  wire [31:0]Xoutport_OBUF;
  wire \Xoutport_reg[31]_i_12_n_0 ;
  wire \Xoutport_reg[31]_i_21_n_0 ;
  wire \Xoutport_reg[31]_i_2_n_0 ;
  wire \Xoutport_reg[31]_i_3_n_0 ;
  wire [31:0]Yinport;
  wire [31:0]Yinport_IBUF;
  wire [31:0]Youtport;
  wire [31:0]Youtport_OBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire looping;
  wire looping_i_1_n_0;
  wire looping_reg_rep_n_0;
  wire looping_rep_i_1_n_0;
  wire [31:17]p_0_in;
  wire reset;
  wire reset_IBUF;
  wire temp__0_n_100;
  wire temp__0_n_101;
  wire temp__0_n_102;
  wire temp__0_n_103;
  wire temp__0_n_104;
  wire temp__0_n_105;
  wire temp__0_n_106;
  wire temp__0_n_107;
  wire temp__0_n_108;
  wire temp__0_n_109;
  wire temp__0_n_110;
  wire temp__0_n_111;
  wire temp__0_n_112;
  wire temp__0_n_113;
  wire temp__0_n_114;
  wire temp__0_n_115;
  wire temp__0_n_116;
  wire temp__0_n_117;
  wire temp__0_n_118;
  wire temp__0_n_119;
  wire temp__0_n_120;
  wire temp__0_n_121;
  wire temp__0_n_122;
  wire temp__0_n_123;
  wire temp__0_n_124;
  wire temp__0_n_125;
  wire temp__0_n_126;
  wire temp__0_n_127;
  wire temp__0_n_128;
  wire temp__0_n_129;
  wire temp__0_n_130;
  wire temp__0_n_131;
  wire temp__0_n_132;
  wire temp__0_n_133;
  wire temp__0_n_134;
  wire temp__0_n_135;
  wire temp__0_n_136;
  wire temp__0_n_137;
  wire temp__0_n_138;
  wire temp__0_n_139;
  wire temp__0_n_140;
  wire temp__0_n_141;
  wire temp__0_n_142;
  wire temp__0_n_143;
  wire temp__0_n_144;
  wire temp__0_n_145;
  wire temp__0_n_146;
  wire temp__0_n_147;
  wire temp__0_n_148;
  wire temp__0_n_149;
  wire temp__0_n_150;
  wire temp__0_n_151;
  wire temp__0_n_152;
  wire temp__0_n_153;
  wire temp__0_n_89;
  wire temp__0_n_90;
  wire temp__0_n_91;
  wire temp__0_n_92;
  wire temp__0_n_93;
  wire temp__0_n_94;
  wire temp__0_n_95;
  wire temp__0_n_96;
  wire temp__0_n_97;
  wire temp__0_n_98;
  wire temp__0_n_99;
  wire temp__1_n_100;
  wire temp__1_n_101;
  wire temp__1_n_102;
  wire temp__1_n_103;
  wire temp__1_n_104;
  wire temp__1_n_105;
  wire temp__1_n_91;
  wire temp__1_n_92;
  wire temp__1_n_93;
  wire temp__1_n_94;
  wire temp__1_n_95;
  wire temp__1_n_96;
  wire temp__1_n_97;
  wire temp__1_n_98;
  wire temp__1_n_99;
  wire [31:0]u_var0;
  wire u_var1__0_i_10_n_0;
  wire u_var1__0_i_11_n_0;
  wire u_var1__0_i_12_n_0;
  wire u_var1__0_i_13_n_0;
  wire u_var1__0_i_14_n_0;
  wire u_var1__0_i_15_n_0;
  wire u_var1__0_i_16_n_0;
  wire u_var1__0_i_17_n_0;
  wire u_var1__0_i_18_n_0;
  wire u_var1__0_i_19_n_0;
  wire u_var1__0_i_1_n_0;
  wire u_var1__0_i_2_n_0;
  wire u_var1__0_i_3_n_0;
  wire u_var1__0_i_4_n_0;
  wire u_var1__0_i_5_n_0;
  wire u_var1__0_i_6_n_0;
  wire u_var1__0_i_7_n_0;
  wire u_var1__0_i_8_n_0;
  wire u_var1__0_i_9_n_0;
  wire u_var1__0_n_100;
  wire u_var1__0_n_101;
  wire u_var1__0_n_102;
  wire u_var1__0_n_103;
  wire u_var1__0_n_104;
  wire u_var1__0_n_105;
  wire u_var1__0_n_106;
  wire u_var1__0_n_107;
  wire u_var1__0_n_108;
  wire u_var1__0_n_109;
  wire u_var1__0_n_110;
  wire u_var1__0_n_111;
  wire u_var1__0_n_112;
  wire u_var1__0_n_113;
  wire u_var1__0_n_114;
  wire u_var1__0_n_115;
  wire u_var1__0_n_116;
  wire u_var1__0_n_117;
  wire u_var1__0_n_118;
  wire u_var1__0_n_119;
  wire u_var1__0_n_120;
  wire u_var1__0_n_121;
  wire u_var1__0_n_122;
  wire u_var1__0_n_123;
  wire u_var1__0_n_124;
  wire u_var1__0_n_125;
  wire u_var1__0_n_126;
  wire u_var1__0_n_127;
  wire u_var1__0_n_128;
  wire u_var1__0_n_129;
  wire u_var1__0_n_130;
  wire u_var1__0_n_131;
  wire u_var1__0_n_132;
  wire u_var1__0_n_133;
  wire u_var1__0_n_134;
  wire u_var1__0_n_135;
  wire u_var1__0_n_136;
  wire u_var1__0_n_137;
  wire u_var1__0_n_138;
  wire u_var1__0_n_139;
  wire u_var1__0_n_140;
  wire u_var1__0_n_141;
  wire u_var1__0_n_142;
  wire u_var1__0_n_143;
  wire u_var1__0_n_144;
  wire u_var1__0_n_145;
  wire u_var1__0_n_146;
  wire u_var1__0_n_147;
  wire u_var1__0_n_148;
  wire u_var1__0_n_149;
  wire u_var1__0_n_150;
  wire u_var1__0_n_151;
  wire u_var1__0_n_152;
  wire u_var1__0_n_153;
  wire u_var1__0_n_24;
  wire u_var1__0_n_25;
  wire u_var1__0_n_26;
  wire u_var1__0_n_27;
  wire u_var1__0_n_28;
  wire u_var1__0_n_29;
  wire u_var1__0_n_30;
  wire u_var1__0_n_31;
  wire u_var1__0_n_32;
  wire u_var1__0_n_33;
  wire u_var1__0_n_34;
  wire u_var1__0_n_35;
  wire u_var1__0_n_36;
  wire u_var1__0_n_37;
  wire u_var1__0_n_38;
  wire u_var1__0_n_39;
  wire u_var1__0_n_40;
  wire u_var1__0_n_41;
  wire u_var1__0_n_42;
  wire u_var1__0_n_43;
  wire u_var1__0_n_44;
  wire u_var1__0_n_45;
  wire u_var1__0_n_46;
  wire u_var1__0_n_47;
  wire u_var1__0_n_48;
  wire u_var1__0_n_49;
  wire u_var1__0_n_50;
  wire u_var1__0_n_51;
  wire u_var1__0_n_52;
  wire u_var1__0_n_53;
  wire u_var1__0_n_89;
  wire u_var1__0_n_90;
  wire u_var1__0_n_91;
  wire u_var1__0_n_92;
  wire u_var1__0_n_93;
  wire u_var1__0_n_94;
  wire u_var1__0_n_95;
  wire u_var1__0_n_96;
  wire u_var1__0_n_97;
  wire u_var1__0_n_98;
  wire u_var1__0_n_99;
  wire u_var1__1_i_17_n_0;
  wire u_var1__1_i_18_n_0;
  wire u_var1__1_i_19_n_0;
  wire u_var1__1_i_20_n_0;
  wire u_var1__1_i_21_n_0;
  wire u_var1__1_i_22_n_0;
  wire u_var1__1_i_23_n_0;
  wire u_var1__1_i_24_n_0;
  wire u_var1__1_i_25_n_0;
  wire u_var1__1_i_26_n_0;
  wire u_var1__1_i_27_n_0;
  wire u_var1__1_i_28_n_0;
  wire u_var1__1_i_29_n_0;
  wire u_var1__1_i_30_n_0;
  wire u_var1__1_n_100;
  wire u_var1__1_n_101;
  wire u_var1__1_n_102;
  wire u_var1__1_n_103;
  wire u_var1__1_n_104;
  wire u_var1__1_n_105;
  wire u_var1__1_n_91;
  wire u_var1__1_n_92;
  wire u_var1__1_n_93;
  wire u_var1__1_n_94;
  wire u_var1__1_n_95;
  wire u_var1__1_n_96;
  wire u_var1__1_n_97;
  wire u_var1__1_n_98;
  wire u_var1__1_n_99;
  wire u_var1_i_22_n_0;
  wire u_var1_i_23_n_0;
  wire u_var1_i_24_n_0;
  wire u_var1_i_25_n_0;
  wire u_var1_i_26_n_0;
  wire u_var1_i_27_n_0;
  wire u_var1_i_28_n_0;
  wire u_var1_i_29_n_0;
  wire u_var1_i_2_n_0;
  wire u_var1_i_30_n_0;
  wire u_var1_i_31_n_0;
  wire u_var1_i_32_n_0;
  wire u_var1_i_33_n_0;
  wire u_var1_i_34_n_0;
  wire u_var1_i_35_n_0;
  wire u_var1_i_36_n_0;
  wire u_var1_i_37_n_0;
  wire u_var1_i_38_n_0;
  wire u_var1_i_39_n_0;
  wire u_var1_i_3_n_0;
  wire u_var1_i_40_n_0;
  wire u_var1_i_41_n_0;
  wire u_var1_i_42_n_0;
  wire u_var1_i_43_n_0;
  wire u_var1_i_44_n_0;
  wire u_var1_i_45_n_0;
  wire u_var1_i_46_n_0;
  wire u_var1_i_47_n_0;
  wire u_var1_i_48_n_0;
  wire u_var1_i_49_n_0;
  wire u_var1_i_4_n_0;
  wire u_var1_i_50_n_0;
  wire u_var1_i_51_n_0;
  wire u_var1_i_52_n_0;
  wire u_var1_i_53_n_0;
  wire u_var1_i_54_n_0;
  wire u_var1_i_55_n_0;
  wire u_var1_i_56_n_0;
  wire u_var1_i_57_n_0;
  wire u_var1_i_58_n_0;
  wire u_var1_i_59_n_0;
  wire u_var1_i_60_n_0;
  wire u_var1_i_61_n_0;
  wire u_var1_i_62_n_0;
  wire u_var1_n_100;
  wire u_var1_n_101;
  wire u_var1_n_102;
  wire u_var1_n_103;
  wire u_var1_n_104;
  wire u_var1_n_105;
  wire u_var1_n_91;
  wire u_var1_n_92;
  wire u_var1_n_93;
  wire u_var1_n_94;
  wire u_var1_n_95;
  wire u_var1_n_96;
  wire u_var1_n_97;
  wire u_var1_n_98;
  wire u_var1_n_99;
  wire u_var2__0_i_10_n_0;
  wire u_var2__0_i_11_n_0;
  wire u_var2__0_i_12_n_0;
  wire u_var2__0_i_13_n_0;
  wire u_var2__0_i_14_n_0;
  wire u_var2__0_i_15_n_0;
  wire u_var2__0_i_16_n_0;
  wire u_var2__0_i_17_n_0;
  wire u_var2__0_i_18_n_0;
  wire u_var2__0_i_19_n_0;
  wire u_var2__0_i_1_n_0;
  wire u_var2__0_i_2_n_0;
  wire u_var2__0_i_3_n_0;
  wire u_var2__0_i_4_n_0;
  wire u_var2__0_i_5_n_0;
  wire u_var2__0_i_6_n_0;
  wire u_var2__0_i_7_n_0;
  wire u_var2__0_i_8_n_0;
  wire u_var2__0_i_9_n_0;
  wire u_var2__0_n_100;
  wire u_var2__0_n_101;
  wire u_var2__0_n_102;
  wire u_var2__0_n_103;
  wire u_var2__0_n_104;
  wire u_var2__0_n_105;
  wire u_var2__0_n_106;
  wire u_var2__0_n_107;
  wire u_var2__0_n_108;
  wire u_var2__0_n_109;
  wire u_var2__0_n_110;
  wire u_var2__0_n_111;
  wire u_var2__0_n_112;
  wire u_var2__0_n_113;
  wire u_var2__0_n_114;
  wire u_var2__0_n_115;
  wire u_var2__0_n_116;
  wire u_var2__0_n_117;
  wire u_var2__0_n_118;
  wire u_var2__0_n_119;
  wire u_var2__0_n_120;
  wire u_var2__0_n_121;
  wire u_var2__0_n_122;
  wire u_var2__0_n_123;
  wire u_var2__0_n_124;
  wire u_var2__0_n_125;
  wire u_var2__0_n_126;
  wire u_var2__0_n_127;
  wire u_var2__0_n_128;
  wire u_var2__0_n_129;
  wire u_var2__0_n_130;
  wire u_var2__0_n_131;
  wire u_var2__0_n_132;
  wire u_var2__0_n_133;
  wire u_var2__0_n_134;
  wire u_var2__0_n_135;
  wire u_var2__0_n_136;
  wire u_var2__0_n_137;
  wire u_var2__0_n_138;
  wire u_var2__0_n_139;
  wire u_var2__0_n_140;
  wire u_var2__0_n_141;
  wire u_var2__0_n_142;
  wire u_var2__0_n_143;
  wire u_var2__0_n_144;
  wire u_var2__0_n_145;
  wire u_var2__0_n_146;
  wire u_var2__0_n_147;
  wire u_var2__0_n_148;
  wire u_var2__0_n_149;
  wire u_var2__0_n_150;
  wire u_var2__0_n_151;
  wire u_var2__0_n_152;
  wire u_var2__0_n_153;
  wire u_var2__0_n_24;
  wire u_var2__0_n_25;
  wire u_var2__0_n_26;
  wire u_var2__0_n_27;
  wire u_var2__0_n_28;
  wire u_var2__0_n_29;
  wire u_var2__0_n_30;
  wire u_var2__0_n_31;
  wire u_var2__0_n_32;
  wire u_var2__0_n_33;
  wire u_var2__0_n_34;
  wire u_var2__0_n_35;
  wire u_var2__0_n_36;
  wire u_var2__0_n_37;
  wire u_var2__0_n_38;
  wire u_var2__0_n_39;
  wire u_var2__0_n_40;
  wire u_var2__0_n_41;
  wire u_var2__0_n_42;
  wire u_var2__0_n_43;
  wire u_var2__0_n_44;
  wire u_var2__0_n_45;
  wire u_var2__0_n_46;
  wire u_var2__0_n_47;
  wire u_var2__0_n_48;
  wire u_var2__0_n_49;
  wire u_var2__0_n_50;
  wire u_var2__0_n_51;
  wire u_var2__0_n_52;
  wire u_var2__0_n_53;
  wire u_var2__0_n_89;
  wire u_var2__0_n_90;
  wire u_var2__0_n_91;
  wire u_var2__0_n_92;
  wire u_var2__0_n_93;
  wire u_var2__0_n_94;
  wire u_var2__0_n_95;
  wire u_var2__0_n_96;
  wire u_var2__0_n_97;
  wire u_var2__0_n_98;
  wire u_var2__0_n_99;
  wire u_var2__1_i_17_n_0;
  wire u_var2__1_i_18_n_0;
  wire u_var2__1_i_19_n_0;
  wire u_var2__1_i_20_n_0;
  wire u_var2__1_i_21_n_0;
  wire u_var2__1_i_22_n_0;
  wire u_var2__1_i_23_n_0;
  wire u_var2__1_i_24_n_0;
  wire u_var2__1_i_25_n_0;
  wire u_var2__1_i_26_n_0;
  wire u_var2__1_i_27_n_0;
  wire u_var2__1_i_28_n_0;
  wire u_var2__1_i_29_n_0;
  wire u_var2__1_i_30_n_0;
  wire u_var2__1_n_100;
  wire u_var2__1_n_101;
  wire u_var2__1_n_102;
  wire u_var2__1_n_103;
  wire u_var2__1_n_104;
  wire u_var2__1_n_105;
  wire u_var2__1_n_91;
  wire u_var2__1_n_92;
  wire u_var2__1_n_93;
  wire u_var2__1_n_94;
  wire u_var2__1_n_95;
  wire u_var2__1_n_96;
  wire u_var2__1_n_97;
  wire u_var2__1_n_98;
  wire u_var2__1_n_99;
  wire [31:0]u_var2__2;
  wire u_var2_i_1_n_0;
  wire u_var2_i_24_n_0;
  wire u_var2_i_25_n_0;
  wire u_var2_i_26_n_0;
  wire u_var2_i_27_n_0;
  wire u_var2_i_28_n_0;
  wire u_var2_i_29_n_0;
  wire u_var2_i_30_n_0;
  wire u_var2_i_31_n_0;
  wire u_var2_i_32_n_0;
  wire u_var2_i_33_n_0;
  wire u_var2_i_34_n_0;
  wire u_var2_i_35_n_0;
  wire u_var2_i_36_n_0;
  wire u_var2_i_37_n_0;
  wire u_var2_i_38_n_0;
  wire u_var2_i_39_n_0;
  wire u_var2_i_3_n_0;
  wire u_var2_i_40_n_0;
  wire u_var2_i_41_n_0;
  wire u_var2_i_42_n_0;
  wire u_var2_i_43_n_0;
  wire u_var2_i_44_n_0;
  wire u_var2_i_45_n_0;
  wire u_var2_i_46_n_0;
  wire u_var2_i_47_n_0;
  wire u_var2_i_48_n_0;
  wire u_var2_i_49_n_0;
  wire u_var2_i_4_n_0;
  wire u_var2_i_50_n_0;
  wire u_var2_i_51_n_0;
  wire u_var2_i_52_n_0;
  wire u_var2_i_53_n_0;
  wire u_var2_i_54_n_0;
  wire u_var2_i_55_n_0;
  wire u_var2_i_56_n_0;
  wire u_var2_i_57_n_0;
  wire u_var2_i_58_n_0;
  wire u_var2_i_59_n_0;
  wire u_var2_i_5_n_0;
  wire u_var2_i_60_n_0;
  wire u_var2_i_61_n_0;
  wire u_var2_i_62_n_0;
  wire u_var2_i_64_n_0;
  wire u_var2_i_65_n_0;
  wire u_var2_i_66_n_0;
  wire u_var2_i_67_n_0;
  wire u_var2_i_68_n_0;
  wire u_var2_i_69_n_0;
  wire u_var2_i_70_n_0;
  wire u_var2_i_71_n_0;
  wire u_var2_i_72_n_0;
  wire u_var2_i_73_n_0;
  wire u_var2_i_74_n_0;
  wire u_var2_i_75_n_0;
  wire u_var2_i_76_n_0;
  wire u_var2_i_77_n_0;
  wire u_var2_i_78_n_0;
  wire u_var2_i_79_n_0;
  wire u_var2_i_80_n_0;
  wire u_var2_i_81_n_0;
  wire u_var2_i_82_n_0;
  wire u_var2_i_83_n_0;
  wire u_var2_n_100;
  wire u_var2_n_101;
  wire u_var2_n_102;
  wire u_var2_n_103;
  wire u_var2_n_104;
  wire u_var2_n_105;
  wire u_var2_n_91;
  wire u_var2_n_92;
  wire u_var2_n_93;
  wire u_var2_n_94;
  wire u_var2_n_95;
  wire u_var2_n_96;
  wire u_var2_n_97;
  wire u_var2_n_98;
  wire u_var2_n_99;
  wire [31:0]u_var3;
  wire \u_var[0]_i_1_n_0 ;
  wire \u_var[10]_i_1_n_0 ;
  wire \u_var[11]_i_10_n_0 ;
  wire \u_var[11]_i_1_n_0 ;
  wire \u_var[11]_i_3_n_0 ;
  wire \u_var[11]_i_4_n_0 ;
  wire \u_var[11]_i_5_n_0 ;
  wire \u_var[11]_i_6_n_0 ;
  wire \u_var[11]_i_7_n_0 ;
  wire \u_var[11]_i_8_n_0 ;
  wire \u_var[11]_i_9_n_0 ;
  wire \u_var[12]_i_1_n_0 ;
  wire \u_var[13]_i_1_n_0 ;
  wire \u_var[14]_i_1_n_0 ;
  wire \u_var[15]_i_10_n_0 ;
  wire \u_var[15]_i_1_n_0 ;
  wire \u_var[15]_i_3_n_0 ;
  wire \u_var[15]_i_4_n_0 ;
  wire \u_var[15]_i_5_n_0 ;
  wire \u_var[15]_i_6_n_0 ;
  wire \u_var[15]_i_7_n_0 ;
  wire \u_var[15]_i_8_n_0 ;
  wire \u_var[15]_i_9_n_0 ;
  wire \u_var[16]_i_1_n_0 ;
  wire \u_var[17]_i_1_n_0 ;
  wire \u_var[18]_i_1_n_0 ;
  wire \u_var[19]_i_10_n_0 ;
  wire \u_var[19]_i_1_n_0 ;
  wire \u_var[19]_i_3_n_0 ;
  wire \u_var[19]_i_4_n_0 ;
  wire \u_var[19]_i_5_n_0 ;
  wire \u_var[19]_i_6_n_0 ;
  wire \u_var[19]_i_7_n_0 ;
  wire \u_var[19]_i_8_n_0 ;
  wire \u_var[19]_i_9_n_0 ;
  wire \u_var[1]_i_1_n_0 ;
  wire \u_var[20]_i_1_n_0 ;
  wire \u_var[21]_i_1_n_0 ;
  wire \u_var[22]_i_1_n_0 ;
  wire \u_var[23]_i_10_n_0 ;
  wire \u_var[23]_i_13_n_0 ;
  wire \u_var[23]_i_14_n_0 ;
  wire \u_var[23]_i_15_n_0 ;
  wire \u_var[23]_i_17_n_0 ;
  wire \u_var[23]_i_18_n_0 ;
  wire \u_var[23]_i_19_n_0 ;
  wire \u_var[23]_i_1_n_0 ;
  wire \u_var[23]_i_3_n_0 ;
  wire \u_var[23]_i_4_n_0 ;
  wire \u_var[23]_i_5_n_0 ;
  wire \u_var[23]_i_6_n_0 ;
  wire \u_var[23]_i_7_n_0 ;
  wire \u_var[23]_i_8_n_0 ;
  wire \u_var[23]_i_9_n_0 ;
  wire \u_var[24]_i_1_n_0 ;
  wire \u_var[25]_i_1_n_0 ;
  wire \u_var[26]_i_1_n_0 ;
  wire \u_var[27]_i_10_n_0 ;
  wire \u_var[27]_i_13_n_0 ;
  wire \u_var[27]_i_14_n_0 ;
  wire \u_var[27]_i_15_n_0 ;
  wire \u_var[27]_i_16_n_0 ;
  wire \u_var[27]_i_17_n_0 ;
  wire \u_var[27]_i_18_n_0 ;
  wire \u_var[27]_i_19_n_0 ;
  wire \u_var[27]_i_1_n_0 ;
  wire \u_var[27]_i_20_n_0 ;
  wire \u_var[27]_i_3_n_0 ;
  wire \u_var[27]_i_4_n_0 ;
  wire \u_var[27]_i_5_n_0 ;
  wire \u_var[27]_i_6_n_0 ;
  wire \u_var[27]_i_7_n_0 ;
  wire \u_var[27]_i_8_n_0 ;
  wire \u_var[27]_i_9_n_0 ;
  wire \u_var[28]_i_1_n_0 ;
  wire \u_var[29]_i_1_n_0 ;
  wire \u_var[2]_i_1_n_0 ;
  wire \u_var[30]_i_1_n_0 ;
  wire \u_var[31]_i_14_n_0 ;
  wire \u_var[31]_i_15_n_0 ;
  wire \u_var[31]_i_16_n_0 ;
  wire \u_var[31]_i_17_n_0 ;
  wire \u_var[31]_i_18_n_0 ;
  wire \u_var[31]_i_19_n_0 ;
  wire \u_var[31]_i_1_n_0 ;
  wire \u_var[31]_i_20_n_0 ;
  wire \u_var[31]_i_21_n_0 ;
  wire \u_var[31]_i_22_n_0 ;
  wire \u_var[31]_i_23_n_0 ;
  wire \u_var[31]_i_24_n_0 ;
  wire \u_var[31]_i_25_n_0 ;
  wire \u_var[31]_i_26_n_0 ;
  wire \u_var[31]_i_27_n_0 ;
  wire \u_var[31]_i_28_n_0 ;
  wire \u_var[31]_i_29_n_0 ;
  wire \u_var[31]_i_3_n_0 ;
  wire \u_var[31]_i_4_n_0 ;
  wire \u_var[31]_i_5_n_0 ;
  wire \u_var[31]_i_6_n_0 ;
  wire \u_var[31]_i_7_n_0 ;
  wire \u_var[31]_i_8_n_0 ;
  wire \u_var[31]_i_9_n_0 ;
  wire \u_var[3]_i_1_n_0 ;
  wire \u_var[3]_i_3_n_0 ;
  wire \u_var[3]_i_4_n_0 ;
  wire \u_var[3]_i_5_n_0 ;
  wire \u_var[3]_i_6_n_0 ;
  wire \u_var[3]_i_7_n_0 ;
  wire \u_var[3]_i_8_n_0 ;
  wire \u_var[3]_i_9_n_0 ;
  wire \u_var[4]_i_1_n_0 ;
  wire \u_var[5]_i_1_n_0 ;
  wire \u_var[6]_i_1_n_0 ;
  wire \u_var[7]_i_10_n_0 ;
  wire \u_var[7]_i_1_n_0 ;
  wire \u_var[7]_i_3_n_0 ;
  wire \u_var[7]_i_4_n_0 ;
  wire \u_var[7]_i_5_n_0 ;
  wire \u_var[7]_i_6_n_0 ;
  wire \u_var[7]_i_7_n_0 ;
  wire \u_var[7]_i_8_n_0 ;
  wire \u_var[7]_i_9_n_0 ;
  wire \u_var[8]_i_1_n_0 ;
  wire \u_var[9]_i_1_n_0 ;
  wire \u_var_reg[11]_i_2_n_0 ;
  wire \u_var_reg[15]_i_2_n_0 ;
  wire \u_var_reg[19]_i_2_n_0 ;
  wire \u_var_reg[23]_i_11_n_0 ;
  wire \u_var_reg[23]_i_11_n_4 ;
  wire \u_var_reg[23]_i_11_n_5 ;
  wire \u_var_reg[23]_i_11_n_6 ;
  wire \u_var_reg[23]_i_11_n_7 ;
  wire \u_var_reg[23]_i_12_n_0 ;
  wire \u_var_reg[23]_i_12_n_4 ;
  wire \u_var_reg[23]_i_12_n_5 ;
  wire \u_var_reg[23]_i_12_n_6 ;
  wire \u_var_reg[23]_i_12_n_7 ;
  wire \u_var_reg[23]_i_2_n_0 ;
  wire \u_var_reg[27]_i_11_n_0 ;
  wire \u_var_reg[27]_i_11_n_4 ;
  wire \u_var_reg[27]_i_11_n_5 ;
  wire \u_var_reg[27]_i_11_n_6 ;
  wire \u_var_reg[27]_i_11_n_7 ;
  wire \u_var_reg[27]_i_12_n_0 ;
  wire \u_var_reg[27]_i_12_n_4 ;
  wire \u_var_reg[27]_i_12_n_5 ;
  wire \u_var_reg[27]_i_12_n_6 ;
  wire \u_var_reg[27]_i_12_n_7 ;
  wire \u_var_reg[27]_i_2_n_0 ;
  wire \u_var_reg[31]_i_10_n_4 ;
  wire \u_var_reg[31]_i_10_n_5 ;
  wire \u_var_reg[31]_i_10_n_6 ;
  wire \u_var_reg[31]_i_10_n_7 ;
  wire \u_var_reg[31]_i_11_n_4 ;
  wire \u_var_reg[31]_i_11_n_5 ;
  wire \u_var_reg[31]_i_11_n_6 ;
  wire \u_var_reg[31]_i_11_n_7 ;
  wire \u_var_reg[31]_i_12_n_0 ;
  wire \u_var_reg[31]_i_12_n_4 ;
  wire \u_var_reg[31]_i_12_n_5 ;
  wire \u_var_reg[31]_i_12_n_6 ;
  wire \u_var_reg[31]_i_12_n_7 ;
  wire \u_var_reg[31]_i_13_n_0 ;
  wire \u_var_reg[31]_i_13_n_4 ;
  wire \u_var_reg[31]_i_13_n_5 ;
  wire \u_var_reg[31]_i_13_n_6 ;
  wire \u_var_reg[31]_i_13_n_7 ;
  wire \u_var_reg[3]_i_2_n_0 ;
  wire \u_var_reg[7]_i_2_n_0 ;
  wire \u_var_reg_n_0_[0] ;
  wire \u_var_reg_n_0_[10] ;
  wire \u_var_reg_n_0_[11] ;
  wire \u_var_reg_n_0_[12] ;
  wire \u_var_reg_n_0_[13] ;
  wire \u_var_reg_n_0_[14] ;
  wire \u_var_reg_n_0_[15] ;
  wire \u_var_reg_n_0_[16] ;
  wire \u_var_reg_n_0_[17] ;
  wire \u_var_reg_n_0_[18] ;
  wire \u_var_reg_n_0_[19] ;
  wire \u_var_reg_n_0_[1] ;
  wire \u_var_reg_n_0_[20] ;
  wire \u_var_reg_n_0_[21] ;
  wire \u_var_reg_n_0_[22] ;
  wire \u_var_reg_n_0_[23] ;
  wire \u_var_reg_n_0_[24] ;
  wire \u_var_reg_n_0_[25] ;
  wire \u_var_reg_n_0_[26] ;
  wire \u_var_reg_n_0_[27] ;
  wire \u_var_reg_n_0_[28] ;
  wire \u_var_reg_n_0_[29] ;
  wire \u_var_reg_n_0_[2] ;
  wire \u_var_reg_n_0_[30] ;
  wire \u_var_reg_n_0_[31] ;
  wire \u_var_reg_n_0_[3] ;
  wire \u_var_reg_n_0_[4] ;
  wire \u_var_reg_n_0_[5] ;
  wire \u_var_reg_n_0_[6] ;
  wire \u_var_reg_n_0_[7] ;
  wire \u_var_reg_n_0_[8] ;
  wire \u_var_reg_n_0_[9] ;
  wire [31:0]x_var;
  wire [31:0]x_var0;
  wire \x_var[0]_i_2_n_0 ;
  wire \x_var[0]_i_3_n_0 ;
  wire \x_var[0]_i_4_n_0 ;
  wire \x_var[0]_i_5_n_0 ;
  wire \x_var[0]_i_6_n_0 ;
  wire \x_var[0]_i_7_n_0 ;
  wire \x_var[0]_i_8_n_0 ;
  wire \x_var[0]_i_9_n_0 ;
  wire \x_var[12]_i_2_n_0 ;
  wire \x_var[12]_i_3_n_0 ;
  wire \x_var[12]_i_4_n_0 ;
  wire \x_var[12]_i_5_n_0 ;
  wire \x_var[12]_i_6_n_0 ;
  wire \x_var[12]_i_7_n_0 ;
  wire \x_var[12]_i_8_n_0 ;
  wire \x_var[12]_i_9_n_0 ;
  wire \x_var[16]_i_2_n_0 ;
  wire \x_var[16]_i_3_n_0 ;
  wire \x_var[16]_i_4_n_0 ;
  wire \x_var[16]_i_5_n_0 ;
  wire \x_var[16]_i_6_n_0 ;
  wire \x_var[16]_i_7_n_0 ;
  wire \x_var[16]_i_8_n_0 ;
  wire \x_var[16]_i_9_n_0 ;
  wire \x_var[20]_i_2_n_0 ;
  wire \x_var[20]_i_3_n_0 ;
  wire \x_var[20]_i_4_n_0 ;
  wire \x_var[20]_i_5_n_0 ;
  wire \x_var[20]_i_6_n_0 ;
  wire \x_var[20]_i_7_n_0 ;
  wire \x_var[20]_i_8_n_0 ;
  wire \x_var[20]_i_9_n_0 ;
  wire \x_var[24]_i_2_n_0 ;
  wire \x_var[24]_i_3_n_0 ;
  wire \x_var[24]_i_4_n_0 ;
  wire \x_var[24]_i_5_n_0 ;
  wire \x_var[24]_i_6_n_0 ;
  wire \x_var[24]_i_7_n_0 ;
  wire \x_var[24]_i_8_n_0 ;
  wire \x_var[24]_i_9_n_0 ;
  wire \x_var[28]_i_2_n_0 ;
  wire \x_var[28]_i_3_n_0 ;
  wire \x_var[28]_i_4_n_0 ;
  wire \x_var[28]_i_5_n_0 ;
  wire \x_var[28]_i_6_n_0 ;
  wire \x_var[28]_i_7_n_0 ;
  wire \x_var[28]_i_8_n_0 ;
  wire \x_var[4]_i_2_n_0 ;
  wire \x_var[4]_i_3_n_0 ;
  wire \x_var[4]_i_4_n_0 ;
  wire \x_var[4]_i_5_n_0 ;
  wire \x_var[4]_i_6_n_0 ;
  wire \x_var[4]_i_7_n_0 ;
  wire \x_var[4]_i_8_n_0 ;
  wire \x_var[4]_i_9_n_0 ;
  wire \x_var[8]_i_2_n_0 ;
  wire \x_var[8]_i_3_n_0 ;
  wire \x_var[8]_i_4_n_0 ;
  wire \x_var[8]_i_5_n_0 ;
  wire \x_var[8]_i_6_n_0 ;
  wire \x_var[8]_i_7_n_0 ;
  wire \x_var[8]_i_8_n_0 ;
  wire \x_var[8]_i_9_n_0 ;
  wire [31:0]x_var_reg;
  wire \x_var_reg[0]_i_1_n_0 ;
  wire \x_var_reg[0]_i_1_n_4 ;
  wire \x_var_reg[0]_i_1_n_5 ;
  wire \x_var_reg[0]_i_1_n_6 ;
  wire \x_var_reg[0]_i_1_n_7 ;
  wire \x_var_reg[12]_i_1_n_0 ;
  wire \x_var_reg[12]_i_1_n_4 ;
  wire \x_var_reg[12]_i_1_n_5 ;
  wire \x_var_reg[12]_i_1_n_6 ;
  wire \x_var_reg[12]_i_1_n_7 ;
  wire \x_var_reg[16]_i_1_n_0 ;
  wire \x_var_reg[16]_i_1_n_4 ;
  wire \x_var_reg[16]_i_1_n_5 ;
  wire \x_var_reg[16]_i_1_n_6 ;
  wire \x_var_reg[16]_i_1_n_7 ;
  wire \x_var_reg[20]_i_1_n_0 ;
  wire \x_var_reg[20]_i_1_n_4 ;
  wire \x_var_reg[20]_i_1_n_5 ;
  wire \x_var_reg[20]_i_1_n_6 ;
  wire \x_var_reg[20]_i_1_n_7 ;
  wire \x_var_reg[24]_i_1_n_0 ;
  wire \x_var_reg[24]_i_1_n_4 ;
  wire \x_var_reg[24]_i_1_n_5 ;
  wire \x_var_reg[24]_i_1_n_6 ;
  wire \x_var_reg[24]_i_1_n_7 ;
  wire \x_var_reg[28]_i_1_n_4 ;
  wire \x_var_reg[28]_i_1_n_5 ;
  wire \x_var_reg[28]_i_1_n_6 ;
  wire \x_var_reg[28]_i_1_n_7 ;
  wire \x_var_reg[4]_i_1_n_0 ;
  wire \x_var_reg[4]_i_1_n_4 ;
  wire \x_var_reg[4]_i_1_n_5 ;
  wire \x_var_reg[4]_i_1_n_6 ;
  wire \x_var_reg[4]_i_1_n_7 ;
  wire \x_var_reg[8]_i_1_n_0 ;
  wire \x_var_reg[8]_i_1_n_4 ;
  wire \x_var_reg[8]_i_1_n_5 ;
  wire \x_var_reg[8]_i_1_n_6 ;
  wire \x_var_reg[8]_i_1_n_7 ;
  wire [31:0]y_var;
  wire [31:0]y_var0;
  wire \y_var[0]_i_2_n_0 ;
  wire \y_var[0]_i_3_n_0 ;
  wire \y_var[0]_i_4_n_0 ;
  wire \y_var[0]_i_5_n_0 ;
  wire \y_var[0]_i_6_n_0 ;
  wire \y_var[0]_i_7_n_0 ;
  wire \y_var[0]_i_8_n_0 ;
  wire \y_var[0]_i_9_n_0 ;
  wire \y_var[12]_i_2_n_0 ;
  wire \y_var[12]_i_3_n_0 ;
  wire \y_var[12]_i_4_n_0 ;
  wire \y_var[12]_i_5_n_0 ;
  wire \y_var[12]_i_6_n_0 ;
  wire \y_var[12]_i_7_n_0 ;
  wire \y_var[12]_i_8_n_0 ;
  wire \y_var[12]_i_9_n_0 ;
  wire \y_var[16]_i_2_n_0 ;
  wire \y_var[16]_i_3_n_0 ;
  wire \y_var[16]_i_4_n_0 ;
  wire \y_var[16]_i_5_n_0 ;
  wire \y_var[16]_i_6_n_0 ;
  wire \y_var[16]_i_7_n_0 ;
  wire \y_var[16]_i_8_n_0 ;
  wire \y_var[16]_i_9_n_0 ;
  wire \y_var[20]_i_2_n_0 ;
  wire \y_var[20]_i_3_n_0 ;
  wire \y_var[20]_i_4_n_0 ;
  wire \y_var[20]_i_5_n_0 ;
  wire \y_var[20]_i_6_n_0 ;
  wire \y_var[20]_i_7_n_0 ;
  wire \y_var[20]_i_8_n_0 ;
  wire \y_var[20]_i_9_n_0 ;
  wire \y_var[24]_i_2_n_0 ;
  wire \y_var[24]_i_3_n_0 ;
  wire \y_var[24]_i_4_n_0 ;
  wire \y_var[24]_i_5_n_0 ;
  wire \y_var[24]_i_6_n_0 ;
  wire \y_var[24]_i_7_n_0 ;
  wire \y_var[24]_i_8_n_0 ;
  wire \y_var[24]_i_9_n_0 ;
  wire \y_var[28]_i_2_n_0 ;
  wire \y_var[28]_i_3_n_0 ;
  wire \y_var[28]_i_4_n_0 ;
  wire \y_var[28]_i_5_n_0 ;
  wire \y_var[28]_i_6_n_0 ;
  wire \y_var[28]_i_7_n_0 ;
  wire \y_var[28]_i_8_n_0 ;
  wire \y_var[4]_i_2_n_0 ;
  wire \y_var[4]_i_3_n_0 ;
  wire \y_var[4]_i_4_n_0 ;
  wire \y_var[4]_i_5_n_0 ;
  wire \y_var[4]_i_6_n_0 ;
  wire \y_var[4]_i_7_n_0 ;
  wire \y_var[4]_i_8_n_0 ;
  wire \y_var[4]_i_9_n_0 ;
  wire \y_var[8]_i_2_n_0 ;
  wire \y_var[8]_i_3_n_0 ;
  wire \y_var[8]_i_4_n_0 ;
  wire \y_var[8]_i_5_n_0 ;
  wire \y_var[8]_i_6_n_0 ;
  wire \y_var[8]_i_7_n_0 ;
  wire \y_var[8]_i_8_n_0 ;
  wire \y_var[8]_i_9_n_0 ;
  wire [31:0]y_var_reg;
  wire \y_var_reg[0]_i_1_n_0 ;
  wire \y_var_reg[0]_i_1_n_4 ;
  wire \y_var_reg[0]_i_1_n_5 ;
  wire \y_var_reg[0]_i_1_n_6 ;
  wire \y_var_reg[0]_i_1_n_7 ;
  wire \y_var_reg[12]_i_1_n_0 ;
  wire \y_var_reg[12]_i_1_n_4 ;
  wire \y_var_reg[12]_i_1_n_5 ;
  wire \y_var_reg[12]_i_1_n_6 ;
  wire \y_var_reg[12]_i_1_n_7 ;
  wire \y_var_reg[16]_i_1_n_0 ;
  wire \y_var_reg[16]_i_1_n_4 ;
  wire \y_var_reg[16]_i_1_n_5 ;
  wire \y_var_reg[16]_i_1_n_6 ;
  wire \y_var_reg[16]_i_1_n_7 ;
  wire \y_var_reg[20]_i_1_n_0 ;
  wire \y_var_reg[20]_i_1_n_4 ;
  wire \y_var_reg[20]_i_1_n_5 ;
  wire \y_var_reg[20]_i_1_n_6 ;
  wire \y_var_reg[20]_i_1_n_7 ;
  wire \y_var_reg[24]_i_1_n_0 ;
  wire \y_var_reg[24]_i_1_n_4 ;
  wire \y_var_reg[24]_i_1_n_5 ;
  wire \y_var_reg[24]_i_1_n_6 ;
  wire \y_var_reg[24]_i_1_n_7 ;
  wire \y_var_reg[28]_i_1_n_4 ;
  wire \y_var_reg[28]_i_1_n_5 ;
  wire \y_var_reg[28]_i_1_n_6 ;
  wire \y_var_reg[28]_i_1_n_7 ;
  wire \y_var_reg[4]_i_1_n_0 ;
  wire \y_var_reg[4]_i_1_n_4 ;
  wire \y_var_reg[4]_i_1_n_5 ;
  wire \y_var_reg[4]_i_1_n_6 ;
  wire \y_var_reg[4]_i_1_n_7 ;
  wire \y_var_reg[8]_i_1_n_0 ;
  wire \y_var_reg[8]_i_1_n_4 ;
  wire \y_var_reg[8]_i_1_n_5 ;
  wire \y_var_reg[8]_i_1_n_6 ;
  wire \y_var_reg[8]_i_1_n_7 ;
  wire [3:0]\NLW_Xoutport_reg[31]_i_12_CO_UNCONNECTED ;
  wire [3:0]\NLW_Xoutport_reg[31]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_Xoutport_reg[31]_i_21_CO_UNCONNECTED ;
  wire [3:0]\NLW_Xoutport_reg[31]_i_3_CO_UNCONNECTED ;
  wire [3:0]NLW_u_var1__0_i_1_CO_UNCONNECTED;
  wire [3:0]NLW_u_var1__0_i_2_CO_UNCONNECTED;
  wire [3:0]NLW_u_var1__0_i_3_CO_UNCONNECTED;
  wire [3:0]NLW_u_var1__0_i_4_CO_UNCONNECTED;
  wire [3:0]NLW_u_var1__1_i_17_CO_UNCONNECTED;
  wire [3:0]NLW_u_var1__1_i_18_CO_UNCONNECTED;
  wire [3:0]NLW_u_var1_i_2_CO_UNCONNECTED;
  wire [3:0]NLW_u_var1_i_3_CO_UNCONNECTED;
  wire [3:0]NLW_u_var1_i_38_CO_UNCONNECTED;
  wire [3:0]NLW_u_var1_i_39_CO_UNCONNECTED;
  wire [3:0]NLW_u_var1_i_4_CO_UNCONNECTED;
  wire [3:0]NLW_u_var1_i_40_CO_UNCONNECTED;
  wire [3:0]NLW_u_var1_i_41_CO_UNCONNECTED;
  wire [3:0]NLW_u_var1_i_42_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2__0_i_1_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2__0_i_2_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2__0_i_3_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2__0_i_4_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2__1_i_17_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2__1_i_18_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2_i_24_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2_i_29_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2_i_3_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2_i_34_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2_i_4_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2_i_43_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2_i_44_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2_i_45_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2_i_46_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2_i_47_CO_UNCONNECTED;
  wire [3:0]NLW_u_var2_i_5_CO_UNCONNECTED;
  wire [3:0]\NLW_u_var_reg[11]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_u_var_reg[15]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_u_var_reg[19]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_u_var_reg[23]_i_11_CO_UNCONNECTED ;
  wire [3:0]\NLW_u_var_reg[23]_i_12_CO_UNCONNECTED ;
  wire [3:0]\NLW_u_var_reg[23]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_u_var_reg[27]_i_11_CO_UNCONNECTED ;
  wire [3:0]\NLW_u_var_reg[27]_i_12_CO_UNCONNECTED ;
  wire [3:0]\NLW_u_var_reg[27]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_u_var_reg[31]_i_12_CO_UNCONNECTED ;
  wire [3:0]\NLW_u_var_reg[31]_i_13_CO_UNCONNECTED ;
  wire [3:0]\NLW_u_var_reg[3]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_u_var_reg[7]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_x_var_reg[0]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_x_var_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_x_var_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_x_var_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_x_var_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_x_var_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_x_var_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_y_var_reg[0]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_y_var_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_y_var_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_y_var_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_y_var_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_y_var_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_y_var_reg[8]_i_1_CO_UNCONNECTED ;

  IBUF \Aport_IBUF[0]_inst 
       (.I(Aport[0]),
        .O(Aport_IBUF[0]));
  IBUF \Aport_IBUF[10]_inst 
       (.I(Aport[10]),
        .O(Aport_IBUF[10]));
  IBUF \Aport_IBUF[11]_inst 
       (.I(Aport[11]),
        .O(Aport_IBUF[11]));
  IBUF \Aport_IBUF[12]_inst 
       (.I(Aport[12]),
        .O(Aport_IBUF[12]));
  IBUF \Aport_IBUF[13]_inst 
       (.I(Aport[13]),
        .O(Aport_IBUF[13]));
  IBUF \Aport_IBUF[14]_inst 
       (.I(Aport[14]),
        .O(Aport_IBUF[14]));
  IBUF \Aport_IBUF[15]_inst 
       (.I(Aport[15]),
        .O(Aport_IBUF[15]));
  IBUF \Aport_IBUF[16]_inst 
       (.I(Aport[16]),
        .O(Aport_IBUF[16]));
  IBUF \Aport_IBUF[17]_inst 
       (.I(Aport[17]),
        .O(Aport_IBUF[17]));
  IBUF \Aport_IBUF[18]_inst 
       (.I(Aport[18]),
        .O(Aport_IBUF[18]));
  IBUF \Aport_IBUF[19]_inst 
       (.I(Aport[19]),
        .O(Aport_IBUF[19]));
  IBUF \Aport_IBUF[1]_inst 
       (.I(Aport[1]),
        .O(Aport_IBUF[1]));
  IBUF \Aport_IBUF[20]_inst 
       (.I(Aport[20]),
        .O(Aport_IBUF[20]));
  IBUF \Aport_IBUF[21]_inst 
       (.I(Aport[21]),
        .O(Aport_IBUF[21]));
  IBUF \Aport_IBUF[22]_inst 
       (.I(Aport[22]),
        .O(Aport_IBUF[22]));
  IBUF \Aport_IBUF[23]_inst 
       (.I(Aport[23]),
        .O(Aport_IBUF[23]));
  IBUF \Aport_IBUF[24]_inst 
       (.I(Aport[24]),
        .O(Aport_IBUF[24]));
  IBUF \Aport_IBUF[25]_inst 
       (.I(Aport[25]),
        .O(Aport_IBUF[25]));
  IBUF \Aport_IBUF[26]_inst 
       (.I(Aport[26]),
        .O(Aport_IBUF[26]));
  IBUF \Aport_IBUF[27]_inst 
       (.I(Aport[27]),
        .O(Aport_IBUF[27]));
  IBUF \Aport_IBUF[28]_inst 
       (.I(Aport[28]),
        .O(Aport_IBUF[28]));
  IBUF \Aport_IBUF[29]_inst 
       (.I(Aport[29]),
        .O(Aport_IBUF[29]));
  IBUF \Aport_IBUF[2]_inst 
       (.I(Aport[2]),
        .O(Aport_IBUF[2]));
  IBUF \Aport_IBUF[30]_inst 
       (.I(Aport[30]),
        .O(Aport_IBUF[30]));
  IBUF \Aport_IBUF[31]_inst 
       (.I(Aport[31]),
        .O(Aport_IBUF[31]));
  IBUF \Aport_IBUF[3]_inst 
       (.I(Aport[3]),
        .O(Aport_IBUF[3]));
  IBUF \Aport_IBUF[4]_inst 
       (.I(Aport[4]),
        .O(Aport_IBUF[4]));
  IBUF \Aport_IBUF[5]_inst 
       (.I(Aport[5]),
        .O(Aport_IBUF[5]));
  IBUF \Aport_IBUF[6]_inst 
       (.I(Aport[6]),
        .O(Aport_IBUF[6]));
  IBUF \Aport_IBUF[7]_inst 
       (.I(Aport[7]),
        .O(Aport_IBUF[7]));
  IBUF \Aport_IBUF[8]_inst 
       (.I(Aport[8]),
        .O(Aport_IBUF[8]));
  IBUF \Aport_IBUF[9]_inst 
       (.I(Aport[9]),
        .O(Aport_IBUF[9]));
  IBUF \DXport_IBUF[0]_inst 
       (.I(DXport[0]),
        .O(DXport_IBUF[0]));
  IBUF \DXport_IBUF[10]_inst 
       (.I(DXport[10]),
        .O(DXport_IBUF[10]));
  IBUF \DXport_IBUF[11]_inst 
       (.I(DXport[11]),
        .O(DXport_IBUF[11]));
  IBUF \DXport_IBUF[12]_inst 
       (.I(DXport[12]),
        .O(DXport_IBUF[12]));
  IBUF \DXport_IBUF[13]_inst 
       (.I(DXport[13]),
        .O(DXport_IBUF[13]));
  IBUF \DXport_IBUF[14]_inst 
       (.I(DXport[14]),
        .O(DXport_IBUF[14]));
  IBUF \DXport_IBUF[15]_inst 
       (.I(DXport[15]),
        .O(DXport_IBUF[15]));
  IBUF \DXport_IBUF[16]_inst 
       (.I(DXport[16]),
        .O(DXport_IBUF[16]));
  IBUF \DXport_IBUF[17]_inst 
       (.I(DXport[17]),
        .O(DXport_IBUF[17]));
  IBUF \DXport_IBUF[18]_inst 
       (.I(DXport[18]),
        .O(DXport_IBUF[18]));
  IBUF \DXport_IBUF[19]_inst 
       (.I(DXport[19]),
        .O(DXport_IBUF[19]));
  IBUF \DXport_IBUF[1]_inst 
       (.I(DXport[1]),
        .O(DXport_IBUF[1]));
  IBUF \DXport_IBUF[20]_inst 
       (.I(DXport[20]),
        .O(DXport_IBUF[20]));
  IBUF \DXport_IBUF[21]_inst 
       (.I(DXport[21]),
        .O(DXport_IBUF[21]));
  IBUF \DXport_IBUF[22]_inst 
       (.I(DXport[22]),
        .O(DXport_IBUF[22]));
  IBUF \DXport_IBUF[23]_inst 
       (.I(DXport[23]),
        .O(DXport_IBUF[23]));
  IBUF \DXport_IBUF[24]_inst 
       (.I(DXport[24]),
        .O(DXport_IBUF[24]));
  IBUF \DXport_IBUF[25]_inst 
       (.I(DXport[25]),
        .O(DXport_IBUF[25]));
  IBUF \DXport_IBUF[26]_inst 
       (.I(DXport[26]),
        .O(DXport_IBUF[26]));
  IBUF \DXport_IBUF[27]_inst 
       (.I(DXport[27]),
        .O(DXport_IBUF[27]));
  IBUF \DXport_IBUF[28]_inst 
       (.I(DXport[28]),
        .O(DXport_IBUF[28]));
  IBUF \DXport_IBUF[29]_inst 
       (.I(DXport[29]),
        .O(DXport_IBUF[29]));
  IBUF \DXport_IBUF[2]_inst 
       (.I(DXport[2]),
        .O(DXport_IBUF[2]));
  IBUF \DXport_IBUF[30]_inst 
       (.I(DXport[30]),
        .O(DXport_IBUF[30]));
  IBUF \DXport_IBUF[31]_inst 
       (.I(DXport[31]),
        .O(DXport_IBUF[31]));
  IBUF \DXport_IBUF[3]_inst 
       (.I(DXport[3]),
        .O(DXport_IBUF[3]));
  IBUF \DXport_IBUF[4]_inst 
       (.I(DXport[4]),
        .O(DXport_IBUF[4]));
  IBUF \DXport_IBUF[5]_inst 
       (.I(DXport[5]),
        .O(DXport_IBUF[5]));
  IBUF \DXport_IBUF[6]_inst 
       (.I(DXport[6]),
        .O(DXport_IBUF[6]));
  IBUF \DXport_IBUF[7]_inst 
       (.I(DXport[7]),
        .O(DXport_IBUF[7]));
  IBUF \DXport_IBUF[8]_inst 
       (.I(DXport[8]),
        .O(DXport_IBUF[8]));
  IBUF \DXport_IBUF[9]_inst 
       (.I(DXport[9]),
        .O(DXport_IBUF[9]));
  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  IBUF \Uinport_IBUF[0]_inst 
       (.I(Uinport[0]),
        .O(Uinport_IBUF[0]));
  IBUF \Uinport_IBUF[10]_inst 
       (.I(Uinport[10]),
        .O(Uinport_IBUF[10]));
  IBUF \Uinport_IBUF[11]_inst 
       (.I(Uinport[11]),
        .O(Uinport_IBUF[11]));
  IBUF \Uinport_IBUF[12]_inst 
       (.I(Uinport[12]),
        .O(Uinport_IBUF[12]));
  IBUF \Uinport_IBUF[13]_inst 
       (.I(Uinport[13]),
        .O(Uinport_IBUF[13]));
  IBUF \Uinport_IBUF[14]_inst 
       (.I(Uinport[14]),
        .O(Uinport_IBUF[14]));
  IBUF \Uinport_IBUF[15]_inst 
       (.I(Uinport[15]),
        .O(Uinport_IBUF[15]));
  IBUF \Uinport_IBUF[16]_inst 
       (.I(Uinport[16]),
        .O(Uinport_IBUF[16]));
  IBUF \Uinport_IBUF[17]_inst 
       (.I(Uinport[17]),
        .O(Uinport_IBUF[17]));
  IBUF \Uinport_IBUF[18]_inst 
       (.I(Uinport[18]),
        .O(Uinport_IBUF[18]));
  IBUF \Uinport_IBUF[19]_inst 
       (.I(Uinport[19]),
        .O(Uinport_IBUF[19]));
  IBUF \Uinport_IBUF[1]_inst 
       (.I(Uinport[1]),
        .O(Uinport_IBUF[1]));
  IBUF \Uinport_IBUF[20]_inst 
       (.I(Uinport[20]),
        .O(Uinport_IBUF[20]));
  IBUF \Uinport_IBUF[21]_inst 
       (.I(Uinport[21]),
        .O(Uinport_IBUF[21]));
  IBUF \Uinport_IBUF[22]_inst 
       (.I(Uinport[22]),
        .O(Uinport_IBUF[22]));
  IBUF \Uinport_IBUF[23]_inst 
       (.I(Uinport[23]),
        .O(Uinport_IBUF[23]));
  IBUF \Uinport_IBUF[24]_inst 
       (.I(Uinport[24]),
        .O(Uinport_IBUF[24]));
  IBUF \Uinport_IBUF[25]_inst 
       (.I(Uinport[25]),
        .O(Uinport_IBUF[25]));
  IBUF \Uinport_IBUF[26]_inst 
       (.I(Uinport[26]),
        .O(Uinport_IBUF[26]));
  IBUF \Uinport_IBUF[27]_inst 
       (.I(Uinport[27]),
        .O(Uinport_IBUF[27]));
  IBUF \Uinport_IBUF[28]_inst 
       (.I(Uinport[28]),
        .O(Uinport_IBUF[28]));
  IBUF \Uinport_IBUF[29]_inst 
       (.I(Uinport[29]),
        .O(Uinport_IBUF[29]));
  IBUF \Uinport_IBUF[2]_inst 
       (.I(Uinport[2]),
        .O(Uinport_IBUF[2]));
  IBUF \Uinport_IBUF[30]_inst 
       (.I(Uinport[30]),
        .O(Uinport_IBUF[30]));
  IBUF \Uinport_IBUF[31]_inst 
       (.I(Uinport[31]),
        .O(Uinport_IBUF[31]));
  IBUF \Uinport_IBUF[3]_inst 
       (.I(Uinport[3]),
        .O(Uinport_IBUF[3]));
  IBUF \Uinport_IBUF[4]_inst 
       (.I(Uinport[4]),
        .O(Uinport_IBUF[4]));
  IBUF \Uinport_IBUF[5]_inst 
       (.I(Uinport[5]),
        .O(Uinport_IBUF[5]));
  IBUF \Uinport_IBUF[6]_inst 
       (.I(Uinport[6]),
        .O(Uinport_IBUF[6]));
  IBUF \Uinport_IBUF[7]_inst 
       (.I(Uinport[7]),
        .O(Uinport_IBUF[7]));
  IBUF \Uinport_IBUF[8]_inst 
       (.I(Uinport[8]),
        .O(Uinport_IBUF[8]));
  IBUF \Uinport_IBUF[9]_inst 
       (.I(Uinport[9]),
        .O(Uinport_IBUF[9]));
  OBUF \Uoutport_OBUF[0]_inst 
       (.I(Uoutport_OBUF[0]),
        .O(Uoutport[0]));
  OBUF \Uoutport_OBUF[10]_inst 
       (.I(Uoutport_OBUF[10]),
        .O(Uoutport[10]));
  OBUF \Uoutport_OBUF[11]_inst 
       (.I(Uoutport_OBUF[11]),
        .O(Uoutport[11]));
  OBUF \Uoutport_OBUF[12]_inst 
       (.I(Uoutport_OBUF[12]),
        .O(Uoutport[12]));
  OBUF \Uoutport_OBUF[13]_inst 
       (.I(Uoutport_OBUF[13]),
        .O(Uoutport[13]));
  OBUF \Uoutport_OBUF[14]_inst 
       (.I(Uoutport_OBUF[14]),
        .O(Uoutport[14]));
  OBUF \Uoutport_OBUF[15]_inst 
       (.I(Uoutport_OBUF[15]),
        .O(Uoutport[15]));
  OBUF \Uoutport_OBUF[16]_inst 
       (.I(Uoutport_OBUF[16]),
        .O(Uoutport[16]));
  OBUF \Uoutport_OBUF[17]_inst 
       (.I(Uoutport_OBUF[17]),
        .O(Uoutport[17]));
  OBUF \Uoutport_OBUF[18]_inst 
       (.I(Uoutport_OBUF[18]),
        .O(Uoutport[18]));
  OBUF \Uoutport_OBUF[19]_inst 
       (.I(Uoutport_OBUF[19]),
        .O(Uoutport[19]));
  OBUF \Uoutport_OBUF[1]_inst 
       (.I(Uoutport_OBUF[1]),
        .O(Uoutport[1]));
  OBUF \Uoutport_OBUF[20]_inst 
       (.I(Uoutport_OBUF[20]),
        .O(Uoutport[20]));
  OBUF \Uoutport_OBUF[21]_inst 
       (.I(Uoutport_OBUF[21]),
        .O(Uoutport[21]));
  OBUF \Uoutport_OBUF[22]_inst 
       (.I(Uoutport_OBUF[22]),
        .O(Uoutport[22]));
  OBUF \Uoutport_OBUF[23]_inst 
       (.I(Uoutport_OBUF[23]),
        .O(Uoutport[23]));
  OBUF \Uoutport_OBUF[24]_inst 
       (.I(Uoutport_OBUF[24]),
        .O(Uoutport[24]));
  OBUF \Uoutport_OBUF[25]_inst 
       (.I(Uoutport_OBUF[25]),
        .O(Uoutport[25]));
  OBUF \Uoutport_OBUF[26]_inst 
       (.I(Uoutport_OBUF[26]),
        .O(Uoutport[26]));
  OBUF \Uoutport_OBUF[27]_inst 
       (.I(Uoutport_OBUF[27]),
        .O(Uoutport[27]));
  OBUF \Uoutport_OBUF[28]_inst 
       (.I(Uoutport_OBUF[28]),
        .O(Uoutport[28]));
  OBUF \Uoutport_OBUF[29]_inst 
       (.I(Uoutport_OBUF[29]),
        .O(Uoutport[29]));
  OBUF \Uoutport_OBUF[2]_inst 
       (.I(Uoutport_OBUF[2]),
        .O(Uoutport[2]));
  OBUF \Uoutport_OBUF[30]_inst 
       (.I(Uoutport_OBUF[30]),
        .O(Uoutport[30]));
  OBUF \Uoutport_OBUF[31]_inst 
       (.I(Uoutport_OBUF[31]),
        .O(Uoutport[31]));
  OBUF \Uoutport_OBUF[3]_inst 
       (.I(Uoutport_OBUF[3]),
        .O(Uoutport[3]));
  OBUF \Uoutport_OBUF[4]_inst 
       (.I(Uoutport_OBUF[4]),
        .O(Uoutport[4]));
  OBUF \Uoutport_OBUF[5]_inst 
       (.I(Uoutport_OBUF[5]),
        .O(Uoutport[5]));
  OBUF \Uoutport_OBUF[6]_inst 
       (.I(Uoutport_OBUF[6]),
        .O(Uoutport[6]));
  OBUF \Uoutport_OBUF[7]_inst 
       (.I(Uoutport_OBUF[7]),
        .O(Uoutport[7]));
  OBUF \Uoutport_OBUF[8]_inst 
       (.I(Uoutport_OBUF[8]),
        .O(Uoutport[8]));
  OBUF \Uoutport_OBUF[9]_inst 
       (.I(Uoutport_OBUF[9]),
        .O(Uoutport[9]));
  FDRE \Uoutport_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[0] ),
        .Q(Uoutport_OBUF[0]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[10] ),
        .Q(Uoutport_OBUF[10]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[11] ),
        .Q(Uoutport_OBUF[11]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[12] ),
        .Q(Uoutport_OBUF[12]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[13] ),
        .Q(Uoutport_OBUF[13]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[14] ),
        .Q(Uoutport_OBUF[14]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[15] ),
        .Q(Uoutport_OBUF[15]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[16] ),
        .Q(Uoutport_OBUF[16]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[17] ),
        .Q(Uoutport_OBUF[17]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[18] ),
        .Q(Uoutport_OBUF[18]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[19] ),
        .Q(Uoutport_OBUF[19]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[1] ),
        .Q(Uoutport_OBUF[1]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[20] ),
        .Q(Uoutport_OBUF[20]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[21] ),
        .Q(Uoutport_OBUF[21]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[22] ),
        .Q(Uoutport_OBUF[22]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[23] ),
        .Q(Uoutport_OBUF[23]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[24] ),
        .Q(Uoutport_OBUF[24]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[25] ),
        .Q(Uoutport_OBUF[25]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[26] ),
        .Q(Uoutport_OBUF[26]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[27] ),
        .Q(Uoutport_OBUF[27]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[28] ),
        .Q(Uoutport_OBUF[28]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[29] ),
        .Q(Uoutport_OBUF[29]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[2] ),
        .Q(Uoutport_OBUF[2]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[30] ),
        .Q(Uoutport_OBUF[30]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[31] ),
        .Q(Uoutport_OBUF[31]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[3] ),
        .Q(Uoutport_OBUF[3]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[4] ),
        .Q(Uoutport_OBUF[4]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[5] ),
        .Q(Uoutport_OBUF[5]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[6] ),
        .Q(Uoutport_OBUF[6]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[7] ),
        .Q(Uoutport_OBUF[7]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[8] ),
        .Q(Uoutport_OBUF[8]),
        .R(\<const0> ));
  FDRE \Uoutport_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(\u_var_reg_n_0_[9] ),
        .Q(Uoutport_OBUF[9]),
        .R(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  VCC VCC_1
       (.P(VCC_2));
  IBUF \Xinport_IBUF[0]_inst 
       (.I(Xinport[0]),
        .O(Xinport_IBUF[0]));
  IBUF \Xinport_IBUF[10]_inst 
       (.I(Xinport[10]),
        .O(Xinport_IBUF[10]));
  IBUF \Xinport_IBUF[11]_inst 
       (.I(Xinport[11]),
        .O(Xinport_IBUF[11]));
  IBUF \Xinport_IBUF[12]_inst 
       (.I(Xinport[12]),
        .O(Xinport_IBUF[12]));
  IBUF \Xinport_IBUF[13]_inst 
       (.I(Xinport[13]),
        .O(Xinport_IBUF[13]));
  IBUF \Xinport_IBUF[14]_inst 
       (.I(Xinport[14]),
        .O(Xinport_IBUF[14]));
  IBUF \Xinport_IBUF[15]_inst 
       (.I(Xinport[15]),
        .O(Xinport_IBUF[15]));
  IBUF \Xinport_IBUF[16]_inst 
       (.I(Xinport[16]),
        .O(Xinport_IBUF[16]));
  IBUF \Xinport_IBUF[17]_inst 
       (.I(Xinport[17]),
        .O(Xinport_IBUF[17]));
  IBUF \Xinport_IBUF[18]_inst 
       (.I(Xinport[18]),
        .O(Xinport_IBUF[18]));
  IBUF \Xinport_IBUF[19]_inst 
       (.I(Xinport[19]),
        .O(Xinport_IBUF[19]));
  IBUF \Xinport_IBUF[1]_inst 
       (.I(Xinport[1]),
        .O(Xinport_IBUF[1]));
  IBUF \Xinport_IBUF[20]_inst 
       (.I(Xinport[20]),
        .O(Xinport_IBUF[20]));
  IBUF \Xinport_IBUF[21]_inst 
       (.I(Xinport[21]),
        .O(Xinport_IBUF[21]));
  IBUF \Xinport_IBUF[22]_inst 
       (.I(Xinport[22]),
        .O(Xinport_IBUF[22]));
  IBUF \Xinport_IBUF[23]_inst 
       (.I(Xinport[23]),
        .O(Xinport_IBUF[23]));
  IBUF \Xinport_IBUF[24]_inst 
       (.I(Xinport[24]),
        .O(Xinport_IBUF[24]));
  IBUF \Xinport_IBUF[25]_inst 
       (.I(Xinport[25]),
        .O(Xinport_IBUF[25]));
  IBUF \Xinport_IBUF[26]_inst 
       (.I(Xinport[26]),
        .O(Xinport_IBUF[26]));
  IBUF \Xinport_IBUF[27]_inst 
       (.I(Xinport[27]),
        .O(Xinport_IBUF[27]));
  IBUF \Xinport_IBUF[28]_inst 
       (.I(Xinport[28]),
        .O(Xinport_IBUF[28]));
  IBUF \Xinport_IBUF[29]_inst 
       (.I(Xinport[29]),
        .O(Xinport_IBUF[29]));
  IBUF \Xinport_IBUF[2]_inst 
       (.I(Xinport[2]),
        .O(Xinport_IBUF[2]));
  IBUF \Xinport_IBUF[30]_inst 
       (.I(Xinport[30]),
        .O(Xinport_IBUF[30]));
  IBUF \Xinport_IBUF[31]_inst 
       (.I(Xinport[31]),
        .O(Xinport_IBUF[31]));
  IBUF \Xinport_IBUF[3]_inst 
       (.I(Xinport[3]),
        .O(Xinport_IBUF[3]));
  IBUF \Xinport_IBUF[4]_inst 
       (.I(Xinport[4]),
        .O(Xinport_IBUF[4]));
  IBUF \Xinport_IBUF[5]_inst 
       (.I(Xinport[5]),
        .O(Xinport_IBUF[5]));
  IBUF \Xinport_IBUF[6]_inst 
       (.I(Xinport[6]),
        .O(Xinport_IBUF[6]));
  IBUF \Xinport_IBUF[7]_inst 
       (.I(Xinport[7]),
        .O(Xinport_IBUF[7]));
  IBUF \Xinport_IBUF[8]_inst 
       (.I(Xinport[8]),
        .O(Xinport_IBUF[8]));
  IBUF \Xinport_IBUF[9]_inst 
       (.I(Xinport[9]),
        .O(Xinport_IBUF[9]));
  LUT3 #(
    .INIT(8'h04)) 
    \Xoutport[31]_i_1 
       (.I0(reset_IBUF),
        .I1(looping),
        .I2(\Xoutport_reg[31]_i_2_n_0 ),
        .O(\Xoutport[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \Xoutport[31]_i_10 
       (.I0(Aport_IBUF[26]),
        .I1(x_var_reg[26]),
        .I2(Aport_IBUF[27]),
        .I3(x_var_reg[27]),
        .O(\Xoutport[31]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \Xoutport[31]_i_11 
       (.I0(Aport_IBUF[24]),
        .I1(x_var_reg[24]),
        .I2(Aport_IBUF[25]),
        .I3(x_var_reg[25]),
        .O(\Xoutport[31]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \Xoutport[31]_i_13 
       (.I0(Aport_IBUF[22]),
        .I1(x_var_reg[22]),
        .I2(x_var_reg[23]),
        .I3(Aport_IBUF[23]),
        .O(\Xoutport[31]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \Xoutport[31]_i_14 
       (.I0(Aport_IBUF[20]),
        .I1(x_var_reg[20]),
        .I2(x_var_reg[21]),
        .I3(Aport_IBUF[21]),
        .O(\Xoutport[31]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \Xoutport[31]_i_15 
       (.I0(Aport_IBUF[18]),
        .I1(x_var_reg[18]),
        .I2(x_var_reg[19]),
        .I3(Aport_IBUF[19]),
        .O(\Xoutport[31]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \Xoutport[31]_i_16 
       (.I0(Aport_IBUF[16]),
        .I1(x_var_reg[16]),
        .I2(x_var_reg[17]),
        .I3(Aport_IBUF[17]),
        .O(\Xoutport[31]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \Xoutport[31]_i_17 
       (.I0(Aport_IBUF[22]),
        .I1(x_var_reg[22]),
        .I2(Aport_IBUF[23]),
        .I3(x_var_reg[23]),
        .O(\Xoutport[31]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \Xoutport[31]_i_18 
       (.I0(Aport_IBUF[20]),
        .I1(x_var_reg[20]),
        .I2(Aport_IBUF[21]),
        .I3(x_var_reg[21]),
        .O(\Xoutport[31]_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \Xoutport[31]_i_19 
       (.I0(Aport_IBUF[18]),
        .I1(x_var_reg[18]),
        .I2(Aport_IBUF[19]),
        .I3(x_var_reg[19]),
        .O(\Xoutport[31]_i_19_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \Xoutport[31]_i_20 
       (.I0(Aport_IBUF[16]),
        .I1(x_var_reg[16]),
        .I2(Aport_IBUF[17]),
        .I3(x_var_reg[17]),
        .O(\Xoutport[31]_i_20_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \Xoutport[31]_i_22 
       (.I0(Aport_IBUF[14]),
        .I1(x_var_reg[14]),
        .I2(x_var_reg[15]),
        .I3(Aport_IBUF[15]),
        .O(\Xoutport[31]_i_22_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \Xoutport[31]_i_23 
       (.I0(Aport_IBUF[12]),
        .I1(x_var_reg[12]),
        .I2(x_var_reg[13]),
        .I3(Aport_IBUF[13]),
        .O(\Xoutport[31]_i_23_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \Xoutport[31]_i_24 
       (.I0(Aport_IBUF[10]),
        .I1(x_var_reg[10]),
        .I2(x_var_reg[11]),
        .I3(Aport_IBUF[11]),
        .O(\Xoutport[31]_i_24_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \Xoutport[31]_i_25 
       (.I0(Aport_IBUF[8]),
        .I1(x_var_reg[8]),
        .I2(x_var_reg[9]),
        .I3(Aport_IBUF[9]),
        .O(\Xoutport[31]_i_25_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \Xoutport[31]_i_26 
       (.I0(Aport_IBUF[14]),
        .I1(x_var_reg[14]),
        .I2(Aport_IBUF[15]),
        .I3(x_var_reg[15]),
        .O(\Xoutport[31]_i_26_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \Xoutport[31]_i_27 
       (.I0(Aport_IBUF[12]),
        .I1(x_var_reg[12]),
        .I2(Aport_IBUF[13]),
        .I3(x_var_reg[13]),
        .O(\Xoutport[31]_i_27_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \Xoutport[31]_i_28 
       (.I0(Aport_IBUF[10]),
        .I1(x_var_reg[10]),
        .I2(Aport_IBUF[11]),
        .I3(x_var_reg[11]),
        .O(\Xoutport[31]_i_28_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \Xoutport[31]_i_29 
       (.I0(Aport_IBUF[8]),
        .I1(x_var_reg[8]),
        .I2(Aport_IBUF[9]),
        .I3(x_var_reg[9]),
        .O(\Xoutport[31]_i_29_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \Xoutport[31]_i_30 
       (.I0(Aport_IBUF[6]),
        .I1(x_var_reg[6]),
        .I2(x_var_reg[7]),
        .I3(Aport_IBUF[7]),
        .O(\Xoutport[31]_i_30_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \Xoutport[31]_i_31 
       (.I0(Aport_IBUF[4]),
        .I1(x_var_reg[4]),
        .I2(x_var_reg[5]),
        .I3(Aport_IBUF[5]),
        .O(\Xoutport[31]_i_31_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \Xoutport[31]_i_32 
       (.I0(Aport_IBUF[2]),
        .I1(x_var_reg[2]),
        .I2(x_var_reg[3]),
        .I3(Aport_IBUF[3]),
        .O(\Xoutport[31]_i_32_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \Xoutport[31]_i_33 
       (.I0(Aport_IBUF[0]),
        .I1(x_var_reg[0]),
        .I2(x_var_reg[1]),
        .I3(Aport_IBUF[1]),
        .O(\Xoutport[31]_i_33_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \Xoutport[31]_i_34 
       (.I0(Aport_IBUF[6]),
        .I1(x_var_reg[6]),
        .I2(Aport_IBUF[7]),
        .I3(x_var_reg[7]),
        .O(\Xoutport[31]_i_34_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \Xoutport[31]_i_35 
       (.I0(Aport_IBUF[4]),
        .I1(x_var_reg[4]),
        .I2(Aport_IBUF[5]),
        .I3(x_var_reg[5]),
        .O(\Xoutport[31]_i_35_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \Xoutport[31]_i_36 
       (.I0(Aport_IBUF[2]),
        .I1(x_var_reg[2]),
        .I2(Aport_IBUF[3]),
        .I3(x_var_reg[3]),
        .O(\Xoutport[31]_i_36_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \Xoutport[31]_i_37 
       (.I0(Aport_IBUF[0]),
        .I1(x_var_reg[0]),
        .I2(Aport_IBUF[1]),
        .I3(x_var_reg[1]),
        .O(\Xoutport[31]_i_37_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \Xoutport[31]_i_4 
       (.I0(Aport_IBUF[30]),
        .I1(x_var_reg[30]),
        .I2(x_var_reg[31]),
        .I3(Aport_IBUF[31]),
        .O(\Xoutport[31]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \Xoutport[31]_i_5 
       (.I0(Aport_IBUF[28]),
        .I1(x_var_reg[28]),
        .I2(x_var_reg[29]),
        .I3(Aport_IBUF[29]),
        .O(\Xoutport[31]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \Xoutport[31]_i_6 
       (.I0(Aport_IBUF[26]),
        .I1(x_var_reg[26]),
        .I2(x_var_reg[27]),
        .I3(Aport_IBUF[27]),
        .O(\Xoutport[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \Xoutport[31]_i_7 
       (.I0(Aport_IBUF[24]),
        .I1(x_var_reg[24]),
        .I2(x_var_reg[25]),
        .I3(Aport_IBUF[25]),
        .O(\Xoutport[31]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \Xoutport[31]_i_8 
       (.I0(Aport_IBUF[30]),
        .I1(x_var_reg[30]),
        .I2(Aport_IBUF[31]),
        .I3(x_var_reg[31]),
        .O(\Xoutport[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \Xoutport[31]_i_9 
       (.I0(Aport_IBUF[28]),
        .I1(x_var_reg[28]),
        .I2(Aport_IBUF[29]),
        .I3(x_var_reg[29]),
        .O(\Xoutport[31]_i_9_n_0 ));
  OBUF \Xoutport_OBUF[0]_inst 
       (.I(Xoutport_OBUF[0]),
        .O(Xoutport[0]));
  OBUF \Xoutport_OBUF[10]_inst 
       (.I(Xoutport_OBUF[10]),
        .O(Xoutport[10]));
  OBUF \Xoutport_OBUF[11]_inst 
       (.I(Xoutport_OBUF[11]),
        .O(Xoutport[11]));
  OBUF \Xoutport_OBUF[12]_inst 
       (.I(Xoutport_OBUF[12]),
        .O(Xoutport[12]));
  OBUF \Xoutport_OBUF[13]_inst 
       (.I(Xoutport_OBUF[13]),
        .O(Xoutport[13]));
  OBUF \Xoutport_OBUF[14]_inst 
       (.I(Xoutport_OBUF[14]),
        .O(Xoutport[14]));
  OBUF \Xoutport_OBUF[15]_inst 
       (.I(Xoutport_OBUF[15]),
        .O(Xoutport[15]));
  OBUF \Xoutport_OBUF[16]_inst 
       (.I(Xoutport_OBUF[16]),
        .O(Xoutport[16]));
  OBUF \Xoutport_OBUF[17]_inst 
       (.I(Xoutport_OBUF[17]),
        .O(Xoutport[17]));
  OBUF \Xoutport_OBUF[18]_inst 
       (.I(Xoutport_OBUF[18]),
        .O(Xoutport[18]));
  OBUF \Xoutport_OBUF[19]_inst 
       (.I(Xoutport_OBUF[19]),
        .O(Xoutport[19]));
  OBUF \Xoutport_OBUF[1]_inst 
       (.I(Xoutport_OBUF[1]),
        .O(Xoutport[1]));
  OBUF \Xoutport_OBUF[20]_inst 
       (.I(Xoutport_OBUF[20]),
        .O(Xoutport[20]));
  OBUF \Xoutport_OBUF[21]_inst 
       (.I(Xoutport_OBUF[21]),
        .O(Xoutport[21]));
  OBUF \Xoutport_OBUF[22]_inst 
       (.I(Xoutport_OBUF[22]),
        .O(Xoutport[22]));
  OBUF \Xoutport_OBUF[23]_inst 
       (.I(Xoutport_OBUF[23]),
        .O(Xoutport[23]));
  OBUF \Xoutport_OBUF[24]_inst 
       (.I(Xoutport_OBUF[24]),
        .O(Xoutport[24]));
  OBUF \Xoutport_OBUF[25]_inst 
       (.I(Xoutport_OBUF[25]),
        .O(Xoutport[25]));
  OBUF \Xoutport_OBUF[26]_inst 
       (.I(Xoutport_OBUF[26]),
        .O(Xoutport[26]));
  OBUF \Xoutport_OBUF[27]_inst 
       (.I(Xoutport_OBUF[27]),
        .O(Xoutport[27]));
  OBUF \Xoutport_OBUF[28]_inst 
       (.I(Xoutport_OBUF[28]),
        .O(Xoutport[28]));
  OBUF \Xoutport_OBUF[29]_inst 
       (.I(Xoutport_OBUF[29]),
        .O(Xoutport[29]));
  OBUF \Xoutport_OBUF[2]_inst 
       (.I(Xoutport_OBUF[2]),
        .O(Xoutport[2]));
  OBUF \Xoutport_OBUF[30]_inst 
       (.I(Xoutport_OBUF[30]),
        .O(Xoutport[30]));
  OBUF \Xoutport_OBUF[31]_inst 
       (.I(Xoutport_OBUF[31]),
        .O(Xoutport[31]));
  OBUF \Xoutport_OBUF[3]_inst 
       (.I(Xoutport_OBUF[3]),
        .O(Xoutport[3]));
  OBUF \Xoutport_OBUF[4]_inst 
       (.I(Xoutport_OBUF[4]),
        .O(Xoutport[4]));
  OBUF \Xoutport_OBUF[5]_inst 
       (.I(Xoutport_OBUF[5]),
        .O(Xoutport[5]));
  OBUF \Xoutport_OBUF[6]_inst 
       (.I(Xoutport_OBUF[6]),
        .O(Xoutport[6]));
  OBUF \Xoutport_OBUF[7]_inst 
       (.I(Xoutport_OBUF[7]),
        .O(Xoutport[7]));
  OBUF \Xoutport_OBUF[8]_inst 
       (.I(Xoutport_OBUF[8]),
        .O(Xoutport[8]));
  OBUF \Xoutport_OBUF[9]_inst 
       (.I(Xoutport_OBUF[9]),
        .O(Xoutport[9]));
  FDRE \Xoutport_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[0]),
        .Q(Xoutport_OBUF[0]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[10]),
        .Q(Xoutport_OBUF[10]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[11]),
        .Q(Xoutport_OBUF[11]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[12]),
        .Q(Xoutport_OBUF[12]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[13]),
        .Q(Xoutport_OBUF[13]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[14]),
        .Q(Xoutport_OBUF[14]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[15]),
        .Q(Xoutport_OBUF[15]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[16]),
        .Q(Xoutport_OBUF[16]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[17]),
        .Q(Xoutport_OBUF[17]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[18]),
        .Q(Xoutport_OBUF[18]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[19]),
        .Q(Xoutport_OBUF[19]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[1]),
        .Q(Xoutport_OBUF[1]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[20]),
        .Q(Xoutport_OBUF[20]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[21]),
        .Q(Xoutport_OBUF[21]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[22]),
        .Q(Xoutport_OBUF[22]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[23]),
        .Q(Xoutport_OBUF[23]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[24]),
        .Q(Xoutport_OBUF[24]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[25]),
        .Q(Xoutport_OBUF[25]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[26]),
        .Q(Xoutport_OBUF[26]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[27]),
        .Q(Xoutport_OBUF[27]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[28]),
        .Q(Xoutport_OBUF[28]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[29]),
        .Q(Xoutport_OBUF[29]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[2]),
        .Q(Xoutport_OBUF[2]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[30]),
        .Q(Xoutport_OBUF[30]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[31]),
        .Q(Xoutport_OBUF[31]),
        .R(\<const0> ));
  CARRY4 \Xoutport_reg[31]_i_12 
       (.CI(\Xoutport_reg[31]_i_21_n_0 ),
        .CO({\Xoutport_reg[31]_i_12_n_0 ,\NLW_Xoutport_reg[31]_i_12_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\Xoutport[31]_i_22_n_0 ,\Xoutport[31]_i_23_n_0 ,\Xoutport[31]_i_24_n_0 ,\Xoutport[31]_i_25_n_0 }),
        .S({\Xoutport[31]_i_26_n_0 ,\Xoutport[31]_i_27_n_0 ,\Xoutport[31]_i_28_n_0 ,\Xoutport[31]_i_29_n_0 }));
  CARRY4 \Xoutport_reg[31]_i_2 
       (.CI(\Xoutport_reg[31]_i_3_n_0 ),
        .CO({\Xoutport_reg[31]_i_2_n_0 ,\NLW_Xoutport_reg[31]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\Xoutport[31]_i_4_n_0 ,\Xoutport[31]_i_5_n_0 ,\Xoutport[31]_i_6_n_0 ,\Xoutport[31]_i_7_n_0 }),
        .S({\Xoutport[31]_i_8_n_0 ,\Xoutport[31]_i_9_n_0 ,\Xoutport[31]_i_10_n_0 ,\Xoutport[31]_i_11_n_0 }));
  CARRY4 \Xoutport_reg[31]_i_21 
       (.CI(\<const0> ),
        .CO({\Xoutport_reg[31]_i_21_n_0 ,\NLW_Xoutport_reg[31]_i_21_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\Xoutport[31]_i_30_n_0 ,\Xoutport[31]_i_31_n_0 ,\Xoutport[31]_i_32_n_0 ,\Xoutport[31]_i_33_n_0 }),
        .S({\Xoutport[31]_i_34_n_0 ,\Xoutport[31]_i_35_n_0 ,\Xoutport[31]_i_36_n_0 ,\Xoutport[31]_i_37_n_0 }));
  CARRY4 \Xoutport_reg[31]_i_3 
       (.CI(\Xoutport_reg[31]_i_12_n_0 ),
        .CO({\Xoutport_reg[31]_i_3_n_0 ,\NLW_Xoutport_reg[31]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\Xoutport[31]_i_13_n_0 ,\Xoutport[31]_i_14_n_0 ,\Xoutport[31]_i_15_n_0 ,\Xoutport[31]_i_16_n_0 }),
        .S({\Xoutport[31]_i_17_n_0 ,\Xoutport[31]_i_18_n_0 ,\Xoutport[31]_i_19_n_0 ,\Xoutport[31]_i_20_n_0 }));
  FDRE \Xoutport_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[3]),
        .Q(Xoutport_OBUF[3]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[4]),
        .Q(Xoutport_OBUF[4]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[5]),
        .Q(Xoutport_OBUF[5]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[6]),
        .Q(Xoutport_OBUF[6]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[7]),
        .Q(Xoutport_OBUF[7]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[8]),
        .Q(Xoutport_OBUF[8]),
        .R(\<const0> ));
  FDRE \Xoutport_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(x_var_reg[9]),
        .Q(Xoutport_OBUF[9]),
        .R(\<const0> ));
  IBUF \Yinport_IBUF[0]_inst 
       (.I(Yinport[0]),
        .O(Yinport_IBUF[0]));
  IBUF \Yinport_IBUF[10]_inst 
       (.I(Yinport[10]),
        .O(Yinport_IBUF[10]));
  IBUF \Yinport_IBUF[11]_inst 
       (.I(Yinport[11]),
        .O(Yinport_IBUF[11]));
  IBUF \Yinport_IBUF[12]_inst 
       (.I(Yinport[12]),
        .O(Yinport_IBUF[12]));
  IBUF \Yinport_IBUF[13]_inst 
       (.I(Yinport[13]),
        .O(Yinport_IBUF[13]));
  IBUF \Yinport_IBUF[14]_inst 
       (.I(Yinport[14]),
        .O(Yinport_IBUF[14]));
  IBUF \Yinport_IBUF[15]_inst 
       (.I(Yinport[15]),
        .O(Yinport_IBUF[15]));
  IBUF \Yinport_IBUF[16]_inst 
       (.I(Yinport[16]),
        .O(Yinport_IBUF[16]));
  IBUF \Yinport_IBUF[17]_inst 
       (.I(Yinport[17]),
        .O(Yinport_IBUF[17]));
  IBUF \Yinport_IBUF[18]_inst 
       (.I(Yinport[18]),
        .O(Yinport_IBUF[18]));
  IBUF \Yinport_IBUF[19]_inst 
       (.I(Yinport[19]),
        .O(Yinport_IBUF[19]));
  IBUF \Yinport_IBUF[1]_inst 
       (.I(Yinport[1]),
        .O(Yinport_IBUF[1]));
  IBUF \Yinport_IBUF[20]_inst 
       (.I(Yinport[20]),
        .O(Yinport_IBUF[20]));
  IBUF \Yinport_IBUF[21]_inst 
       (.I(Yinport[21]),
        .O(Yinport_IBUF[21]));
  IBUF \Yinport_IBUF[22]_inst 
       (.I(Yinport[22]),
        .O(Yinport_IBUF[22]));
  IBUF \Yinport_IBUF[23]_inst 
       (.I(Yinport[23]),
        .O(Yinport_IBUF[23]));
  IBUF \Yinport_IBUF[24]_inst 
       (.I(Yinport[24]),
        .O(Yinport_IBUF[24]));
  IBUF \Yinport_IBUF[25]_inst 
       (.I(Yinport[25]),
        .O(Yinport_IBUF[25]));
  IBUF \Yinport_IBUF[26]_inst 
       (.I(Yinport[26]),
        .O(Yinport_IBUF[26]));
  IBUF \Yinport_IBUF[27]_inst 
       (.I(Yinport[27]),
        .O(Yinport_IBUF[27]));
  IBUF \Yinport_IBUF[28]_inst 
       (.I(Yinport[28]),
        .O(Yinport_IBUF[28]));
  IBUF \Yinport_IBUF[29]_inst 
       (.I(Yinport[29]),
        .O(Yinport_IBUF[29]));
  IBUF \Yinport_IBUF[2]_inst 
       (.I(Yinport[2]),
        .O(Yinport_IBUF[2]));
  IBUF \Yinport_IBUF[30]_inst 
       (.I(Yinport[30]),
        .O(Yinport_IBUF[30]));
  IBUF \Yinport_IBUF[31]_inst 
       (.I(Yinport[31]),
        .O(Yinport_IBUF[31]));
  IBUF \Yinport_IBUF[3]_inst 
       (.I(Yinport[3]),
        .O(Yinport_IBUF[3]));
  IBUF \Yinport_IBUF[4]_inst 
       (.I(Yinport[4]),
        .O(Yinport_IBUF[4]));
  IBUF \Yinport_IBUF[5]_inst 
       (.I(Yinport[5]),
        .O(Yinport_IBUF[5]));
  IBUF \Yinport_IBUF[6]_inst 
       (.I(Yinport[6]),
        .O(Yinport_IBUF[6]));
  IBUF \Yinport_IBUF[7]_inst 
       (.I(Yinport[7]),
        .O(Yinport_IBUF[7]));
  IBUF \Yinport_IBUF[8]_inst 
       (.I(Yinport[8]),
        .O(Yinport_IBUF[8]));
  IBUF \Yinport_IBUF[9]_inst 
       (.I(Yinport[9]),
        .O(Yinport_IBUF[9]));
  OBUF \Youtport_OBUF[0]_inst 
       (.I(Youtport_OBUF[0]),
        .O(Youtport[0]));
  OBUF \Youtport_OBUF[10]_inst 
       (.I(Youtport_OBUF[10]),
        .O(Youtport[10]));
  OBUF \Youtport_OBUF[11]_inst 
       (.I(Youtport_OBUF[11]),
        .O(Youtport[11]));
  OBUF \Youtport_OBUF[12]_inst 
       (.I(Youtport_OBUF[12]),
        .O(Youtport[12]));
  OBUF \Youtport_OBUF[13]_inst 
       (.I(Youtport_OBUF[13]),
        .O(Youtport[13]));
  OBUF \Youtport_OBUF[14]_inst 
       (.I(Youtport_OBUF[14]),
        .O(Youtport[14]));
  OBUF \Youtport_OBUF[15]_inst 
       (.I(Youtport_OBUF[15]),
        .O(Youtport[15]));
  OBUF \Youtport_OBUF[16]_inst 
       (.I(Youtport_OBUF[16]),
        .O(Youtport[16]));
  OBUF \Youtport_OBUF[17]_inst 
       (.I(Youtport_OBUF[17]),
        .O(Youtport[17]));
  OBUF \Youtport_OBUF[18]_inst 
       (.I(Youtport_OBUF[18]),
        .O(Youtport[18]));
  OBUF \Youtport_OBUF[19]_inst 
       (.I(Youtport_OBUF[19]),
        .O(Youtport[19]));
  OBUF \Youtport_OBUF[1]_inst 
       (.I(Youtport_OBUF[1]),
        .O(Youtport[1]));
  OBUF \Youtport_OBUF[20]_inst 
       (.I(Youtport_OBUF[20]),
        .O(Youtport[20]));
  OBUF \Youtport_OBUF[21]_inst 
       (.I(Youtport_OBUF[21]),
        .O(Youtport[21]));
  OBUF \Youtport_OBUF[22]_inst 
       (.I(Youtport_OBUF[22]),
        .O(Youtport[22]));
  OBUF \Youtport_OBUF[23]_inst 
       (.I(Youtport_OBUF[23]),
        .O(Youtport[23]));
  OBUF \Youtport_OBUF[24]_inst 
       (.I(Youtport_OBUF[24]),
        .O(Youtport[24]));
  OBUF \Youtport_OBUF[25]_inst 
       (.I(Youtport_OBUF[25]),
        .O(Youtport[25]));
  OBUF \Youtport_OBUF[26]_inst 
       (.I(Youtport_OBUF[26]),
        .O(Youtport[26]));
  OBUF \Youtport_OBUF[27]_inst 
       (.I(Youtport_OBUF[27]),
        .O(Youtport[27]));
  OBUF \Youtport_OBUF[28]_inst 
       (.I(Youtport_OBUF[28]),
        .O(Youtport[28]));
  OBUF \Youtport_OBUF[29]_inst 
       (.I(Youtport_OBUF[29]),
        .O(Youtport[29]));
  OBUF \Youtport_OBUF[2]_inst 
       (.I(Youtport_OBUF[2]),
        .O(Youtport[2]));
  OBUF \Youtport_OBUF[30]_inst 
       (.I(Youtport_OBUF[30]),
        .O(Youtport[30]));
  OBUF \Youtport_OBUF[31]_inst 
       (.I(Youtport_OBUF[31]),
        .O(Youtport[31]));
  OBUF \Youtport_OBUF[3]_inst 
       (.I(Youtport_OBUF[3]),
        .O(Youtport[3]));
  OBUF \Youtport_OBUF[4]_inst 
       (.I(Youtport_OBUF[4]),
        .O(Youtport[4]));
  OBUF \Youtport_OBUF[5]_inst 
       (.I(Youtport_OBUF[5]),
        .O(Youtport[5]));
  OBUF \Youtport_OBUF[6]_inst 
       (.I(Youtport_OBUF[6]),
        .O(Youtport[6]));
  OBUF \Youtport_OBUF[7]_inst 
       (.I(Youtport_OBUF[7]),
        .O(Youtport[7]));
  OBUF \Youtport_OBUF[8]_inst 
       (.I(Youtport_OBUF[8]),
        .O(Youtport[8]));
  OBUF \Youtport_OBUF[9]_inst 
       (.I(Youtport_OBUF[9]),
        .O(Youtport[9]));
  FDRE \Youtport_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[0]),
        .Q(Youtport_OBUF[0]),
        .R(\<const0> ));
  FDRE \Youtport_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[10]),
        .Q(Youtport_OBUF[10]),
        .R(\<const0> ));
  FDRE \Youtport_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[11]),
        .Q(Youtport_OBUF[11]),
        .R(\<const0> ));
  FDRE \Youtport_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[12]),
        .Q(Youtport_OBUF[12]),
        .R(\<const0> ));
  FDRE \Youtport_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[13]),
        .Q(Youtport_OBUF[13]),
        .R(\<const0> ));
  FDRE \Youtport_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[14]),
        .Q(Youtport_OBUF[14]),
        .R(\<const0> ));
  FDRE \Youtport_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[15]),
        .Q(Youtport_OBUF[15]),
        .R(\<const0> ));
  FDRE \Youtport_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[16]),
        .Q(Youtport_OBUF[16]),
        .R(\<const0> ));
  FDRE \Youtport_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[17]),
        .Q(Youtport_OBUF[17]),
        .R(\<const0> ));
  FDRE \Youtport_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[18]),
        .Q(Youtport_OBUF[18]),
        .R(\<const0> ));
  FDRE \Youtport_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[19]),
        .Q(Youtport_OBUF[19]),
        .R(\<const0> ));
  FDRE \Youtport_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[1]),
        .Q(Youtport_OBUF[1]),
        .R(\<const0> ));
  FDRE \Youtport_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[20]),
        .Q(Youtport_OBUF[20]),
        .R(\<const0> ));
  FDRE \Youtport_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[21]),
        .Q(Youtport_OBUF[21]),
        .R(\<const0> ));
  FDRE \Youtport_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[22]),
        .Q(Youtport_OBUF[22]),
        .R(\<const0> ));
  FDRE \Youtport_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[23]),
        .Q(Youtport_OBUF[23]),
        .R(\<const0> ));
  FDRE \Youtport_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[24]),
        .Q(Youtport_OBUF[24]),
        .R(\<const0> ));
  FDRE \Youtport_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[25]),
        .Q(Youtport_OBUF[25]),
        .R(\<const0> ));
  FDRE \Youtport_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[26]),
        .Q(Youtport_OBUF[26]),
        .R(\<const0> ));
  FDRE \Youtport_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[27]),
        .Q(Youtport_OBUF[27]),
        .R(\<const0> ));
  FDRE \Youtport_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[28]),
        .Q(Youtport_OBUF[28]),
        .R(\<const0> ));
  FDRE \Youtport_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[29]),
        .Q(Youtport_OBUF[29]),
        .R(\<const0> ));
  FDRE \Youtport_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[2]),
        .Q(Youtport_OBUF[2]),
        .R(\<const0> ));
  FDRE \Youtport_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[30]),
        .Q(Youtport_OBUF[30]),
        .R(\<const0> ));
  FDRE \Youtport_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[31]),
        .Q(Youtport_OBUF[31]),
        .R(\<const0> ));
  FDRE \Youtport_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[3]),
        .Q(Youtport_OBUF[3]),
        .R(\<const0> ));
  FDRE \Youtport_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[4]),
        .Q(Youtport_OBUF[4]),
        .R(\<const0> ));
  FDRE \Youtport_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[5]),
        .Q(Youtport_OBUF[5]),
        .R(\<const0> ));
  FDRE \Youtport_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[6]),
        .Q(Youtport_OBUF[6]),
        .R(\<const0> ));
  FDRE \Youtport_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[7]),
        .Q(Youtport_OBUF[7]),
        .R(\<const0> ));
  FDRE \Youtport_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[8]),
        .Q(Youtport_OBUF[8]),
        .R(\<const0> ));
  FDRE \Youtport_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\Xoutport[31]_i_1_n_0 ),
        .D(y_var_reg[9]),
        .Q(Youtport_OBUF[9]),
        .R(\<const0> ));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h0D)) 
    looping_i_1
       (.I0(looping),
        .I1(\Xoutport_reg[31]_i_2_n_0 ),
        .I2(reset_IBUF),
        .O(looping_i_1_n_0));
  (* ORIG_CELL_NAME = "looping_reg" *) 
  FDRE looping_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(looping_i_1_n_0),
        .Q(looping),
        .R(\<const0> ));
  (* ORIG_CELL_NAME = "looping_reg" *) 
  FDRE looping_reg_rep
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(looping_rep_i_1_n_0),
        .Q(looping_reg_rep_n_0),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h0D)) 
    looping_rep_i_1
       (.I0(looping),
        .I1(\Xoutport_reg[31]_i_2_n_0 ),
        .I2(reset_IBUF),
        .O(looping_rep_i_1_n_0));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 16x18 4}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    temp
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,DXport_IBUF[16:0]}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,\u_var[31]_i_1_n_0 ,\u_var[30]_i_1_n_0 ,\u_var[29]_i_1_n_0 ,\u_var[28]_i_1_n_0 ,\u_var[27]_i_1_n_0 ,\u_var[26]_i_1_n_0 ,\u_var[25]_i_1_n_0 ,\u_var[24]_i_1_n_0 ,\u_var[23]_i_1_n_0 ,\u_var[22]_i_1_n_0 ,\u_var[21]_i_1_n_0 ,\u_var[20]_i_1_n_0 ,\u_var[19]_i_1_n_0 ,\u_var[18]_i_1_n_0 ,\u_var[17]_i_1_n_0 }),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(\<const0> ),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(u_var2_i_1_n_0),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(\<const0> ),
        .CLK(clk_IBUF_BUFG),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P(p_0_in),
        .PCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .RSTA(\<const0> ),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(reset_IBUF),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(\<const0> ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x18 4}}" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    temp__0
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\u_var[16]_i_1_n_0 ,\u_var[15]_i_1_n_0 ,\u_var[14]_i_1_n_0 ,\u_var[13]_i_1_n_0 ,\u_var[12]_i_1_n_0 ,\u_var[11]_i_1_n_0 ,\u_var[10]_i_1_n_0 ,\u_var[9]_i_1_n_0 ,\u_var[8]_i_1_n_0 ,\u_var[7]_i_1_n_0 ,\u_var[6]_i_1_n_0 ,\u_var[5]_i_1_n_0 ,\u_var[4]_i_1_n_0 ,\u_var[3]_i_1_n_0 ,\u_var[2]_i_1_n_0 ,\u_var[1]_i_1_n_0 ,\u_var[0]_i_1_n_0 }),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,DXport_IBUF[16:0]}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(u_var2_i_1_n_0),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(\<const0> ),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(\<const0> ),
        .CLK(clk_IBUF_BUFG),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({temp__0_n_89,temp__0_n_90,temp__0_n_91,temp__0_n_92,temp__0_n_93,temp__0_n_94,temp__0_n_95,temp__0_n_96,temp__0_n_97,temp__0_n_98,temp__0_n_99,temp__0_n_100,temp__0_n_101,temp__0_n_102,temp__0_n_103,temp__0_n_104,temp__0_n_105}),
        .PCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .PCOUT({temp__0_n_106,temp__0_n_107,temp__0_n_108,temp__0_n_109,temp__0_n_110,temp__0_n_111,temp__0_n_112,temp__0_n_113,temp__0_n_114,temp__0_n_115,temp__0_n_116,temp__0_n_117,temp__0_n_118,temp__0_n_119,temp__0_n_120,temp__0_n_121,temp__0_n_122,temp__0_n_123,temp__0_n_124,temp__0_n_125,temp__0_n_126,temp__0_n_127,temp__0_n_128,temp__0_n_129,temp__0_n_130,temp__0_n_131,temp__0_n_132,temp__0_n_133,temp__0_n_134,temp__0_n_135,temp__0_n_136,temp__0_n_137,temp__0_n_138,temp__0_n_139,temp__0_n_140,temp__0_n_141,temp__0_n_142,temp__0_n_143,temp__0_n_144,temp__0_n_145,temp__0_n_146,temp__0_n_147,temp__0_n_148,temp__0_n_149,temp__0_n_150,temp__0_n_151,temp__0_n_152,temp__0_n_153}),
        .RSTA(reset_IBUF),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(\<const0> ),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(\<const0> ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x16 4}}" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    temp__1
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\u_var[14]_i_1_n_0 ,\u_var[13]_i_1_n_0 ,\u_var[12]_i_1_n_0 ,\u_var[11]_i_1_n_0 ,\u_var[10]_i_1_n_0 ,\u_var[9]_i_1_n_0 ,\u_var[8]_i_1_n_0 ,\u_var[7]_i_1_n_0 ,\u_var[6]_i_1_n_0 ,\u_var[5]_i_1_n_0 ,\u_var[4]_i_1_n_0 ,\u_var[3]_i_1_n_0 ,\u_var[2]_i_1_n_0 ,\u_var[1]_i_1_n_0 ,\u_var[0]_i_1_n_0 }),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,DXport_IBUF[31:17]}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(u_var2_i_1_n_0),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(\<const0> ),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(\<const0> ),
        .CLK(clk_IBUF_BUFG),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({temp__1_n_91,temp__1_n_92,temp__1_n_93,temp__1_n_94,temp__1_n_95,temp__1_n_96,temp__1_n_97,temp__1_n_98,temp__1_n_99,temp__1_n_100,temp__1_n_101,temp__1_n_102,temp__1_n_103,temp__1_n_104,temp__1_n_105}),
        .PCIN({temp__0_n_106,temp__0_n_107,temp__0_n_108,temp__0_n_109,temp__0_n_110,temp__0_n_111,temp__0_n_112,temp__0_n_113,temp__0_n_114,temp__0_n_115,temp__0_n_116,temp__0_n_117,temp__0_n_118,temp__0_n_119,temp__0_n_120,temp__0_n_121,temp__0_n_122,temp__0_n_123,temp__0_n_124,temp__0_n_125,temp__0_n_126,temp__0_n_127,temp__0_n_128,temp__0_n_129,temp__0_n_130,temp__0_n_131,temp__0_n_132,temp__0_n_133,temp__0_n_134,temp__0_n_135,temp__0_n_136,temp__0_n_137,temp__0_n_138,temp__0_n_139,temp__0_n_140,temp__0_n_141,temp__0_n_142,temp__0_n_143,temp__0_n_144,temp__0_n_145,temp__0_n_146,temp__0_n_147,temp__0_n_148,temp__0_n_149,temp__0_n_150,temp__0_n_151,temp__0_n_152,temp__0_n_153}),
        .RSTA(reset_IBUF),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(\<const0> ),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(\<const0> ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 16x18 4}}" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    u_var1
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,y_var[16:0]}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,u_var2__2[31:17]}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(u_var2_i_1_n_0),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(\<const0> ),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(\<const0> ),
        .CLK(clk_IBUF_BUFG),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({u_var1_n_91,u_var1_n_92,u_var1_n_93,u_var1_n_94,u_var1_n_95,u_var1_n_96,u_var1_n_97,u_var1_n_98,u_var1_n_99,u_var1_n_100,u_var1_n_101,u_var1_n_102,u_var1_n_103,u_var1_n_104,u_var1_n_105}),
        .PCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .RSTA(reset_IBUF),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(\<const0> ),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(\<const0> ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x18 4}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    u_var1__0
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,u_var2__2[16:0]}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ACOUT({u_var1__0_n_24,u_var1__0_n_25,u_var1__0_n_26,u_var1__0_n_27,u_var1__0_n_28,u_var1__0_n_29,u_var1__0_n_30,u_var1__0_n_31,u_var1__0_n_32,u_var1__0_n_33,u_var1__0_n_34,u_var1__0_n_35,u_var1__0_n_36,u_var1__0_n_37,u_var1__0_n_38,u_var1__0_n_39,u_var1__0_n_40,u_var1__0_n_41,u_var1__0_n_42,u_var1__0_n_43,u_var1__0_n_44,u_var1__0_n_45,u_var1__0_n_46,u_var1__0_n_47,u_var1__0_n_48,u_var1__0_n_49,u_var1__0_n_50,u_var1__0_n_51,u_var1__0_n_52,u_var1__0_n_53}),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,y_var[16:0]}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(\<const0> ),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(u_var2_i_1_n_0),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(\<const0> ),
        .CLK(clk_IBUF_BUFG),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({u_var1__0_n_89,u_var1__0_n_90,u_var1__0_n_91,u_var1__0_n_92,u_var1__0_n_93,u_var1__0_n_94,u_var1__0_n_95,u_var1__0_n_96,u_var1__0_n_97,u_var1__0_n_98,u_var1__0_n_99,u_var1__0_n_100,u_var1__0_n_101,u_var1__0_n_102,u_var1__0_n_103,u_var1__0_n_104,u_var1__0_n_105}),
        .PCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .PCOUT({u_var1__0_n_106,u_var1__0_n_107,u_var1__0_n_108,u_var1__0_n_109,u_var1__0_n_110,u_var1__0_n_111,u_var1__0_n_112,u_var1__0_n_113,u_var1__0_n_114,u_var1__0_n_115,u_var1__0_n_116,u_var1__0_n_117,u_var1__0_n_118,u_var1__0_n_119,u_var1__0_n_120,u_var1__0_n_121,u_var1__0_n_122,u_var1__0_n_123,u_var1__0_n_124,u_var1__0_n_125,u_var1__0_n_126,u_var1__0_n_127,u_var1__0_n_128,u_var1__0_n_129,u_var1__0_n_130,u_var1__0_n_131,u_var1__0_n_132,u_var1__0_n_133,u_var1__0_n_134,u_var1__0_n_135,u_var1__0_n_136,u_var1__0_n_137,u_var1__0_n_138,u_var1__0_n_139,u_var1__0_n_140,u_var1__0_n_141,u_var1__0_n_142,u_var1__0_n_143,u_var1__0_n_144,u_var1__0_n_145,u_var1__0_n_146,u_var1__0_n_147,u_var1__0_n_148,u_var1__0_n_149,u_var1__0_n_150,u_var1__0_n_151,u_var1__0_n_152,u_var1__0_n_153}),
        .RSTA(\<const0> ),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(reset_IBUF),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(\<const0> ));
  CARRY4 u_var1__0_i_1
       (.CI(u_var1__0_i_2_n_0),
        .CO({u_var1__0_i_1_n_0,NLW_u_var1__0_i_1_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(DXport_IBUF[13:10]),
        .O(u_var2__2[15:12]),
        .S({u_var1__0_i_5_n_0,u_var1__0_i_6_n_0,u_var1__0_i_7_n_0,u_var1__0_i_8_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1__0_i_10
       (.I0(DXport_IBUF[8]),
        .I1(DXport_IBUF[10]),
        .O(u_var1__0_i_10_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1__0_i_11
       (.I0(DXport_IBUF[7]),
        .I1(DXport_IBUF[9]),
        .O(u_var1__0_i_11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1__0_i_12
       (.I0(DXport_IBUF[6]),
        .I1(DXport_IBUF[8]),
        .O(u_var1__0_i_12_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1__0_i_13
       (.I0(DXport_IBUF[5]),
        .I1(DXport_IBUF[7]),
        .O(u_var1__0_i_13_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1__0_i_14
       (.I0(DXport_IBUF[4]),
        .I1(DXport_IBUF[6]),
        .O(u_var1__0_i_14_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1__0_i_15
       (.I0(DXport_IBUF[3]),
        .I1(DXport_IBUF[5]),
        .O(u_var1__0_i_15_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1__0_i_16
       (.I0(DXport_IBUF[2]),
        .I1(DXport_IBUF[4]),
        .O(u_var1__0_i_16_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1__0_i_17
       (.I0(DXport_IBUF[1]),
        .I1(DXport_IBUF[3]),
        .O(u_var1__0_i_17_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1__0_i_18
       (.I0(DXport_IBUF[0]),
        .I1(DXport_IBUF[2]),
        .O(u_var1__0_i_18_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    u_var1__0_i_19
       (.I0(DXport_IBUF[1]),
        .O(u_var1__0_i_19_n_0));
  CARRY4 u_var1__0_i_2
       (.CI(u_var1__0_i_3_n_0),
        .CO({u_var1__0_i_2_n_0,NLW_u_var1__0_i_2_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(DXport_IBUF[9:6]),
        .O(u_var2__2[11:8]),
        .S({u_var1__0_i_9_n_0,u_var1__0_i_10_n_0,u_var1__0_i_11_n_0,u_var1__0_i_12_n_0}));
  CARRY4 u_var1__0_i_3
       (.CI(u_var1__0_i_4_n_0),
        .CO({u_var1__0_i_3_n_0,NLW_u_var1__0_i_3_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(DXport_IBUF[5:2]),
        .O(u_var2__2[7:4]),
        .S({u_var1__0_i_13_n_0,u_var1__0_i_14_n_0,u_var1__0_i_15_n_0,u_var1__0_i_16_n_0}));
  CARRY4 u_var1__0_i_4
       (.CI(\<const0> ),
        .CO({u_var1__0_i_4_n_0,NLW_u_var1__0_i_4_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({DXport_IBUF[1:0],\<const0> ,\<const1> }),
        .O(u_var2__2[3:0]),
        .S({u_var1__0_i_17_n_0,u_var1__0_i_18_n_0,u_var1__0_i_19_n_0,DXport_IBUF[0]}));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1__0_i_5
       (.I0(DXport_IBUF[13]),
        .I1(DXport_IBUF[15]),
        .O(u_var1__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1__0_i_6
       (.I0(DXport_IBUF[12]),
        .I1(DXport_IBUF[14]),
        .O(u_var1__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1__0_i_7
       (.I0(DXport_IBUF[11]),
        .I1(DXport_IBUF[13]),
        .O(u_var1__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1__0_i_8
       (.I0(DXport_IBUF[10]),
        .I1(DXport_IBUF[12]),
        .O(u_var1__0_i_8_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1__0_i_9
       (.I0(DXport_IBUF[9]),
        .I1(DXport_IBUF[11]),
        .O(u_var1__0_i_9_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x16 4}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("CASCADE"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    u_var1__1
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ACIN({u_var1__0_n_24,u_var1__0_n_25,u_var1__0_n_26,u_var1__0_n_27,u_var1__0_n_28,u_var1__0_n_29,u_var1__0_n_30,u_var1__0_n_31,u_var1__0_n_32,u_var1__0_n_33,u_var1__0_n_34,u_var1__0_n_35,u_var1__0_n_36,u_var1__0_n_37,u_var1__0_n_38,u_var1__0_n_39,u_var1__0_n_40,u_var1__0_n_41,u_var1__0_n_42,u_var1__0_n_43,u_var1__0_n_44,u_var1__0_n_45,u_var1__0_n_46,u_var1__0_n_47,u_var1__0_n_48,u_var1__0_n_49,u_var1__0_n_50,u_var1__0_n_51,u_var1__0_n_52,u_var1__0_n_53}),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,y_var[31:17]}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(\<const0> ),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(u_var2_i_1_n_0),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(\<const0> ),
        .CLK(clk_IBUF_BUFG),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({u_var1__1_n_91,u_var1__1_n_92,u_var1__1_n_93,u_var1__1_n_94,u_var1__1_n_95,u_var1__1_n_96,u_var1__1_n_97,u_var1__1_n_98,u_var1__1_n_99,u_var1__1_n_100,u_var1__1_n_101,u_var1__1_n_102,u_var1__1_n_103,u_var1__1_n_104,u_var1__1_n_105}),
        .PCIN({u_var1__0_n_106,u_var1__0_n_107,u_var1__0_n_108,u_var1__0_n_109,u_var1__0_n_110,u_var1__0_n_111,u_var1__0_n_112,u_var1__0_n_113,u_var1__0_n_114,u_var1__0_n_115,u_var1__0_n_116,u_var1__0_n_117,u_var1__0_n_118,u_var1__0_n_119,u_var1__0_n_120,u_var1__0_n_121,u_var1__0_n_122,u_var1__0_n_123,u_var1__0_n_124,u_var1__0_n_125,u_var1__0_n_126,u_var1__0_n_127,u_var1__0_n_128,u_var1__0_n_129,u_var1__0_n_130,u_var1__0_n_131,u_var1__0_n_132,u_var1__0_n_133,u_var1__0_n_134,u_var1__0_n_135,u_var1__0_n_136,u_var1__0_n_137,u_var1__0_n_138,u_var1__0_n_139,u_var1__0_n_140,u_var1__0_n_141,u_var1__0_n_142,u_var1__0_n_143,u_var1__0_n_144,u_var1__0_n_145,u_var1__0_n_146,u_var1__0_n_147,u_var1__0_n_148,u_var1__0_n_149,u_var1__0_n_150,u_var1__0_n_151,u_var1__0_n_152,u_var1__0_n_153}),
        .RSTA(\<const0> ),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(reset_IBUF),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(\<const0> ));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1__1_i_1
       (.I0(Yinport_IBUF[31]),
        .I1(y_var0[31]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[31]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1__1_i_10
       (.I0(Yinport_IBUF[22]),
        .I1(y_var0[22]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[22]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1__1_i_11
       (.I0(Yinport_IBUF[21]),
        .I1(y_var0[21]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[21]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1__1_i_12
       (.I0(Yinport_IBUF[20]),
        .I1(y_var0[20]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[20]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1__1_i_13
       (.I0(Yinport_IBUF[19]),
        .I1(y_var0[19]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[19]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1__1_i_14
       (.I0(Yinport_IBUF[18]),
        .I1(y_var0[18]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[18]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1__1_i_15
       (.I0(Yinport_IBUF[17]),
        .I1(y_var0[17]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[17]));
  CARRY4 u_var1__1_i_16
       (.CI(u_var1__1_i_17_n_0),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,y_var_reg[30:28]}),
        .O(y_var0[31:28]),
        .S({u_var1__1_i_19_n_0,u_var1__1_i_20_n_0,u_var1__1_i_21_n_0,u_var1__1_i_22_n_0}));
  CARRY4 u_var1__1_i_17
       (.CI(u_var1__1_i_18_n_0),
        .CO({u_var1__1_i_17_n_0,NLW_u_var1__1_i_17_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(y_var_reg[27:24]),
        .O(y_var0[27:24]),
        .S({u_var1__1_i_23_n_0,u_var1__1_i_24_n_0,u_var1__1_i_25_n_0,u_var1__1_i_26_n_0}));
  CARRY4 u_var1__1_i_18
       (.CI(u_var1_i_38_n_0),
        .CO({u_var1__1_i_18_n_0,NLW_u_var1__1_i_18_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(y_var_reg[23:20]),
        .O(y_var0[23:20]),
        .S({u_var1__1_i_27_n_0,u_var1__1_i_28_n_0,u_var1__1_i_29_n_0,u_var1__1_i_30_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1__1_i_19
       (.I0(y_var_reg[31]),
        .I1(B[31]),
        .O(u_var1__1_i_19_n_0));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1__1_i_2
       (.I0(Yinport_IBUF[30]),
        .I1(y_var0[30]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[30]));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1__1_i_20
       (.I0(y_var_reg[30]),
        .I1(B[30]),
        .O(u_var1__1_i_20_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1__1_i_21
       (.I0(y_var_reg[29]),
        .I1(B[29]),
        .O(u_var1__1_i_21_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1__1_i_22
       (.I0(y_var_reg[28]),
        .I1(B[28]),
        .O(u_var1__1_i_22_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1__1_i_23
       (.I0(y_var_reg[27]),
        .I1(B[27]),
        .O(u_var1__1_i_23_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1__1_i_24
       (.I0(y_var_reg[26]),
        .I1(B[26]),
        .O(u_var1__1_i_24_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1__1_i_25
       (.I0(y_var_reg[25]),
        .I1(B[25]),
        .O(u_var1__1_i_25_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1__1_i_26
       (.I0(y_var_reg[24]),
        .I1(B[24]),
        .O(u_var1__1_i_26_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1__1_i_27
       (.I0(y_var_reg[23]),
        .I1(B[23]),
        .O(u_var1__1_i_27_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1__1_i_28
       (.I0(y_var_reg[22]),
        .I1(B[22]),
        .O(u_var1__1_i_28_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1__1_i_29
       (.I0(y_var_reg[21]),
        .I1(B[21]),
        .O(u_var1__1_i_29_n_0));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1__1_i_3
       (.I0(Yinport_IBUF[29]),
        .I1(y_var0[29]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[29]));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1__1_i_30
       (.I0(y_var_reg[20]),
        .I1(B[20]),
        .O(u_var1__1_i_30_n_0));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1__1_i_4
       (.I0(Yinport_IBUF[28]),
        .I1(y_var0[28]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[28]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1__1_i_5
       (.I0(Yinport_IBUF[27]),
        .I1(y_var0[27]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[27]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1__1_i_6
       (.I0(Yinport_IBUF[26]),
        .I1(y_var0[26]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[26]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1__1_i_7
       (.I0(Yinport_IBUF[25]),
        .I1(y_var0[25]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[25]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1__1_i_8
       (.I0(Yinport_IBUF[24]),
        .I1(y_var0[24]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[24]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1__1_i_9
       (.I0(Yinport_IBUF[23]),
        .I1(y_var0[23]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[23]));
  CARRY4 u_var1_i_1
       (.CI(u_var1_i_2_n_0),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,DXport_IBUF[28:26]}),
        .O(u_var2__2[31:28]),
        .S({u_var1_i_22_n_0,u_var1_i_23_n_0,u_var1_i_24_n_0,u_var1_i_25_n_0}));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_10
       (.I0(Yinport_IBUF[11]),
        .I1(y_var0[11]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[11]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_11
       (.I0(Yinport_IBUF[10]),
        .I1(y_var0[10]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[10]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_12
       (.I0(Yinport_IBUF[9]),
        .I1(y_var0[9]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[9]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_13
       (.I0(Yinport_IBUF[8]),
        .I1(y_var0[8]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[8]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_14
       (.I0(Yinport_IBUF[7]),
        .I1(y_var0[7]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[7]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_15
       (.I0(Yinport_IBUF[6]),
        .I1(y_var0[6]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[6]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_16
       (.I0(Yinport_IBUF[5]),
        .I1(y_var0[5]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[5]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_17
       (.I0(Yinport_IBUF[4]),
        .I1(y_var0[4]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[4]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_18
       (.I0(Yinport_IBUF[3]),
        .I1(y_var0[3]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[3]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_19
       (.I0(Yinport_IBUF[2]),
        .I1(y_var0[2]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[2]));
  CARRY4 u_var1_i_2
       (.CI(u_var1_i_3_n_0),
        .CO({u_var1_i_2_n_0,NLW_u_var1_i_2_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(DXport_IBUF[25:22]),
        .O(u_var2__2[27:24]),
        .S({u_var1_i_26_n_0,u_var1_i_27_n_0,u_var1_i_28_n_0,u_var1_i_29_n_0}));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_20
       (.I0(Yinport_IBUF[1]),
        .I1(y_var0[1]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[1]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_21
       (.I0(Yinport_IBUF[0]),
        .I1(y_var0[0]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[0]));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1_i_22
       (.I0(DXport_IBUF[29]),
        .I1(DXport_IBUF[31]),
        .O(u_var1_i_22_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1_i_23
       (.I0(DXport_IBUF[28]),
        .I1(DXport_IBUF[30]),
        .O(u_var1_i_23_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1_i_24
       (.I0(DXport_IBUF[27]),
        .I1(DXport_IBUF[29]),
        .O(u_var1_i_24_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1_i_25
       (.I0(DXport_IBUF[26]),
        .I1(DXport_IBUF[28]),
        .O(u_var1_i_25_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1_i_26
       (.I0(DXport_IBUF[25]),
        .I1(DXport_IBUF[27]),
        .O(u_var1_i_26_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1_i_27
       (.I0(DXport_IBUF[24]),
        .I1(DXport_IBUF[26]),
        .O(u_var1_i_27_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1_i_28
       (.I0(DXport_IBUF[23]),
        .I1(DXport_IBUF[25]),
        .O(u_var1_i_28_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1_i_29
       (.I0(DXport_IBUF[22]),
        .I1(DXport_IBUF[24]),
        .O(u_var1_i_29_n_0));
  CARRY4 u_var1_i_3
       (.CI(u_var1_i_4_n_0),
        .CO({u_var1_i_3_n_0,NLW_u_var1_i_3_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(DXport_IBUF[21:18]),
        .O(u_var2__2[23:20]),
        .S({u_var1_i_30_n_0,u_var1_i_31_n_0,u_var1_i_32_n_0,u_var1_i_33_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1_i_30
       (.I0(DXport_IBUF[21]),
        .I1(DXport_IBUF[23]),
        .O(u_var1_i_30_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1_i_31
       (.I0(DXport_IBUF[20]),
        .I1(DXport_IBUF[22]),
        .O(u_var1_i_31_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1_i_32
       (.I0(DXport_IBUF[19]),
        .I1(DXport_IBUF[21]),
        .O(u_var1_i_32_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1_i_33
       (.I0(DXport_IBUF[18]),
        .I1(DXport_IBUF[20]),
        .O(u_var1_i_33_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1_i_34
       (.I0(DXport_IBUF[17]),
        .I1(DXport_IBUF[19]),
        .O(u_var1_i_34_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1_i_35
       (.I0(DXport_IBUF[16]),
        .I1(DXport_IBUF[18]),
        .O(u_var1_i_35_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1_i_36
       (.I0(DXport_IBUF[15]),
        .I1(DXport_IBUF[17]),
        .O(u_var1_i_36_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var1_i_37
       (.I0(DXport_IBUF[14]),
        .I1(DXport_IBUF[16]),
        .O(u_var1_i_37_n_0));
  CARRY4 u_var1_i_38
       (.CI(u_var1_i_39_n_0),
        .CO({u_var1_i_38_n_0,NLW_u_var1_i_38_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(y_var_reg[19:16]),
        .O(y_var0[19:16]),
        .S({u_var1_i_43_n_0,u_var1_i_44_n_0,u_var1_i_45_n_0,u_var1_i_46_n_0}));
  CARRY4 u_var1_i_39
       (.CI(u_var1_i_40_n_0),
        .CO({u_var1_i_39_n_0,NLW_u_var1_i_39_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(y_var_reg[15:12]),
        .O(y_var0[15:12]),
        .S({u_var1_i_47_n_0,u_var1_i_48_n_0,u_var1_i_49_n_0,u_var1_i_50_n_0}));
  CARRY4 u_var1_i_4
       (.CI(u_var1__0_i_1_n_0),
        .CO({u_var1_i_4_n_0,NLW_u_var1_i_4_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(DXport_IBUF[17:14]),
        .O(u_var2__2[19:16]),
        .S({u_var1_i_34_n_0,u_var1_i_35_n_0,u_var1_i_36_n_0,u_var1_i_37_n_0}));
  CARRY4 u_var1_i_40
       (.CI(u_var1_i_41_n_0),
        .CO({u_var1_i_40_n_0,NLW_u_var1_i_40_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(y_var_reg[11:8]),
        .O(y_var0[11:8]),
        .S({u_var1_i_51_n_0,u_var1_i_52_n_0,u_var1_i_53_n_0,u_var1_i_54_n_0}));
  CARRY4 u_var1_i_41
       (.CI(u_var1_i_42_n_0),
        .CO({u_var1_i_41_n_0,NLW_u_var1_i_41_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(y_var_reg[7:4]),
        .O(y_var0[7:4]),
        .S({u_var1_i_55_n_0,u_var1_i_56_n_0,u_var1_i_57_n_0,u_var1_i_58_n_0}));
  CARRY4 u_var1_i_42
       (.CI(\<const0> ),
        .CO({u_var1_i_42_n_0,NLW_u_var1_i_42_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(y_var_reg[3:0]),
        .O(y_var0[3:0]),
        .S({u_var1_i_59_n_0,u_var1_i_60_n_0,u_var1_i_61_n_0,u_var1_i_62_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_43
       (.I0(y_var_reg[19]),
        .I1(B[19]),
        .O(u_var1_i_43_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_44
       (.I0(y_var_reg[18]),
        .I1(B[18]),
        .O(u_var1_i_44_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_45
       (.I0(y_var_reg[17]),
        .I1(B[17]),
        .O(u_var1_i_45_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_46
       (.I0(y_var_reg[16]),
        .I1(B[16]),
        .O(u_var1_i_46_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_47
       (.I0(y_var_reg[15]),
        .I1(temp__0_n_90),
        .O(u_var1_i_47_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_48
       (.I0(y_var_reg[14]),
        .I1(temp__0_n_91),
        .O(u_var1_i_48_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_49
       (.I0(y_var_reg[13]),
        .I1(temp__0_n_92),
        .O(u_var1_i_49_n_0));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_5
       (.I0(Yinport_IBUF[16]),
        .I1(y_var0[16]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[16]));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_50
       (.I0(y_var_reg[12]),
        .I1(temp__0_n_93),
        .O(u_var1_i_50_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_51
       (.I0(y_var_reg[11]),
        .I1(temp__0_n_94),
        .O(u_var1_i_51_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_52
       (.I0(y_var_reg[10]),
        .I1(temp__0_n_95),
        .O(u_var1_i_52_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_53
       (.I0(y_var_reg[9]),
        .I1(temp__0_n_96),
        .O(u_var1_i_53_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_54
       (.I0(y_var_reg[8]),
        .I1(temp__0_n_97),
        .O(u_var1_i_54_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_55
       (.I0(y_var_reg[7]),
        .I1(temp__0_n_98),
        .O(u_var1_i_55_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_56
       (.I0(y_var_reg[6]),
        .I1(temp__0_n_99),
        .O(u_var1_i_56_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_57
       (.I0(y_var_reg[5]),
        .I1(temp__0_n_100),
        .O(u_var1_i_57_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_58
       (.I0(y_var_reg[4]),
        .I1(temp__0_n_101),
        .O(u_var1_i_58_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_59
       (.I0(y_var_reg[3]),
        .I1(temp__0_n_102),
        .O(u_var1_i_59_n_0));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_6
       (.I0(Yinport_IBUF[15]),
        .I1(y_var0[15]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[15]));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_60
       (.I0(y_var_reg[2]),
        .I1(temp__0_n_103),
        .O(u_var1_i_60_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_61
       (.I0(y_var_reg[1]),
        .I1(temp__0_n_104),
        .O(u_var1_i_61_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var1_i_62
       (.I0(y_var_reg[0]),
        .I1(temp__0_n_105),
        .O(u_var1_i_62_n_0));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_7
       (.I0(Yinport_IBUF[14]),
        .I1(y_var0[14]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[14]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_8
       (.I0(Yinport_IBUF[13]),
        .I1(y_var0[13]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[13]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var1_i_9
       (.I0(Yinport_IBUF[12]),
        .I1(y_var0[12]),
        .I2(looping_reg_rep_n_0),
        .O(y_var[12]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 16x18 4}}" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    u_var2
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,x_var[16:0]}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,u_var3[31:17]}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(u_var2_i_1_n_0),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(\<const0> ),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(\<const0> ),
        .CLK(clk_IBUF_BUFG),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({u_var2_n_91,u_var2_n_92,u_var2_n_93,u_var2_n_94,u_var2_n_95,u_var2_n_96,u_var2_n_97,u_var2_n_98,u_var2_n_99,u_var2_n_100,u_var2_n_101,u_var2_n_102,u_var2_n_103,u_var2_n_104,u_var2_n_105}),
        .PCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .RSTA(reset_IBUF),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(\<const0> ),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(\<const0> ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x18 4}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    u_var2__0
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,u_var3[16:0]}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ACOUT({u_var2__0_n_24,u_var2__0_n_25,u_var2__0_n_26,u_var2__0_n_27,u_var2__0_n_28,u_var2__0_n_29,u_var2__0_n_30,u_var2__0_n_31,u_var2__0_n_32,u_var2__0_n_33,u_var2__0_n_34,u_var2__0_n_35,u_var2__0_n_36,u_var2__0_n_37,u_var2__0_n_38,u_var2__0_n_39,u_var2__0_n_40,u_var2__0_n_41,u_var2__0_n_42,u_var2__0_n_43,u_var2__0_n_44,u_var2__0_n_45,u_var2__0_n_46,u_var2__0_n_47,u_var2__0_n_48,u_var2__0_n_49,u_var2__0_n_50,u_var2__0_n_51,u_var2__0_n_52,u_var2__0_n_53}),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,x_var[16:0]}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(\<const0> ),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(u_var2_i_1_n_0),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(\<const0> ),
        .CLK(clk_IBUF_BUFG),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({u_var2__0_n_89,u_var2__0_n_90,u_var2__0_n_91,u_var2__0_n_92,u_var2__0_n_93,u_var2__0_n_94,u_var2__0_n_95,u_var2__0_n_96,u_var2__0_n_97,u_var2__0_n_98,u_var2__0_n_99,u_var2__0_n_100,u_var2__0_n_101,u_var2__0_n_102,u_var2__0_n_103,u_var2__0_n_104,u_var2__0_n_105}),
        .PCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .PCOUT({u_var2__0_n_106,u_var2__0_n_107,u_var2__0_n_108,u_var2__0_n_109,u_var2__0_n_110,u_var2__0_n_111,u_var2__0_n_112,u_var2__0_n_113,u_var2__0_n_114,u_var2__0_n_115,u_var2__0_n_116,u_var2__0_n_117,u_var2__0_n_118,u_var2__0_n_119,u_var2__0_n_120,u_var2__0_n_121,u_var2__0_n_122,u_var2__0_n_123,u_var2__0_n_124,u_var2__0_n_125,u_var2__0_n_126,u_var2__0_n_127,u_var2__0_n_128,u_var2__0_n_129,u_var2__0_n_130,u_var2__0_n_131,u_var2__0_n_132,u_var2__0_n_133,u_var2__0_n_134,u_var2__0_n_135,u_var2__0_n_136,u_var2__0_n_137,u_var2__0_n_138,u_var2__0_n_139,u_var2__0_n_140,u_var2__0_n_141,u_var2__0_n_142,u_var2__0_n_143,u_var2__0_n_144,u_var2__0_n_145,u_var2__0_n_146,u_var2__0_n_147,u_var2__0_n_148,u_var2__0_n_149,u_var2__0_n_150,u_var2__0_n_151,u_var2__0_n_152,u_var2__0_n_153}),
        .RSTA(\<const0> ),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(reset_IBUF),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(\<const0> ));
  CARRY4 u_var2__0_i_1
       (.CI(u_var2__0_i_2_n_0),
        .CO({u_var2__0_i_1_n_0,NLW_u_var2__0_i_1_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({temp__0_n_92,temp__0_n_93,temp__0_n_94,temp__0_n_95}),
        .O(u_var3[15:12]),
        .S({u_var2__0_i_5_n_0,u_var2__0_i_6_n_0,u_var2__0_i_7_n_0,u_var2__0_i_8_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2__0_i_10
       (.I0(temp__0_n_97),
        .I1(temp__0_n_95),
        .O(u_var2__0_i_10_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2__0_i_11
       (.I0(temp__0_n_98),
        .I1(temp__0_n_96),
        .O(u_var2__0_i_11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2__0_i_12
       (.I0(temp__0_n_99),
        .I1(temp__0_n_97),
        .O(u_var2__0_i_12_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2__0_i_13
       (.I0(temp__0_n_100),
        .I1(temp__0_n_98),
        .O(u_var2__0_i_13_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2__0_i_14
       (.I0(temp__0_n_101),
        .I1(temp__0_n_99),
        .O(u_var2__0_i_14_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2__0_i_15
       (.I0(temp__0_n_102),
        .I1(temp__0_n_100),
        .O(u_var2__0_i_15_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2__0_i_16
       (.I0(temp__0_n_103),
        .I1(temp__0_n_101),
        .O(u_var2__0_i_16_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2__0_i_17
       (.I0(temp__0_n_104),
        .I1(temp__0_n_102),
        .O(u_var2__0_i_17_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2__0_i_18
       (.I0(temp__0_n_105),
        .I1(temp__0_n_103),
        .O(u_var2__0_i_18_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    u_var2__0_i_19
       (.I0(temp__0_n_104),
        .O(u_var2__0_i_19_n_0));
  CARRY4 u_var2__0_i_2
       (.CI(u_var2__0_i_3_n_0),
        .CO({u_var2__0_i_2_n_0,NLW_u_var2__0_i_2_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({temp__0_n_96,temp__0_n_97,temp__0_n_98,temp__0_n_99}),
        .O(u_var3[11:8]),
        .S({u_var2__0_i_9_n_0,u_var2__0_i_10_n_0,u_var2__0_i_11_n_0,u_var2__0_i_12_n_0}));
  CARRY4 u_var2__0_i_3
       (.CI(u_var2__0_i_4_n_0),
        .CO({u_var2__0_i_3_n_0,NLW_u_var2__0_i_3_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({temp__0_n_100,temp__0_n_101,temp__0_n_102,temp__0_n_103}),
        .O(u_var3[7:4]),
        .S({u_var2__0_i_13_n_0,u_var2__0_i_14_n_0,u_var2__0_i_15_n_0,u_var2__0_i_16_n_0}));
  CARRY4 u_var2__0_i_4
       (.CI(\<const0> ),
        .CO({u_var2__0_i_4_n_0,NLW_u_var2__0_i_4_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({temp__0_n_104,temp__0_n_105,\<const0> ,\<const1> }),
        .O(u_var3[3:0]),
        .S({u_var2__0_i_17_n_0,u_var2__0_i_18_n_0,u_var2__0_i_19_n_0,temp__0_n_105}));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2__0_i_5
       (.I0(temp__0_n_92),
        .I1(temp__0_n_90),
        .O(u_var2__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2__0_i_6
       (.I0(temp__0_n_93),
        .I1(temp__0_n_91),
        .O(u_var2__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2__0_i_7
       (.I0(temp__0_n_94),
        .I1(temp__0_n_92),
        .O(u_var2__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2__0_i_8
       (.I0(temp__0_n_95),
        .I1(temp__0_n_93),
        .O(u_var2__0_i_8_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2__0_i_9
       (.I0(temp__0_n_96),
        .I1(temp__0_n_94),
        .O(u_var2__0_i_9_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x16 4}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("CASCADE"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    u_var2__1
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ACIN({u_var2__0_n_24,u_var2__0_n_25,u_var2__0_n_26,u_var2__0_n_27,u_var2__0_n_28,u_var2__0_n_29,u_var2__0_n_30,u_var2__0_n_31,u_var2__0_n_32,u_var2__0_n_33,u_var2__0_n_34,u_var2__0_n_35,u_var2__0_n_36,u_var2__0_n_37,u_var2__0_n_38,u_var2__0_n_39,u_var2__0_n_40,u_var2__0_n_41,u_var2__0_n_42,u_var2__0_n_43,u_var2__0_n_44,u_var2__0_n_45,u_var2__0_n_46,u_var2__0_n_47,u_var2__0_n_48,u_var2__0_n_49,u_var2__0_n_50,u_var2__0_n_51,u_var2__0_n_52,u_var2__0_n_53}),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,x_var[31:17]}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(\<const0> ),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(u_var2_i_1_n_0),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(\<const0> ),
        .CLK(clk_IBUF_BUFG),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({u_var2__1_n_91,u_var2__1_n_92,u_var2__1_n_93,u_var2__1_n_94,u_var2__1_n_95,u_var2__1_n_96,u_var2__1_n_97,u_var2__1_n_98,u_var2__1_n_99,u_var2__1_n_100,u_var2__1_n_101,u_var2__1_n_102,u_var2__1_n_103,u_var2__1_n_104,u_var2__1_n_105}),
        .PCIN({u_var2__0_n_106,u_var2__0_n_107,u_var2__0_n_108,u_var2__0_n_109,u_var2__0_n_110,u_var2__0_n_111,u_var2__0_n_112,u_var2__0_n_113,u_var2__0_n_114,u_var2__0_n_115,u_var2__0_n_116,u_var2__0_n_117,u_var2__0_n_118,u_var2__0_n_119,u_var2__0_n_120,u_var2__0_n_121,u_var2__0_n_122,u_var2__0_n_123,u_var2__0_n_124,u_var2__0_n_125,u_var2__0_n_126,u_var2__0_n_127,u_var2__0_n_128,u_var2__0_n_129,u_var2__0_n_130,u_var2__0_n_131,u_var2__0_n_132,u_var2__0_n_133,u_var2__0_n_134,u_var2__0_n_135,u_var2__0_n_136,u_var2__0_n_137,u_var2__0_n_138,u_var2__0_n_139,u_var2__0_n_140,u_var2__0_n_141,u_var2__0_n_142,u_var2__0_n_143,u_var2__0_n_144,u_var2__0_n_145,u_var2__0_n_146,u_var2__0_n_147,u_var2__0_n_148,u_var2__0_n_149,u_var2__0_n_150,u_var2__0_n_151,u_var2__0_n_152,u_var2__0_n_153}),
        .RSTA(\<const0> ),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(reset_IBUF),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(\<const0> ));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2__1_i_1
       (.I0(Xinport_IBUF[31]),
        .I1(x_var0[31]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[31]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2__1_i_10
       (.I0(Xinport_IBUF[22]),
        .I1(x_var0[22]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[22]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2__1_i_11
       (.I0(Xinport_IBUF[21]),
        .I1(x_var0[21]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[21]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2__1_i_12
       (.I0(Xinport_IBUF[20]),
        .I1(x_var0[20]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[20]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2__1_i_13
       (.I0(Xinport_IBUF[19]),
        .I1(x_var0[19]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[19]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2__1_i_14
       (.I0(Xinport_IBUF[18]),
        .I1(x_var0[18]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[18]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2__1_i_15
       (.I0(Xinport_IBUF[17]),
        .I1(x_var0[17]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[17]));
  CARRY4 u_var2__1_i_16
       (.CI(u_var2__1_i_17_n_0),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,x_var_reg[30:28]}),
        .O(x_var0[31:28]),
        .S({u_var2__1_i_19_n_0,u_var2__1_i_20_n_0,u_var2__1_i_21_n_0,u_var2__1_i_22_n_0}));
  CARRY4 u_var2__1_i_17
       (.CI(u_var2__1_i_18_n_0),
        .CO({u_var2__1_i_17_n_0,NLW_u_var2__1_i_17_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(x_var_reg[27:24]),
        .O(x_var0[27:24]),
        .S({u_var2__1_i_23_n_0,u_var2__1_i_24_n_0,u_var2__1_i_25_n_0,u_var2__1_i_26_n_0}));
  CARRY4 u_var2__1_i_18
       (.CI(u_var2_i_43_n_0),
        .CO({u_var2__1_i_18_n_0,NLW_u_var2__1_i_18_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(x_var_reg[23:20]),
        .O(x_var0[23:20]),
        .S({u_var2__1_i_27_n_0,u_var2__1_i_28_n_0,u_var2__1_i_29_n_0,u_var2__1_i_30_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2__1_i_19
       (.I0(x_var_reg[31]),
        .I1(DXport_IBUF[31]),
        .O(u_var2__1_i_19_n_0));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2__1_i_2
       (.I0(Xinport_IBUF[30]),
        .I1(x_var0[30]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[30]));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2__1_i_20
       (.I0(x_var_reg[30]),
        .I1(DXport_IBUF[30]),
        .O(u_var2__1_i_20_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2__1_i_21
       (.I0(x_var_reg[29]),
        .I1(DXport_IBUF[29]),
        .O(u_var2__1_i_21_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2__1_i_22
       (.I0(x_var_reg[28]),
        .I1(DXport_IBUF[28]),
        .O(u_var2__1_i_22_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2__1_i_23
       (.I0(x_var_reg[27]),
        .I1(DXport_IBUF[27]),
        .O(u_var2__1_i_23_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2__1_i_24
       (.I0(x_var_reg[26]),
        .I1(DXport_IBUF[26]),
        .O(u_var2__1_i_24_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2__1_i_25
       (.I0(x_var_reg[25]),
        .I1(DXport_IBUF[25]),
        .O(u_var2__1_i_25_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2__1_i_26
       (.I0(x_var_reg[24]),
        .I1(DXport_IBUF[24]),
        .O(u_var2__1_i_26_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2__1_i_27
       (.I0(x_var_reg[23]),
        .I1(DXport_IBUF[23]),
        .O(u_var2__1_i_27_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2__1_i_28
       (.I0(x_var_reg[22]),
        .I1(DXport_IBUF[22]),
        .O(u_var2__1_i_28_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2__1_i_29
       (.I0(x_var_reg[21]),
        .I1(DXport_IBUF[21]),
        .O(u_var2__1_i_29_n_0));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2__1_i_3
       (.I0(Xinport_IBUF[29]),
        .I1(x_var0[29]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[29]));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2__1_i_30
       (.I0(x_var_reg[20]),
        .I1(DXport_IBUF[20]),
        .O(u_var2__1_i_30_n_0));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2__1_i_4
       (.I0(Xinport_IBUF[28]),
        .I1(x_var0[28]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[28]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2__1_i_5
       (.I0(Xinport_IBUF[27]),
        .I1(x_var0[27]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[27]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2__1_i_6
       (.I0(Xinport_IBUF[26]),
        .I1(x_var0[26]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[26]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2__1_i_7
       (.I0(Xinport_IBUF[25]),
        .I1(x_var0[25]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[25]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2__1_i_8
       (.I0(Xinport_IBUF[24]),
        .I1(x_var0[24]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[24]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2__1_i_9
       (.I0(Xinport_IBUF[23]),
        .I1(x_var0[23]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[23]));
  LUT2 #(
    .INIT(4'hB)) 
    u_var2_i_1
       (.I0(\Xoutport_reg[31]_i_2_n_0 ),
        .I1(looping_reg_rep_n_0),
        .O(u_var2_i_1_n_0));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_10
       (.I0(Xinport_IBUF[12]),
        .I1(x_var0[12]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[12]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_11
       (.I0(Xinport_IBUF[11]),
        .I1(x_var0[11]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[11]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_12
       (.I0(Xinport_IBUF[10]),
        .I1(x_var0[10]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[10]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_13
       (.I0(Xinport_IBUF[9]),
        .I1(x_var0[9]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[9]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_14
       (.I0(Xinport_IBUF[8]),
        .I1(x_var0[8]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[8]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_15
       (.I0(Xinport_IBUF[7]),
        .I1(x_var0[7]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[7]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_16
       (.I0(Xinport_IBUF[6]),
        .I1(x_var0[6]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[6]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_17
       (.I0(Xinport_IBUF[5]),
        .I1(x_var0[5]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[5]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_18
       (.I0(Xinport_IBUF[4]),
        .I1(x_var0[4]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[4]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_19
       (.I0(Xinport_IBUF[3]),
        .I1(x_var0[3]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[3]));
  CARRY4 u_var2_i_2
       (.CI(u_var2_i_3_n_0),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,B[28:26]}),
        .O(u_var3[31:28]),
        .S({u_var2_i_25_n_0,u_var2_i_26_n_0,u_var2_i_27_n_0,u_var2_i_28_n_0}));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_20
       (.I0(Xinport_IBUF[2]),
        .I1(x_var0[2]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[2]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_21
       (.I0(Xinport_IBUF[1]),
        .I1(x_var0[1]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[1]));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_22
       (.I0(Xinport_IBUF[0]),
        .I1(x_var0[0]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[0]));
  CARRY4 u_var2_i_23
       (.CI(u_var2_i_24_n_0),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,temp__1_n_92,temp__1_n_93,temp__1_n_94}),
        .O(B[31:28]),
        .S({u_var2_i_48_n_0,u_var2_i_49_n_0,u_var2_i_50_n_0,u_var2_i_51_n_0}));
  CARRY4 u_var2_i_24
       (.CI(u_var2_i_29_n_0),
        .CO({u_var2_i_24_n_0,NLW_u_var2_i_24_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({temp__1_n_95,temp__1_n_96,temp__1_n_97,temp__1_n_98}),
        .O(B[27:24]),
        .S({u_var2_i_52_n_0,u_var2_i_53_n_0,u_var2_i_54_n_0,u_var2_i_55_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2_i_25
       (.I0(B[29]),
        .I1(B[31]),
        .O(u_var2_i_25_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2_i_26
       (.I0(B[28]),
        .I1(B[30]),
        .O(u_var2_i_26_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2_i_27
       (.I0(B[27]),
        .I1(B[29]),
        .O(u_var2_i_27_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2_i_28
       (.I0(B[26]),
        .I1(B[28]),
        .O(u_var2_i_28_n_0));
  CARRY4 u_var2_i_29
       (.CI(u_var2_i_34_n_0),
        .CO({u_var2_i_29_n_0,NLW_u_var2_i_29_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({temp__1_n_99,temp__1_n_100,temp__1_n_101,temp__1_n_102}),
        .O(B[23:20]),
        .S({u_var2_i_56_n_0,u_var2_i_57_n_0,u_var2_i_58_n_0,u_var2_i_59_n_0}));
  CARRY4 u_var2_i_3
       (.CI(u_var2_i_4_n_0),
        .CO({u_var2_i_3_n_0,NLW_u_var2_i_3_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(B[25:22]),
        .O(u_var3[27:24]),
        .S({u_var2_i_30_n_0,u_var2_i_31_n_0,u_var2_i_32_n_0,u_var2_i_33_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2_i_30
       (.I0(B[25]),
        .I1(B[27]),
        .O(u_var2_i_30_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2_i_31
       (.I0(B[24]),
        .I1(B[26]),
        .O(u_var2_i_31_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2_i_32
       (.I0(B[23]),
        .I1(B[25]),
        .O(u_var2_i_32_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2_i_33
       (.I0(B[22]),
        .I1(B[24]),
        .O(u_var2_i_33_n_0));
  CARRY4 u_var2_i_34
       (.CI(\<const0> ),
        .CO({u_var2_i_34_n_0,NLW_u_var2_i_34_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({temp__1_n_103,temp__1_n_104,temp__1_n_105,\<const0> }),
        .O(B[19:16]),
        .S({u_var2_i_60_n_0,u_var2_i_61_n_0,u_var2_i_62_n_0,temp__0_n_89}));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2_i_35
       (.I0(B[21]),
        .I1(B[23]),
        .O(u_var2_i_35_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2_i_36
       (.I0(B[20]),
        .I1(B[22]),
        .O(u_var2_i_36_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2_i_37
       (.I0(B[19]),
        .I1(B[21]),
        .O(u_var2_i_37_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2_i_38
       (.I0(B[18]),
        .I1(B[20]),
        .O(u_var2_i_38_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2_i_39
       (.I0(B[17]),
        .I1(B[19]),
        .O(u_var2_i_39_n_0));
  CARRY4 u_var2_i_4
       (.CI(u_var2_i_5_n_0),
        .CO({u_var2_i_4_n_0,NLW_u_var2_i_4_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(B[21:18]),
        .O(u_var3[23:20]),
        .S({u_var2_i_35_n_0,u_var2_i_36_n_0,u_var2_i_37_n_0,u_var2_i_38_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2_i_40
       (.I0(B[16]),
        .I1(B[18]),
        .O(u_var2_i_40_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2_i_41
       (.I0(temp__0_n_90),
        .I1(B[17]),
        .O(u_var2_i_41_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    u_var2_i_42
       (.I0(temp__0_n_91),
        .I1(B[16]),
        .O(u_var2_i_42_n_0));
  CARRY4 u_var2_i_43
       (.CI(u_var2_i_44_n_0),
        .CO({u_var2_i_43_n_0,NLW_u_var2_i_43_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(x_var_reg[19:16]),
        .O(x_var0[19:16]),
        .S({u_var2_i_64_n_0,u_var2_i_65_n_0,u_var2_i_66_n_0,u_var2_i_67_n_0}));
  CARRY4 u_var2_i_44
       (.CI(u_var2_i_45_n_0),
        .CO({u_var2_i_44_n_0,NLW_u_var2_i_44_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(x_var_reg[15:12]),
        .O(x_var0[15:12]),
        .S({u_var2_i_68_n_0,u_var2_i_69_n_0,u_var2_i_70_n_0,u_var2_i_71_n_0}));
  CARRY4 u_var2_i_45
       (.CI(u_var2_i_46_n_0),
        .CO({u_var2_i_45_n_0,NLW_u_var2_i_45_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(x_var_reg[11:8]),
        .O(x_var0[11:8]),
        .S({u_var2_i_72_n_0,u_var2_i_73_n_0,u_var2_i_74_n_0,u_var2_i_75_n_0}));
  CARRY4 u_var2_i_46
       (.CI(u_var2_i_47_n_0),
        .CO({u_var2_i_46_n_0,NLW_u_var2_i_46_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(x_var_reg[7:4]),
        .O(x_var0[7:4]),
        .S({u_var2_i_76_n_0,u_var2_i_77_n_0,u_var2_i_78_n_0,u_var2_i_79_n_0}));
  CARRY4 u_var2_i_47
       (.CI(\<const0> ),
        .CO({u_var2_i_47_n_0,NLW_u_var2_i_47_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(x_var_reg[3:0]),
        .O(x_var0[3:0]),
        .S({u_var2_i_80_n_0,u_var2_i_81_n_0,u_var2_i_82_n_0,u_var2_i_83_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_48
       (.I0(temp__1_n_91),
        .I1(p_0_in[31]),
        .O(u_var2_i_48_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_49
       (.I0(temp__1_n_92),
        .I1(p_0_in[30]),
        .O(u_var2_i_49_n_0));
  CARRY4 u_var2_i_5
       (.CI(u_var2__0_i_1_n_0),
        .CO({u_var2_i_5_n_0,NLW_u_var2_i_5_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({B[17:16],temp__0_n_90,temp__0_n_91}),
        .O(u_var3[19:16]),
        .S({u_var2_i_39_n_0,u_var2_i_40_n_0,u_var2_i_41_n_0,u_var2_i_42_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_50
       (.I0(temp__1_n_93),
        .I1(p_0_in[29]),
        .O(u_var2_i_50_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_51
       (.I0(temp__1_n_94),
        .I1(p_0_in[28]),
        .O(u_var2_i_51_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_52
       (.I0(temp__1_n_95),
        .I1(p_0_in[27]),
        .O(u_var2_i_52_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_53
       (.I0(temp__1_n_96),
        .I1(p_0_in[26]),
        .O(u_var2_i_53_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_54
       (.I0(temp__1_n_97),
        .I1(p_0_in[25]),
        .O(u_var2_i_54_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_55
       (.I0(temp__1_n_98),
        .I1(p_0_in[24]),
        .O(u_var2_i_55_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_56
       (.I0(temp__1_n_99),
        .I1(p_0_in[23]),
        .O(u_var2_i_56_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_57
       (.I0(temp__1_n_100),
        .I1(p_0_in[22]),
        .O(u_var2_i_57_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_58
       (.I0(temp__1_n_101),
        .I1(p_0_in[21]),
        .O(u_var2_i_58_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_59
       (.I0(temp__1_n_102),
        .I1(p_0_in[20]),
        .O(u_var2_i_59_n_0));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_6
       (.I0(Xinport_IBUF[16]),
        .I1(x_var0[16]),
        .I2(looping),
        .O(x_var[16]));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_60
       (.I0(temp__1_n_103),
        .I1(p_0_in[19]),
        .O(u_var2_i_60_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_61
       (.I0(temp__1_n_104),
        .I1(p_0_in[18]),
        .O(u_var2_i_61_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_62
       (.I0(temp__1_n_105),
        .I1(p_0_in[17]),
        .O(u_var2_i_62_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_64
       (.I0(x_var_reg[19]),
        .I1(DXport_IBUF[19]),
        .O(u_var2_i_64_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_65
       (.I0(x_var_reg[18]),
        .I1(DXport_IBUF[18]),
        .O(u_var2_i_65_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_66
       (.I0(x_var_reg[17]),
        .I1(DXport_IBUF[17]),
        .O(u_var2_i_66_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_67
       (.I0(x_var_reg[16]),
        .I1(DXport_IBUF[16]),
        .O(u_var2_i_67_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_68
       (.I0(x_var_reg[15]),
        .I1(DXport_IBUF[15]),
        .O(u_var2_i_68_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_69
       (.I0(x_var_reg[14]),
        .I1(DXport_IBUF[14]),
        .O(u_var2_i_69_n_0));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_7
       (.I0(Xinport_IBUF[15]),
        .I1(x_var0[15]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[15]));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_70
       (.I0(x_var_reg[13]),
        .I1(DXport_IBUF[13]),
        .O(u_var2_i_70_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_71
       (.I0(x_var_reg[12]),
        .I1(DXport_IBUF[12]),
        .O(u_var2_i_71_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_72
       (.I0(x_var_reg[11]),
        .I1(DXport_IBUF[11]),
        .O(u_var2_i_72_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_73
       (.I0(x_var_reg[10]),
        .I1(DXport_IBUF[10]),
        .O(u_var2_i_73_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_74
       (.I0(x_var_reg[9]),
        .I1(DXport_IBUF[9]),
        .O(u_var2_i_74_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_75
       (.I0(x_var_reg[8]),
        .I1(DXport_IBUF[8]),
        .O(u_var2_i_75_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_76
       (.I0(x_var_reg[7]),
        .I1(DXport_IBUF[7]),
        .O(u_var2_i_76_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_77
       (.I0(x_var_reg[6]),
        .I1(DXport_IBUF[6]),
        .O(u_var2_i_77_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_78
       (.I0(x_var_reg[5]),
        .I1(DXport_IBUF[5]),
        .O(u_var2_i_78_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_79
       (.I0(x_var_reg[4]),
        .I1(DXport_IBUF[4]),
        .O(u_var2_i_79_n_0));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_8
       (.I0(Xinport_IBUF[14]),
        .I1(x_var0[14]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[14]));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_80
       (.I0(x_var_reg[3]),
        .I1(DXport_IBUF[3]),
        .O(u_var2_i_80_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_81
       (.I0(x_var_reg[2]),
        .I1(DXport_IBUF[2]),
        .O(u_var2_i_81_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_82
       (.I0(x_var_reg[1]),
        .I1(DXport_IBUF[1]),
        .O(u_var2_i_82_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    u_var2_i_83
       (.I0(x_var_reg[0]),
        .I1(DXport_IBUF[0]),
        .O(u_var2_i_83_n_0));
  LUT3 #(
    .INIT(8'hCA)) 
    u_var2_i_9
       (.I0(Xinport_IBUF[13]),
        .I1(x_var0[13]),
        .I2(looping_reg_rep_n_0),
        .O(x_var[13]));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[0]_i_1 
       (.I0(u_var0[0]),
        .I1(Uinport_IBUF[0]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[10]_i_1 
       (.I0(u_var0[10]),
        .I1(Uinport_IBUF[10]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[10]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[11]_i_1 
       (.I0(u_var0[11]),
        .I1(Uinport_IBUF[11]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[11]_i_1_n_0 ));
  (* HLUTNM = "lutpair7" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[11]_i_10 
       (.I0(u_var2__0_n_97),
        .I1(u_var1__0_n_97),
        .I2(\u_var_reg_n_0_[8] ),
        .I3(\u_var[11]_i_6_n_0 ),
        .O(\u_var[11]_i_10_n_0 ));
  (* HLUTNM = "lutpair9" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[11]_i_3 
       (.I0(u_var2__0_n_95),
        .I1(u_var1__0_n_95),
        .I2(\u_var_reg_n_0_[10] ),
        .O(\u_var[11]_i_3_n_0 ));
  (* HLUTNM = "lutpair8" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[11]_i_4 
       (.I0(u_var2__0_n_96),
        .I1(u_var1__0_n_96),
        .I2(\u_var_reg_n_0_[9] ),
        .O(\u_var[11]_i_4_n_0 ));
  (* HLUTNM = "lutpair7" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[11]_i_5 
       (.I0(u_var2__0_n_97),
        .I1(u_var1__0_n_97),
        .I2(\u_var_reg_n_0_[8] ),
        .O(\u_var[11]_i_5_n_0 ));
  (* HLUTNM = "lutpair6" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[11]_i_6 
       (.I0(u_var2__0_n_98),
        .I1(u_var1__0_n_98),
        .I2(\u_var_reg_n_0_[7] ),
        .O(\u_var[11]_i_6_n_0 ));
  (* HLUTNM = "lutpair10" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[11]_i_7 
       (.I0(u_var2__0_n_94),
        .I1(u_var1__0_n_94),
        .I2(\u_var_reg_n_0_[11] ),
        .I3(\u_var[11]_i_3_n_0 ),
        .O(\u_var[11]_i_7_n_0 ));
  (* HLUTNM = "lutpair9" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[11]_i_8 
       (.I0(u_var2__0_n_95),
        .I1(u_var1__0_n_95),
        .I2(\u_var_reg_n_0_[10] ),
        .I3(\u_var[11]_i_4_n_0 ),
        .O(\u_var[11]_i_8_n_0 ));
  (* HLUTNM = "lutpair8" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[11]_i_9 
       (.I0(u_var2__0_n_96),
        .I1(u_var1__0_n_96),
        .I2(\u_var_reg_n_0_[9] ),
        .I3(\u_var[11]_i_5_n_0 ),
        .O(\u_var[11]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[12]_i_1 
       (.I0(u_var0[12]),
        .I1(Uinport_IBUF[12]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[12]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[13]_i_1 
       (.I0(u_var0[13]),
        .I1(Uinport_IBUF[13]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[13]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[14]_i_1 
       (.I0(u_var0[14]),
        .I1(Uinport_IBUF[14]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[14]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[15]_i_1 
       (.I0(u_var0[15]),
        .I1(Uinport_IBUF[15]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[15]_i_1_n_0 ));
  (* HLUTNM = "lutpair11" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[15]_i_10 
       (.I0(u_var2__0_n_93),
        .I1(u_var1__0_n_93),
        .I2(\u_var_reg_n_0_[12] ),
        .I3(\u_var[15]_i_6_n_0 ),
        .O(\u_var[15]_i_10_n_0 ));
  (* HLUTNM = "lutpair13" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[15]_i_3 
       (.I0(u_var2__0_n_91),
        .I1(u_var1__0_n_91),
        .I2(\u_var_reg_n_0_[14] ),
        .O(\u_var[15]_i_3_n_0 ));
  (* HLUTNM = "lutpair12" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[15]_i_4 
       (.I0(u_var2__0_n_92),
        .I1(u_var1__0_n_92),
        .I2(\u_var_reg_n_0_[13] ),
        .O(\u_var[15]_i_4_n_0 ));
  (* HLUTNM = "lutpair11" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[15]_i_5 
       (.I0(u_var2__0_n_93),
        .I1(u_var1__0_n_93),
        .I2(\u_var_reg_n_0_[12] ),
        .O(\u_var[15]_i_5_n_0 ));
  (* HLUTNM = "lutpair10" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[15]_i_6 
       (.I0(u_var2__0_n_94),
        .I1(u_var1__0_n_94),
        .I2(\u_var_reg_n_0_[11] ),
        .O(\u_var[15]_i_6_n_0 ));
  (* HLUTNM = "lutpair14" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[15]_i_7 
       (.I0(u_var2__0_n_90),
        .I1(u_var1__0_n_90),
        .I2(\u_var_reg_n_0_[15] ),
        .I3(\u_var[15]_i_3_n_0 ),
        .O(\u_var[15]_i_7_n_0 ));
  (* HLUTNM = "lutpair13" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[15]_i_8 
       (.I0(u_var2__0_n_91),
        .I1(u_var1__0_n_91),
        .I2(\u_var_reg_n_0_[14] ),
        .I3(\u_var[15]_i_4_n_0 ),
        .O(\u_var[15]_i_8_n_0 ));
  (* HLUTNM = "lutpair12" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[15]_i_9 
       (.I0(u_var2__0_n_92),
        .I1(u_var1__0_n_92),
        .I2(\u_var_reg_n_0_[13] ),
        .I3(\u_var[15]_i_5_n_0 ),
        .O(\u_var[15]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[16]_i_1 
       (.I0(u_var0[16]),
        .I1(Uinport_IBUF[16]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[16]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[17]_i_1 
       (.I0(u_var0[17]),
        .I1(Uinport_IBUF[17]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[17]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[18]_i_1 
       (.I0(u_var0[18]),
        .I1(Uinport_IBUF[18]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[18]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[19]_i_1 
       (.I0(u_var0[19]),
        .I1(Uinport_IBUF[19]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[19]_i_1_n_0 ));
  (* HLUTNM = "lutpair15" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[19]_i_10 
       (.I0(\u_var_reg[23]_i_11_n_7 ),
        .I1(\u_var_reg[23]_i_12_n_7 ),
        .I2(\u_var_reg_n_0_[16] ),
        .I3(\u_var[19]_i_6_n_0 ),
        .O(\u_var[19]_i_10_n_0 ));
  (* HLUTNM = "lutpair17" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[19]_i_3 
       (.I0(\u_var_reg[23]_i_11_n_5 ),
        .I1(\u_var_reg[23]_i_12_n_5 ),
        .I2(\u_var_reg_n_0_[18] ),
        .O(\u_var[19]_i_3_n_0 ));
  (* HLUTNM = "lutpair16" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[19]_i_4 
       (.I0(\u_var_reg[23]_i_11_n_6 ),
        .I1(\u_var_reg[23]_i_12_n_6 ),
        .I2(\u_var_reg_n_0_[17] ),
        .O(\u_var[19]_i_4_n_0 ));
  (* HLUTNM = "lutpair15" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[19]_i_5 
       (.I0(\u_var_reg[23]_i_11_n_7 ),
        .I1(\u_var_reg[23]_i_12_n_7 ),
        .I2(\u_var_reg_n_0_[16] ),
        .O(\u_var[19]_i_5_n_0 ));
  (* HLUTNM = "lutpair14" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[19]_i_6 
       (.I0(u_var2__0_n_90),
        .I1(u_var1__0_n_90),
        .I2(\u_var_reg_n_0_[15] ),
        .O(\u_var[19]_i_6_n_0 ));
  (* HLUTNM = "lutpair18" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[19]_i_7 
       (.I0(\u_var_reg[23]_i_11_n_4 ),
        .I1(\u_var_reg[23]_i_12_n_4 ),
        .I2(\u_var_reg_n_0_[19] ),
        .I3(\u_var[19]_i_3_n_0 ),
        .O(\u_var[19]_i_7_n_0 ));
  (* HLUTNM = "lutpair17" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[19]_i_8 
       (.I0(\u_var_reg[23]_i_11_n_5 ),
        .I1(\u_var_reg[23]_i_12_n_5 ),
        .I2(\u_var_reg_n_0_[18] ),
        .I3(\u_var[19]_i_4_n_0 ),
        .O(\u_var[19]_i_8_n_0 ));
  (* HLUTNM = "lutpair16" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[19]_i_9 
       (.I0(\u_var_reg[23]_i_11_n_6 ),
        .I1(\u_var_reg[23]_i_12_n_6 ),
        .I2(\u_var_reg_n_0_[17] ),
        .I3(\u_var[19]_i_5_n_0 ),
        .O(\u_var[19]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[1]_i_1 
       (.I0(u_var0[1]),
        .I1(Uinport_IBUF[1]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[20]_i_1 
       (.I0(u_var0[20]),
        .I1(Uinport_IBUF[20]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[20]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[21]_i_1 
       (.I0(u_var0[21]),
        .I1(Uinport_IBUF[21]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[21]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[22]_i_1 
       (.I0(u_var0[22]),
        .I1(Uinport_IBUF[22]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[22]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[23]_i_1 
       (.I0(u_var0[23]),
        .I1(Uinport_IBUF[23]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[23]_i_10 
       (.I0(\u_var_reg[27]_i_11_n_7 ),
        .I1(\u_var_reg[27]_i_12_n_7 ),
        .I2(\u_var_reg_n_0_[20] ),
        .I3(\u_var[23]_i_6_n_0 ),
        .O(\u_var[23]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[23]_i_13 
       (.I0(u_var2__1_n_103),
        .I1(u_var2_n_103),
        .O(\u_var[23]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[23]_i_14 
       (.I0(u_var2__1_n_104),
        .I1(u_var2_n_104),
        .O(\u_var[23]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[23]_i_15 
       (.I0(u_var2__1_n_105),
        .I1(u_var2_n_105),
        .O(\u_var[23]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[23]_i_17 
       (.I0(u_var1__1_n_103),
        .I1(u_var1_n_103),
        .O(\u_var[23]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[23]_i_18 
       (.I0(u_var1__1_n_104),
        .I1(u_var1_n_104),
        .O(\u_var[23]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[23]_i_19 
       (.I0(u_var1__1_n_105),
        .I1(u_var1_n_105),
        .O(\u_var[23]_i_19_n_0 ));
  (* HLUTNM = "lutpair19" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[23]_i_3 
       (.I0(\u_var_reg[27]_i_11_n_5 ),
        .I1(\u_var_reg[27]_i_12_n_5 ),
        .I2(\u_var_reg_n_0_[22] ),
        .O(\u_var[23]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[23]_i_4 
       (.I0(\u_var_reg[27]_i_11_n_6 ),
        .I1(\u_var_reg[27]_i_12_n_6 ),
        .I2(\u_var_reg_n_0_[21] ),
        .O(\u_var[23]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[23]_i_5 
       (.I0(\u_var_reg[27]_i_11_n_7 ),
        .I1(\u_var_reg[27]_i_12_n_7 ),
        .I2(\u_var_reg_n_0_[20] ),
        .O(\u_var[23]_i_5_n_0 ));
  (* HLUTNM = "lutpair18" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[23]_i_6 
       (.I0(\u_var_reg[23]_i_11_n_4 ),
        .I1(\u_var_reg[23]_i_12_n_4 ),
        .I2(\u_var_reg_n_0_[19] ),
        .O(\u_var[23]_i_6_n_0 ));
  (* HLUTNM = "lutpair20" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[23]_i_7 
       (.I0(\u_var_reg[27]_i_11_n_4 ),
        .I1(\u_var_reg[27]_i_12_n_4 ),
        .I2(\u_var_reg_n_0_[23] ),
        .I3(\u_var[23]_i_3_n_0 ),
        .O(\u_var[23]_i_7_n_0 ));
  (* HLUTNM = "lutpair19" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[23]_i_8 
       (.I0(\u_var_reg[27]_i_11_n_5 ),
        .I1(\u_var_reg[27]_i_12_n_5 ),
        .I2(\u_var_reg_n_0_[22] ),
        .I3(\u_var[23]_i_4_n_0 ),
        .O(\u_var[23]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[23]_i_9 
       (.I0(\u_var_reg[27]_i_11_n_6 ),
        .I1(\u_var_reg[27]_i_12_n_6 ),
        .I2(\u_var_reg_n_0_[21] ),
        .I3(\u_var[23]_i_5_n_0 ),
        .O(\u_var[23]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[24]_i_1 
       (.I0(u_var0[24]),
        .I1(Uinport_IBUF[24]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[24]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[25]_i_1 
       (.I0(u_var0[25]),
        .I1(Uinport_IBUF[25]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[25]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[26]_i_1 
       (.I0(u_var0[26]),
        .I1(Uinport_IBUF[26]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[26]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[27]_i_1 
       (.I0(u_var0[27]),
        .I1(Uinport_IBUF[27]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[27]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[27]_i_10 
       (.I0(\u_var_reg[31]_i_12_n_7 ),
        .I1(\u_var_reg[31]_i_13_n_7 ),
        .I2(\u_var_reg_n_0_[24] ),
        .I3(\u_var[27]_i_6_n_0 ),
        .O(\u_var[27]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[27]_i_13 
       (.I0(u_var2__1_n_99),
        .I1(u_var2_n_99),
        .O(\u_var[27]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[27]_i_14 
       (.I0(u_var2__1_n_100),
        .I1(u_var2_n_100),
        .O(\u_var[27]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[27]_i_15 
       (.I0(u_var2__1_n_101),
        .I1(u_var2_n_101),
        .O(\u_var[27]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[27]_i_16 
       (.I0(u_var2__1_n_102),
        .I1(u_var2_n_102),
        .O(\u_var[27]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[27]_i_17 
       (.I0(u_var1__1_n_99),
        .I1(u_var1_n_99),
        .O(\u_var[27]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[27]_i_18 
       (.I0(u_var1__1_n_100),
        .I1(u_var1_n_100),
        .O(\u_var[27]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[27]_i_19 
       (.I0(u_var1__1_n_101),
        .I1(u_var1_n_101),
        .O(\u_var[27]_i_19_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[27]_i_20 
       (.I0(u_var1__1_n_102),
        .I1(u_var1_n_102),
        .O(\u_var[27]_i_20_n_0 ));
  (* HLUTNM = "lutpair21" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[27]_i_3 
       (.I0(\u_var_reg[31]_i_12_n_5 ),
        .I1(\u_var_reg[31]_i_13_n_5 ),
        .I2(\u_var_reg_n_0_[26] ),
        .O(\u_var[27]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[27]_i_4 
       (.I0(\u_var_reg[31]_i_12_n_6 ),
        .I1(\u_var_reg[31]_i_13_n_6 ),
        .I2(\u_var_reg_n_0_[25] ),
        .O(\u_var[27]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[27]_i_5 
       (.I0(\u_var_reg[31]_i_12_n_7 ),
        .I1(\u_var_reg[31]_i_13_n_7 ),
        .I2(\u_var_reg_n_0_[24] ),
        .O(\u_var[27]_i_5_n_0 ));
  (* HLUTNM = "lutpair20" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[27]_i_6 
       (.I0(\u_var_reg[27]_i_11_n_4 ),
        .I1(\u_var_reg[27]_i_12_n_4 ),
        .I2(\u_var_reg_n_0_[23] ),
        .O(\u_var[27]_i_6_n_0 ));
  (* HLUTNM = "lutpair22" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[27]_i_7 
       (.I0(\u_var_reg[31]_i_12_n_4 ),
        .I1(\u_var_reg[31]_i_13_n_4 ),
        .I2(\u_var_reg_n_0_[27] ),
        .I3(\u_var[27]_i_3_n_0 ),
        .O(\u_var[27]_i_7_n_0 ));
  (* HLUTNM = "lutpair21" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[27]_i_8 
       (.I0(\u_var_reg[31]_i_12_n_5 ),
        .I1(\u_var_reg[31]_i_13_n_5 ),
        .I2(\u_var_reg_n_0_[26] ),
        .I3(\u_var[27]_i_4_n_0 ),
        .O(\u_var[27]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[27]_i_9 
       (.I0(\u_var_reg[31]_i_12_n_6 ),
        .I1(\u_var_reg[31]_i_13_n_6 ),
        .I2(\u_var_reg_n_0_[25] ),
        .I3(\u_var[27]_i_5_n_0 ),
        .O(\u_var[27]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[28]_i_1 
       (.I0(u_var0[28]),
        .I1(Uinport_IBUF[28]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[28]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[29]_i_1 
       (.I0(u_var0[29]),
        .I1(Uinport_IBUF[29]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[29]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[2]_i_1 
       (.I0(u_var0[2]),
        .I1(Uinport_IBUF[2]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[30]_i_1 
       (.I0(u_var0[30]),
        .I1(Uinport_IBUF[30]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[30]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[31]_i_1 
       (.I0(u_var0[31]),
        .I1(Uinport_IBUF[31]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[31]_i_14 
       (.I0(u_var2__1_n_91),
        .I1(u_var2_n_91),
        .O(\u_var[31]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[31]_i_15 
       (.I0(u_var2__1_n_92),
        .I1(u_var2_n_92),
        .O(\u_var[31]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[31]_i_16 
       (.I0(u_var2__1_n_93),
        .I1(u_var2_n_93),
        .O(\u_var[31]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[31]_i_17 
       (.I0(u_var2__1_n_94),
        .I1(u_var2_n_94),
        .O(\u_var[31]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[31]_i_18 
       (.I0(u_var1__1_n_91),
        .I1(u_var1_n_91),
        .O(\u_var[31]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[31]_i_19 
       (.I0(u_var1__1_n_92),
        .I1(u_var1_n_92),
        .O(\u_var[31]_i_19_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[31]_i_20 
       (.I0(u_var1__1_n_93),
        .I1(u_var1_n_93),
        .O(\u_var[31]_i_20_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[31]_i_21 
       (.I0(u_var1__1_n_94),
        .I1(u_var1_n_94),
        .O(\u_var[31]_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[31]_i_22 
       (.I0(u_var2__1_n_95),
        .I1(u_var2_n_95),
        .O(\u_var[31]_i_22_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[31]_i_23 
       (.I0(u_var2__1_n_96),
        .I1(u_var2_n_96),
        .O(\u_var[31]_i_23_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[31]_i_24 
       (.I0(u_var2__1_n_97),
        .I1(u_var2_n_97),
        .O(\u_var[31]_i_24_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[31]_i_25 
       (.I0(u_var2__1_n_98),
        .I1(u_var2_n_98),
        .O(\u_var[31]_i_25_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[31]_i_26 
       (.I0(u_var1__1_n_95),
        .I1(u_var1_n_95),
        .O(\u_var[31]_i_26_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[31]_i_27 
       (.I0(u_var1__1_n_96),
        .I1(u_var1_n_96),
        .O(\u_var[31]_i_27_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[31]_i_28 
       (.I0(u_var1__1_n_97),
        .I1(u_var1_n_97),
        .O(\u_var[31]_i_28_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \u_var[31]_i_29 
       (.I0(u_var1__1_n_98),
        .I1(u_var1_n_98),
        .O(\u_var[31]_i_29_n_0 ));
  (* HLUTNM = "lutpair24" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[31]_i_3 
       (.I0(\u_var_reg[31]_i_10_n_6 ),
        .I1(\u_var_reg[31]_i_11_n_6 ),
        .I2(\u_var_reg_n_0_[29] ),
        .O(\u_var[31]_i_3_n_0 ));
  (* HLUTNM = "lutpair23" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[31]_i_4 
       (.I0(\u_var_reg[31]_i_10_n_7 ),
        .I1(\u_var_reg[31]_i_11_n_7 ),
        .I2(\u_var_reg_n_0_[28] ),
        .O(\u_var[31]_i_4_n_0 ));
  (* HLUTNM = "lutpair22" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[31]_i_5 
       (.I0(\u_var_reg[31]_i_12_n_4 ),
        .I1(\u_var_reg[31]_i_13_n_4 ),
        .I2(\u_var_reg_n_0_[27] ),
        .O(\u_var[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hD42B2BD42BD4D42B)) 
    \u_var[31]_i_6 
       (.I0(\u_var_reg_n_0_[30] ),
        .I1(\u_var_reg[31]_i_11_n_5 ),
        .I2(\u_var_reg[31]_i_10_n_5 ),
        .I3(\u_var_reg[31]_i_11_n_4 ),
        .I4(\u_var_reg[31]_i_10_n_4 ),
        .I5(\u_var_reg_n_0_[31] ),
        .O(\u_var[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[31]_i_7 
       (.I0(\u_var[31]_i_3_n_0 ),
        .I1(\u_var_reg[31]_i_11_n_5 ),
        .I2(\u_var_reg[31]_i_10_n_5 ),
        .I3(\u_var_reg_n_0_[30] ),
        .O(\u_var[31]_i_7_n_0 ));
  (* HLUTNM = "lutpair24" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[31]_i_8 
       (.I0(\u_var_reg[31]_i_10_n_6 ),
        .I1(\u_var_reg[31]_i_11_n_6 ),
        .I2(\u_var_reg_n_0_[29] ),
        .I3(\u_var[31]_i_4_n_0 ),
        .O(\u_var[31]_i_8_n_0 ));
  (* HLUTNM = "lutpair23" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[31]_i_9 
       (.I0(\u_var_reg[31]_i_10_n_7 ),
        .I1(\u_var_reg[31]_i_11_n_7 ),
        .I2(\u_var_reg_n_0_[28] ),
        .I3(\u_var[31]_i_5_n_0 ),
        .O(\u_var[31]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[3]_i_1 
       (.I0(u_var0[3]),
        .I1(Uinport_IBUF[3]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[3]_i_1_n_0 ));
  (* HLUTNM = "lutpair1" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[3]_i_3 
       (.I0(u_var2__0_n_103),
        .I1(u_var1__0_n_103),
        .I2(\u_var_reg_n_0_[2] ),
        .O(\u_var[3]_i_3_n_0 ));
  (* HLUTNM = "lutpair0" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[3]_i_4 
       (.I0(u_var2__0_n_104),
        .I1(u_var1__0_n_104),
        .I2(\u_var_reg_n_0_[1] ),
        .O(\u_var[3]_i_4_n_0 ));
  (* HLUTNM = "lutpair25" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[3]_i_5 
       (.I0(u_var2__0_n_105),
        .I1(u_var1__0_n_105),
        .I2(\u_var_reg_n_0_[0] ),
        .O(\u_var[3]_i_5_n_0 ));
  (* HLUTNM = "lutpair2" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[3]_i_6 
       (.I0(u_var2__0_n_102),
        .I1(u_var1__0_n_102),
        .I2(\u_var_reg_n_0_[3] ),
        .I3(\u_var[3]_i_3_n_0 ),
        .O(\u_var[3]_i_6_n_0 ));
  (* HLUTNM = "lutpair1" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[3]_i_7 
       (.I0(u_var2__0_n_103),
        .I1(u_var1__0_n_103),
        .I2(\u_var_reg_n_0_[2] ),
        .I3(\u_var[3]_i_4_n_0 ),
        .O(\u_var[3]_i_7_n_0 ));
  (* HLUTNM = "lutpair0" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[3]_i_8 
       (.I0(u_var2__0_n_104),
        .I1(u_var1__0_n_104),
        .I2(\u_var_reg_n_0_[1] ),
        .I3(\u_var[3]_i_5_n_0 ),
        .O(\u_var[3]_i_8_n_0 ));
  (* HLUTNM = "lutpair25" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \u_var[3]_i_9 
       (.I0(u_var2__0_n_105),
        .I1(u_var1__0_n_105),
        .I2(\u_var_reg_n_0_[0] ),
        .O(\u_var[3]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[4]_i_1 
       (.I0(u_var0[4]),
        .I1(Uinport_IBUF[4]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[5]_i_1 
       (.I0(u_var0[5]),
        .I1(Uinport_IBUF[5]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[5]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[6]_i_1 
       (.I0(u_var0[6]),
        .I1(Uinport_IBUF[6]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[7]_i_1 
       (.I0(u_var0[7]),
        .I1(Uinport_IBUF[7]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[7]_i_1_n_0 ));
  (* HLUTNM = "lutpair3" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[7]_i_10 
       (.I0(u_var2__0_n_101),
        .I1(u_var1__0_n_101),
        .I2(\u_var_reg_n_0_[4] ),
        .I3(\u_var[7]_i_6_n_0 ),
        .O(\u_var[7]_i_10_n_0 ));
  (* HLUTNM = "lutpair5" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[7]_i_3 
       (.I0(u_var2__0_n_99),
        .I1(u_var1__0_n_99),
        .I2(\u_var_reg_n_0_[6] ),
        .O(\u_var[7]_i_3_n_0 ));
  (* HLUTNM = "lutpair4" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[7]_i_4 
       (.I0(u_var2__0_n_100),
        .I1(u_var1__0_n_100),
        .I2(\u_var_reg_n_0_[5] ),
        .O(\u_var[7]_i_4_n_0 ));
  (* HLUTNM = "lutpair3" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[7]_i_5 
       (.I0(u_var2__0_n_101),
        .I1(u_var1__0_n_101),
        .I2(\u_var_reg_n_0_[4] ),
        .O(\u_var[7]_i_5_n_0 ));
  (* HLUTNM = "lutpair2" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \u_var[7]_i_6 
       (.I0(u_var2__0_n_102),
        .I1(u_var1__0_n_102),
        .I2(\u_var_reg_n_0_[3] ),
        .O(\u_var[7]_i_6_n_0 ));
  (* HLUTNM = "lutpair6" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[7]_i_7 
       (.I0(u_var2__0_n_98),
        .I1(u_var1__0_n_98),
        .I2(\u_var_reg_n_0_[7] ),
        .I3(\u_var[7]_i_3_n_0 ),
        .O(\u_var[7]_i_7_n_0 ));
  (* HLUTNM = "lutpair5" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[7]_i_8 
       (.I0(u_var2__0_n_99),
        .I1(u_var1__0_n_99),
        .I2(\u_var_reg_n_0_[6] ),
        .I3(\u_var[7]_i_4_n_0 ),
        .O(\u_var[7]_i_8_n_0 ));
  (* HLUTNM = "lutpair4" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \u_var[7]_i_9 
       (.I0(u_var2__0_n_100),
        .I1(u_var1__0_n_100),
        .I2(\u_var_reg_n_0_[5] ),
        .I3(\u_var[7]_i_5_n_0 ),
        .O(\u_var[7]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[8]_i_1 
       (.I0(u_var0[8]),
        .I1(Uinport_IBUF[8]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[8]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \u_var[9]_i_1 
       (.I0(u_var0[9]),
        .I1(Uinport_IBUF[9]),
        .I2(looping_reg_rep_n_0),
        .O(\u_var[9]_i_1_n_0 ));
  FDRE \u_var_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[0]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[0] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[10]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[10] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[11]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[11] ),
        .R(reset_IBUF));
  CARRY4 \u_var_reg[11]_i_2 
       (.CI(\u_var_reg[7]_i_2_n_0 ),
        .CO({\u_var_reg[11]_i_2_n_0 ,\NLW_u_var_reg[11]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\u_var[11]_i_3_n_0 ,\u_var[11]_i_4_n_0 ,\u_var[11]_i_5_n_0 ,\u_var[11]_i_6_n_0 }),
        .O(u_var0[11:8]),
        .S({\u_var[11]_i_7_n_0 ,\u_var[11]_i_8_n_0 ,\u_var[11]_i_9_n_0 ,\u_var[11]_i_10_n_0 }));
  FDRE \u_var_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[12]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[12] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[13]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[13] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[14]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[14] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[15]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[15] ),
        .R(reset_IBUF));
  CARRY4 \u_var_reg[15]_i_2 
       (.CI(\u_var_reg[11]_i_2_n_0 ),
        .CO({\u_var_reg[15]_i_2_n_0 ,\NLW_u_var_reg[15]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\u_var[15]_i_3_n_0 ,\u_var[15]_i_4_n_0 ,\u_var[15]_i_5_n_0 ,\u_var[15]_i_6_n_0 }),
        .O(u_var0[15:12]),
        .S({\u_var[15]_i_7_n_0 ,\u_var[15]_i_8_n_0 ,\u_var[15]_i_9_n_0 ,\u_var[15]_i_10_n_0 }));
  FDRE \u_var_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[16]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[16] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[17]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[17] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[18]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[18] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[19]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[19] ),
        .R(reset_IBUF));
  CARRY4 \u_var_reg[19]_i_2 
       (.CI(\u_var_reg[15]_i_2_n_0 ),
        .CO({\u_var_reg[19]_i_2_n_0 ,\NLW_u_var_reg[19]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\u_var[19]_i_3_n_0 ,\u_var[19]_i_4_n_0 ,\u_var[19]_i_5_n_0 ,\u_var[19]_i_6_n_0 }),
        .O(u_var0[19:16]),
        .S({\u_var[19]_i_7_n_0 ,\u_var[19]_i_8_n_0 ,\u_var[19]_i_9_n_0 ,\u_var[19]_i_10_n_0 }));
  FDRE \u_var_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[1]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[1] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[20]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[20] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[21]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[21] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[22]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[22] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[23]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[23] ),
        .R(reset_IBUF));
  CARRY4 \u_var_reg[23]_i_11 
       (.CI(\<const0> ),
        .CO({\u_var_reg[23]_i_11_n_0 ,\NLW_u_var_reg[23]_i_11_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({u_var2__1_n_103,u_var2__1_n_104,u_var2__1_n_105,\<const0> }),
        .O({\u_var_reg[23]_i_11_n_4 ,\u_var_reg[23]_i_11_n_5 ,\u_var_reg[23]_i_11_n_6 ,\u_var_reg[23]_i_11_n_7 }),
        .S({\u_var[23]_i_13_n_0 ,\u_var[23]_i_14_n_0 ,\u_var[23]_i_15_n_0 ,u_var2__0_n_89}));
  CARRY4 \u_var_reg[23]_i_12 
       (.CI(\<const0> ),
        .CO({\u_var_reg[23]_i_12_n_0 ,\NLW_u_var_reg[23]_i_12_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({u_var1__1_n_103,u_var1__1_n_104,u_var1__1_n_105,\<const0> }),
        .O({\u_var_reg[23]_i_12_n_4 ,\u_var_reg[23]_i_12_n_5 ,\u_var_reg[23]_i_12_n_6 ,\u_var_reg[23]_i_12_n_7 }),
        .S({\u_var[23]_i_17_n_0 ,\u_var[23]_i_18_n_0 ,\u_var[23]_i_19_n_0 ,u_var1__0_n_89}));
  CARRY4 \u_var_reg[23]_i_2 
       (.CI(\u_var_reg[19]_i_2_n_0 ),
        .CO({\u_var_reg[23]_i_2_n_0 ,\NLW_u_var_reg[23]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\u_var[23]_i_3_n_0 ,\u_var[23]_i_4_n_0 ,\u_var[23]_i_5_n_0 ,\u_var[23]_i_6_n_0 }),
        .O(u_var0[23:20]),
        .S({\u_var[23]_i_7_n_0 ,\u_var[23]_i_8_n_0 ,\u_var[23]_i_9_n_0 ,\u_var[23]_i_10_n_0 }));
  FDRE \u_var_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[24]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[24] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[25]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[25] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[26]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[26] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[27]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[27] ),
        .R(reset_IBUF));
  CARRY4 \u_var_reg[27]_i_11 
       (.CI(\u_var_reg[23]_i_11_n_0 ),
        .CO({\u_var_reg[27]_i_11_n_0 ,\NLW_u_var_reg[27]_i_11_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({u_var2__1_n_99,u_var2__1_n_100,u_var2__1_n_101,u_var2__1_n_102}),
        .O({\u_var_reg[27]_i_11_n_4 ,\u_var_reg[27]_i_11_n_5 ,\u_var_reg[27]_i_11_n_6 ,\u_var_reg[27]_i_11_n_7 }),
        .S({\u_var[27]_i_13_n_0 ,\u_var[27]_i_14_n_0 ,\u_var[27]_i_15_n_0 ,\u_var[27]_i_16_n_0 }));
  CARRY4 \u_var_reg[27]_i_12 
       (.CI(\u_var_reg[23]_i_12_n_0 ),
        .CO({\u_var_reg[27]_i_12_n_0 ,\NLW_u_var_reg[27]_i_12_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({u_var1__1_n_99,u_var1__1_n_100,u_var1__1_n_101,u_var1__1_n_102}),
        .O({\u_var_reg[27]_i_12_n_4 ,\u_var_reg[27]_i_12_n_5 ,\u_var_reg[27]_i_12_n_6 ,\u_var_reg[27]_i_12_n_7 }),
        .S({\u_var[27]_i_17_n_0 ,\u_var[27]_i_18_n_0 ,\u_var[27]_i_19_n_0 ,\u_var[27]_i_20_n_0 }));
  CARRY4 \u_var_reg[27]_i_2 
       (.CI(\u_var_reg[23]_i_2_n_0 ),
        .CO({\u_var_reg[27]_i_2_n_0 ,\NLW_u_var_reg[27]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\u_var[27]_i_3_n_0 ,\u_var[27]_i_4_n_0 ,\u_var[27]_i_5_n_0 ,\u_var[27]_i_6_n_0 }),
        .O(u_var0[27:24]),
        .S({\u_var[27]_i_7_n_0 ,\u_var[27]_i_8_n_0 ,\u_var[27]_i_9_n_0 ,\u_var[27]_i_10_n_0 }));
  FDRE \u_var_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[28]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[28] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[29]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[29] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[2]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[2] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[30]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[30] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[31]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[31] ),
        .R(reset_IBUF));
  CARRY4 \u_var_reg[31]_i_10 
       (.CI(\u_var_reg[31]_i_12_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,u_var2__1_n_92,u_var2__1_n_93,u_var2__1_n_94}),
        .O({\u_var_reg[31]_i_10_n_4 ,\u_var_reg[31]_i_10_n_5 ,\u_var_reg[31]_i_10_n_6 ,\u_var_reg[31]_i_10_n_7 }),
        .S({\u_var[31]_i_14_n_0 ,\u_var[31]_i_15_n_0 ,\u_var[31]_i_16_n_0 ,\u_var[31]_i_17_n_0 }));
  CARRY4 \u_var_reg[31]_i_11 
       (.CI(\u_var_reg[31]_i_13_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,u_var1__1_n_92,u_var1__1_n_93,u_var1__1_n_94}),
        .O({\u_var_reg[31]_i_11_n_4 ,\u_var_reg[31]_i_11_n_5 ,\u_var_reg[31]_i_11_n_6 ,\u_var_reg[31]_i_11_n_7 }),
        .S({\u_var[31]_i_18_n_0 ,\u_var[31]_i_19_n_0 ,\u_var[31]_i_20_n_0 ,\u_var[31]_i_21_n_0 }));
  CARRY4 \u_var_reg[31]_i_12 
       (.CI(\u_var_reg[27]_i_11_n_0 ),
        .CO({\u_var_reg[31]_i_12_n_0 ,\NLW_u_var_reg[31]_i_12_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({u_var2__1_n_95,u_var2__1_n_96,u_var2__1_n_97,u_var2__1_n_98}),
        .O({\u_var_reg[31]_i_12_n_4 ,\u_var_reg[31]_i_12_n_5 ,\u_var_reg[31]_i_12_n_6 ,\u_var_reg[31]_i_12_n_7 }),
        .S({\u_var[31]_i_22_n_0 ,\u_var[31]_i_23_n_0 ,\u_var[31]_i_24_n_0 ,\u_var[31]_i_25_n_0 }));
  CARRY4 \u_var_reg[31]_i_13 
       (.CI(\u_var_reg[27]_i_12_n_0 ),
        .CO({\u_var_reg[31]_i_13_n_0 ,\NLW_u_var_reg[31]_i_13_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({u_var1__1_n_95,u_var1__1_n_96,u_var1__1_n_97,u_var1__1_n_98}),
        .O({\u_var_reg[31]_i_13_n_4 ,\u_var_reg[31]_i_13_n_5 ,\u_var_reg[31]_i_13_n_6 ,\u_var_reg[31]_i_13_n_7 }),
        .S({\u_var[31]_i_26_n_0 ,\u_var[31]_i_27_n_0 ,\u_var[31]_i_28_n_0 ,\u_var[31]_i_29_n_0 }));
  CARRY4 \u_var_reg[31]_i_2 
       (.CI(\u_var_reg[27]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\u_var[31]_i_3_n_0 ,\u_var[31]_i_4_n_0 ,\u_var[31]_i_5_n_0 }),
        .O(u_var0[31:28]),
        .S({\u_var[31]_i_6_n_0 ,\u_var[31]_i_7_n_0 ,\u_var[31]_i_8_n_0 ,\u_var[31]_i_9_n_0 }));
  FDRE \u_var_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[3]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[3] ),
        .R(reset_IBUF));
  CARRY4 \u_var_reg[3]_i_2 
       (.CI(\<const0> ),
        .CO({\u_var_reg[3]_i_2_n_0 ,\NLW_u_var_reg[3]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const1> ),
        .DI({\u_var[3]_i_3_n_0 ,\u_var[3]_i_4_n_0 ,\u_var[3]_i_5_n_0 ,\<const1> }),
        .O(u_var0[3:0]),
        .S({\u_var[3]_i_6_n_0 ,\u_var[3]_i_7_n_0 ,\u_var[3]_i_8_n_0 ,\u_var[3]_i_9_n_0 }));
  FDRE \u_var_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[4]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[4] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[5]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[5] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[6]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[6] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[7]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[7] ),
        .R(reset_IBUF));
  CARRY4 \u_var_reg[7]_i_2 
       (.CI(\u_var_reg[3]_i_2_n_0 ),
        .CO({\u_var_reg[7]_i_2_n_0 ,\NLW_u_var_reg[7]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\u_var[7]_i_3_n_0 ,\u_var[7]_i_4_n_0 ,\u_var[7]_i_5_n_0 ,\u_var[7]_i_6_n_0 }),
        .O(u_var0[7:4]),
        .S({\u_var[7]_i_7_n_0 ,\u_var[7]_i_8_n_0 ,\u_var[7]_i_9_n_0 ,\u_var[7]_i_10_n_0 }));
  FDRE \u_var_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[8]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[8] ),
        .R(reset_IBUF));
  FDRE \u_var_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\u_var[9]_i_1_n_0 ),
        .Q(\u_var_reg_n_0_[9] ),
        .R(reset_IBUF));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[0]_i_2 
       (.I0(DXport_IBUF[3]),
        .I1(looping),
        .O(\x_var[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[0]_i_3 
       (.I0(DXport_IBUF[2]),
        .I1(looping),
        .O(\x_var[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[0]_i_4 
       (.I0(DXport_IBUF[1]),
        .I1(looping),
        .O(\x_var[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[0]_i_5 
       (.I0(DXport_IBUF[0]),
        .I1(looping),
        .O(\x_var[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[0]_i_6 
       (.I0(DXport_IBUF[3]),
        .I1(Xinport_IBUF[3]),
        .I2(looping),
        .I3(x_var_reg[3]),
        .O(\x_var[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[0]_i_7 
       (.I0(DXport_IBUF[2]),
        .I1(Xinport_IBUF[2]),
        .I2(looping),
        .I3(x_var_reg[2]),
        .O(\x_var[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[0]_i_8 
       (.I0(DXport_IBUF[1]),
        .I1(Xinport_IBUF[1]),
        .I2(looping),
        .I3(x_var_reg[1]),
        .O(\x_var[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[0]_i_9 
       (.I0(DXport_IBUF[0]),
        .I1(Xinport_IBUF[0]),
        .I2(looping),
        .I3(x_var_reg[0]),
        .O(\x_var[0]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[12]_i_2 
       (.I0(DXport_IBUF[15]),
        .I1(looping),
        .O(\x_var[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[12]_i_3 
       (.I0(DXport_IBUF[14]),
        .I1(looping),
        .O(\x_var[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[12]_i_4 
       (.I0(DXport_IBUF[13]),
        .I1(looping),
        .O(\x_var[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[12]_i_5 
       (.I0(DXport_IBUF[12]),
        .I1(looping),
        .O(\x_var[12]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[12]_i_6 
       (.I0(DXport_IBUF[15]),
        .I1(Xinport_IBUF[15]),
        .I2(looping),
        .I3(x_var_reg[15]),
        .O(\x_var[12]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[12]_i_7 
       (.I0(DXport_IBUF[14]),
        .I1(Xinport_IBUF[14]),
        .I2(looping),
        .I3(x_var_reg[14]),
        .O(\x_var[12]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[12]_i_8 
       (.I0(DXport_IBUF[13]),
        .I1(Xinport_IBUF[13]),
        .I2(looping),
        .I3(x_var_reg[13]),
        .O(\x_var[12]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[12]_i_9 
       (.I0(DXport_IBUF[12]),
        .I1(Xinport_IBUF[12]),
        .I2(looping),
        .I3(x_var_reg[12]),
        .O(\x_var[12]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[16]_i_2 
       (.I0(DXport_IBUF[19]),
        .I1(looping),
        .O(\x_var[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[16]_i_3 
       (.I0(DXport_IBUF[18]),
        .I1(looping),
        .O(\x_var[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[16]_i_4 
       (.I0(DXport_IBUF[17]),
        .I1(looping),
        .O(\x_var[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[16]_i_5 
       (.I0(DXport_IBUF[16]),
        .I1(looping),
        .O(\x_var[16]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[16]_i_6 
       (.I0(DXport_IBUF[19]),
        .I1(Xinport_IBUF[19]),
        .I2(looping),
        .I3(x_var_reg[19]),
        .O(\x_var[16]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[16]_i_7 
       (.I0(DXport_IBUF[18]),
        .I1(Xinport_IBUF[18]),
        .I2(looping),
        .I3(x_var_reg[18]),
        .O(\x_var[16]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[16]_i_8 
       (.I0(DXport_IBUF[17]),
        .I1(Xinport_IBUF[17]),
        .I2(looping),
        .I3(x_var_reg[17]),
        .O(\x_var[16]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[16]_i_9 
       (.I0(DXport_IBUF[16]),
        .I1(Xinport_IBUF[16]),
        .I2(looping),
        .I3(x_var_reg[16]),
        .O(\x_var[16]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[20]_i_2 
       (.I0(DXport_IBUF[23]),
        .I1(looping),
        .O(\x_var[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[20]_i_3 
       (.I0(DXport_IBUF[22]),
        .I1(looping),
        .O(\x_var[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[20]_i_4 
       (.I0(DXport_IBUF[21]),
        .I1(looping),
        .O(\x_var[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[20]_i_5 
       (.I0(DXport_IBUF[20]),
        .I1(looping),
        .O(\x_var[20]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[20]_i_6 
       (.I0(DXport_IBUF[23]),
        .I1(Xinport_IBUF[23]),
        .I2(looping),
        .I3(x_var_reg[23]),
        .O(\x_var[20]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[20]_i_7 
       (.I0(DXport_IBUF[22]),
        .I1(Xinport_IBUF[22]),
        .I2(looping),
        .I3(x_var_reg[22]),
        .O(\x_var[20]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[20]_i_8 
       (.I0(DXport_IBUF[21]),
        .I1(Xinport_IBUF[21]),
        .I2(looping),
        .I3(x_var_reg[21]),
        .O(\x_var[20]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[20]_i_9 
       (.I0(DXport_IBUF[20]),
        .I1(Xinport_IBUF[20]),
        .I2(looping),
        .I3(x_var_reg[20]),
        .O(\x_var[20]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[24]_i_2 
       (.I0(DXport_IBUF[27]),
        .I1(looping),
        .O(\x_var[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[24]_i_3 
       (.I0(DXport_IBUF[26]),
        .I1(looping),
        .O(\x_var[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[24]_i_4 
       (.I0(DXport_IBUF[25]),
        .I1(looping),
        .O(\x_var[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[24]_i_5 
       (.I0(DXport_IBUF[24]),
        .I1(looping),
        .O(\x_var[24]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[24]_i_6 
       (.I0(DXport_IBUF[27]),
        .I1(Xinport_IBUF[27]),
        .I2(looping),
        .I3(x_var_reg[27]),
        .O(\x_var[24]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[24]_i_7 
       (.I0(DXport_IBUF[26]),
        .I1(Xinport_IBUF[26]),
        .I2(looping),
        .I3(x_var_reg[26]),
        .O(\x_var[24]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[24]_i_8 
       (.I0(DXport_IBUF[25]),
        .I1(Xinport_IBUF[25]),
        .I2(looping),
        .I3(x_var_reg[25]),
        .O(\x_var[24]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[24]_i_9 
       (.I0(DXport_IBUF[24]),
        .I1(Xinport_IBUF[24]),
        .I2(looping),
        .I3(x_var_reg[24]),
        .O(\x_var[24]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[28]_i_2 
       (.I0(DXport_IBUF[30]),
        .I1(looping),
        .O(\x_var[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[28]_i_3 
       (.I0(DXport_IBUF[29]),
        .I1(looping),
        .O(\x_var[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[28]_i_4 
       (.I0(DXport_IBUF[28]),
        .I1(looping),
        .O(\x_var[28]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[28]_i_5 
       (.I0(DXport_IBUF[31]),
        .I1(Xinport_IBUF[31]),
        .I2(looping),
        .I3(x_var_reg[31]),
        .O(\x_var[28]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[28]_i_6 
       (.I0(DXport_IBUF[30]),
        .I1(Xinport_IBUF[30]),
        .I2(looping),
        .I3(x_var_reg[30]),
        .O(\x_var[28]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[28]_i_7 
       (.I0(DXport_IBUF[29]),
        .I1(Xinport_IBUF[29]),
        .I2(looping),
        .I3(x_var_reg[29]),
        .O(\x_var[28]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[28]_i_8 
       (.I0(DXport_IBUF[28]),
        .I1(Xinport_IBUF[28]),
        .I2(looping),
        .I3(x_var_reg[28]),
        .O(\x_var[28]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[4]_i_2 
       (.I0(DXport_IBUF[7]),
        .I1(looping),
        .O(\x_var[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[4]_i_3 
       (.I0(DXport_IBUF[6]),
        .I1(looping),
        .O(\x_var[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[4]_i_4 
       (.I0(DXport_IBUF[5]),
        .I1(looping),
        .O(\x_var[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[4]_i_5 
       (.I0(DXport_IBUF[4]),
        .I1(looping),
        .O(\x_var[4]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[4]_i_6 
       (.I0(DXport_IBUF[7]),
        .I1(Xinport_IBUF[7]),
        .I2(looping),
        .I3(x_var_reg[7]),
        .O(\x_var[4]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[4]_i_7 
       (.I0(DXport_IBUF[6]),
        .I1(Xinport_IBUF[6]),
        .I2(looping),
        .I3(x_var_reg[6]),
        .O(\x_var[4]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[4]_i_8 
       (.I0(DXport_IBUF[5]),
        .I1(Xinport_IBUF[5]),
        .I2(looping),
        .I3(x_var_reg[5]),
        .O(\x_var[4]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[4]_i_9 
       (.I0(DXport_IBUF[4]),
        .I1(Xinport_IBUF[4]),
        .I2(looping),
        .I3(x_var_reg[4]),
        .O(\x_var[4]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[8]_i_2 
       (.I0(DXport_IBUF[11]),
        .I1(looping),
        .O(\x_var[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[8]_i_3 
       (.I0(DXport_IBUF[10]),
        .I1(looping),
        .O(\x_var[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[8]_i_4 
       (.I0(DXport_IBUF[9]),
        .I1(looping),
        .O(\x_var[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \x_var[8]_i_5 
       (.I0(DXport_IBUF[8]),
        .I1(looping),
        .O(\x_var[8]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[8]_i_6 
       (.I0(DXport_IBUF[11]),
        .I1(Xinport_IBUF[11]),
        .I2(looping),
        .I3(x_var_reg[11]),
        .O(\x_var[8]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[8]_i_7 
       (.I0(DXport_IBUF[10]),
        .I1(Xinport_IBUF[10]),
        .I2(looping),
        .I3(x_var_reg[10]),
        .O(\x_var[8]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[8]_i_8 
       (.I0(DXport_IBUF[9]),
        .I1(Xinport_IBUF[9]),
        .I2(looping),
        .I3(x_var_reg[9]),
        .O(\x_var[8]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \x_var[8]_i_9 
       (.I0(DXport_IBUF[8]),
        .I1(Xinport_IBUF[8]),
        .I2(looping),
        .I3(x_var_reg[8]),
        .O(\x_var[8]_i_9_n_0 ));
  FDRE \x_var_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[0]_i_1_n_7 ),
        .Q(x_var_reg[0]),
        .R(reset_IBUF));
  CARRY4 \x_var_reg[0]_i_1 
       (.CI(\<const0> ),
        .CO({\x_var_reg[0]_i_1_n_0 ,\NLW_x_var_reg[0]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\x_var[0]_i_2_n_0 ,\x_var[0]_i_3_n_0 ,\x_var[0]_i_4_n_0 ,\x_var[0]_i_5_n_0 }),
        .O({\x_var_reg[0]_i_1_n_4 ,\x_var_reg[0]_i_1_n_5 ,\x_var_reg[0]_i_1_n_6 ,\x_var_reg[0]_i_1_n_7 }),
        .S({\x_var[0]_i_6_n_0 ,\x_var[0]_i_7_n_0 ,\x_var[0]_i_8_n_0 ,\x_var[0]_i_9_n_0 }));
  FDRE \x_var_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[8]_i_1_n_5 ),
        .Q(x_var_reg[10]),
        .R(reset_IBUF));
  FDRE \x_var_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[8]_i_1_n_4 ),
        .Q(x_var_reg[11]),
        .R(reset_IBUF));
  FDRE \x_var_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[12]_i_1_n_7 ),
        .Q(x_var_reg[12]),
        .R(reset_IBUF));
  CARRY4 \x_var_reg[12]_i_1 
       (.CI(\x_var_reg[8]_i_1_n_0 ),
        .CO({\x_var_reg[12]_i_1_n_0 ,\NLW_x_var_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\x_var[12]_i_2_n_0 ,\x_var[12]_i_3_n_0 ,\x_var[12]_i_4_n_0 ,\x_var[12]_i_5_n_0 }),
        .O({\x_var_reg[12]_i_1_n_4 ,\x_var_reg[12]_i_1_n_5 ,\x_var_reg[12]_i_1_n_6 ,\x_var_reg[12]_i_1_n_7 }),
        .S({\x_var[12]_i_6_n_0 ,\x_var[12]_i_7_n_0 ,\x_var[12]_i_8_n_0 ,\x_var[12]_i_9_n_0 }));
  FDRE \x_var_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[12]_i_1_n_6 ),
        .Q(x_var_reg[13]),
        .R(reset_IBUF));
  FDRE \x_var_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[12]_i_1_n_5 ),
        .Q(x_var_reg[14]),
        .R(reset_IBUF));
  FDRE \x_var_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[12]_i_1_n_4 ),
        .Q(x_var_reg[15]),
        .R(reset_IBUF));
  FDRE \x_var_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[16]_i_1_n_7 ),
        .Q(x_var_reg[16]),
        .R(reset_IBUF));
  CARRY4 \x_var_reg[16]_i_1 
       (.CI(\x_var_reg[12]_i_1_n_0 ),
        .CO({\x_var_reg[16]_i_1_n_0 ,\NLW_x_var_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\x_var[16]_i_2_n_0 ,\x_var[16]_i_3_n_0 ,\x_var[16]_i_4_n_0 ,\x_var[16]_i_5_n_0 }),
        .O({\x_var_reg[16]_i_1_n_4 ,\x_var_reg[16]_i_1_n_5 ,\x_var_reg[16]_i_1_n_6 ,\x_var_reg[16]_i_1_n_7 }),
        .S({\x_var[16]_i_6_n_0 ,\x_var[16]_i_7_n_0 ,\x_var[16]_i_8_n_0 ,\x_var[16]_i_9_n_0 }));
  FDRE \x_var_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[16]_i_1_n_6 ),
        .Q(x_var_reg[17]),
        .R(reset_IBUF));
  FDRE \x_var_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[16]_i_1_n_5 ),
        .Q(x_var_reg[18]),
        .R(reset_IBUF));
  FDRE \x_var_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[16]_i_1_n_4 ),
        .Q(x_var_reg[19]),
        .R(reset_IBUF));
  FDRE \x_var_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[0]_i_1_n_6 ),
        .Q(x_var_reg[1]),
        .R(reset_IBUF));
  FDRE \x_var_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[20]_i_1_n_7 ),
        .Q(x_var_reg[20]),
        .R(reset_IBUF));
  CARRY4 \x_var_reg[20]_i_1 
       (.CI(\x_var_reg[16]_i_1_n_0 ),
        .CO({\x_var_reg[20]_i_1_n_0 ,\NLW_x_var_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\x_var[20]_i_2_n_0 ,\x_var[20]_i_3_n_0 ,\x_var[20]_i_4_n_0 ,\x_var[20]_i_5_n_0 }),
        .O({\x_var_reg[20]_i_1_n_4 ,\x_var_reg[20]_i_1_n_5 ,\x_var_reg[20]_i_1_n_6 ,\x_var_reg[20]_i_1_n_7 }),
        .S({\x_var[20]_i_6_n_0 ,\x_var[20]_i_7_n_0 ,\x_var[20]_i_8_n_0 ,\x_var[20]_i_9_n_0 }));
  FDRE \x_var_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[20]_i_1_n_6 ),
        .Q(x_var_reg[21]),
        .R(reset_IBUF));
  FDRE \x_var_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[20]_i_1_n_5 ),
        .Q(x_var_reg[22]),
        .R(reset_IBUF));
  FDRE \x_var_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[20]_i_1_n_4 ),
        .Q(x_var_reg[23]),
        .R(reset_IBUF));
  FDRE \x_var_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[24]_i_1_n_7 ),
        .Q(x_var_reg[24]),
        .R(reset_IBUF));
  CARRY4 \x_var_reg[24]_i_1 
       (.CI(\x_var_reg[20]_i_1_n_0 ),
        .CO({\x_var_reg[24]_i_1_n_0 ,\NLW_x_var_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\x_var[24]_i_2_n_0 ,\x_var[24]_i_3_n_0 ,\x_var[24]_i_4_n_0 ,\x_var[24]_i_5_n_0 }),
        .O({\x_var_reg[24]_i_1_n_4 ,\x_var_reg[24]_i_1_n_5 ,\x_var_reg[24]_i_1_n_6 ,\x_var_reg[24]_i_1_n_7 }),
        .S({\x_var[24]_i_6_n_0 ,\x_var[24]_i_7_n_0 ,\x_var[24]_i_8_n_0 ,\x_var[24]_i_9_n_0 }));
  FDRE \x_var_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[24]_i_1_n_6 ),
        .Q(x_var_reg[25]),
        .R(reset_IBUF));
  FDRE \x_var_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[24]_i_1_n_5 ),
        .Q(x_var_reg[26]),
        .R(reset_IBUF));
  FDRE \x_var_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[24]_i_1_n_4 ),
        .Q(x_var_reg[27]),
        .R(reset_IBUF));
  FDRE \x_var_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[28]_i_1_n_7 ),
        .Q(x_var_reg[28]),
        .R(reset_IBUF));
  CARRY4 \x_var_reg[28]_i_1 
       (.CI(\x_var_reg[24]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\x_var[28]_i_2_n_0 ,\x_var[28]_i_3_n_0 ,\x_var[28]_i_4_n_0 }),
        .O({\x_var_reg[28]_i_1_n_4 ,\x_var_reg[28]_i_1_n_5 ,\x_var_reg[28]_i_1_n_6 ,\x_var_reg[28]_i_1_n_7 }),
        .S({\x_var[28]_i_5_n_0 ,\x_var[28]_i_6_n_0 ,\x_var[28]_i_7_n_0 ,\x_var[28]_i_8_n_0 }));
  FDRE \x_var_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[28]_i_1_n_6 ),
        .Q(x_var_reg[29]),
        .R(reset_IBUF));
  FDRE \x_var_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[0]_i_1_n_5 ),
        .Q(x_var_reg[2]),
        .R(reset_IBUF));
  FDRE \x_var_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[28]_i_1_n_5 ),
        .Q(x_var_reg[30]),
        .R(reset_IBUF));
  FDRE \x_var_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[28]_i_1_n_4 ),
        .Q(x_var_reg[31]),
        .R(reset_IBUF));
  FDRE \x_var_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[0]_i_1_n_4 ),
        .Q(x_var_reg[3]),
        .R(reset_IBUF));
  FDRE \x_var_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[4]_i_1_n_7 ),
        .Q(x_var_reg[4]),
        .R(reset_IBUF));
  CARRY4 \x_var_reg[4]_i_1 
       (.CI(\x_var_reg[0]_i_1_n_0 ),
        .CO({\x_var_reg[4]_i_1_n_0 ,\NLW_x_var_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\x_var[4]_i_2_n_0 ,\x_var[4]_i_3_n_0 ,\x_var[4]_i_4_n_0 ,\x_var[4]_i_5_n_0 }),
        .O({\x_var_reg[4]_i_1_n_4 ,\x_var_reg[4]_i_1_n_5 ,\x_var_reg[4]_i_1_n_6 ,\x_var_reg[4]_i_1_n_7 }),
        .S({\x_var[4]_i_6_n_0 ,\x_var[4]_i_7_n_0 ,\x_var[4]_i_8_n_0 ,\x_var[4]_i_9_n_0 }));
  FDRE \x_var_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[4]_i_1_n_6 ),
        .Q(x_var_reg[5]),
        .R(reset_IBUF));
  FDRE \x_var_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[4]_i_1_n_5 ),
        .Q(x_var_reg[6]),
        .R(reset_IBUF));
  FDRE \x_var_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[4]_i_1_n_4 ),
        .Q(x_var_reg[7]),
        .R(reset_IBUF));
  FDRE \x_var_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[8]_i_1_n_7 ),
        .Q(x_var_reg[8]),
        .R(reset_IBUF));
  CARRY4 \x_var_reg[8]_i_1 
       (.CI(\x_var_reg[4]_i_1_n_0 ),
        .CO({\x_var_reg[8]_i_1_n_0 ,\NLW_x_var_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\x_var[8]_i_2_n_0 ,\x_var[8]_i_3_n_0 ,\x_var[8]_i_4_n_0 ,\x_var[8]_i_5_n_0 }),
        .O({\x_var_reg[8]_i_1_n_4 ,\x_var_reg[8]_i_1_n_5 ,\x_var_reg[8]_i_1_n_6 ,\x_var_reg[8]_i_1_n_7 }),
        .S({\x_var[8]_i_6_n_0 ,\x_var[8]_i_7_n_0 ,\x_var[8]_i_8_n_0 ,\x_var[8]_i_9_n_0 }));
  FDRE \x_var_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\x_var_reg[8]_i_1_n_6 ),
        .Q(x_var_reg[9]),
        .R(reset_IBUF));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[0]_i_2 
       (.I0(temp__0_n_102),
        .I1(looping),
        .O(\y_var[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[0]_i_3 
       (.I0(temp__0_n_103),
        .I1(looping),
        .O(\y_var[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[0]_i_4 
       (.I0(temp__0_n_104),
        .I1(looping),
        .O(\y_var[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[0]_i_5 
       (.I0(temp__0_n_105),
        .I1(looping),
        .O(\y_var[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[0]_i_6 
       (.I0(temp__0_n_102),
        .I1(Yinport_IBUF[3]),
        .I2(looping),
        .I3(y_var_reg[3]),
        .O(\y_var[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[0]_i_7 
       (.I0(temp__0_n_103),
        .I1(Yinport_IBUF[2]),
        .I2(looping),
        .I3(y_var_reg[2]),
        .O(\y_var[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[0]_i_8 
       (.I0(temp__0_n_104),
        .I1(Yinport_IBUF[1]),
        .I2(looping),
        .I3(y_var_reg[1]),
        .O(\y_var[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[0]_i_9 
       (.I0(temp__0_n_105),
        .I1(Yinport_IBUF[0]),
        .I2(looping),
        .I3(y_var_reg[0]),
        .O(\y_var[0]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[12]_i_2 
       (.I0(temp__0_n_90),
        .I1(looping),
        .O(\y_var[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[12]_i_3 
       (.I0(temp__0_n_91),
        .I1(looping),
        .O(\y_var[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[12]_i_4 
       (.I0(temp__0_n_92),
        .I1(looping),
        .O(\y_var[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[12]_i_5 
       (.I0(temp__0_n_93),
        .I1(looping),
        .O(\y_var[12]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[12]_i_6 
       (.I0(temp__0_n_90),
        .I1(Yinport_IBUF[15]),
        .I2(looping),
        .I3(y_var_reg[15]),
        .O(\y_var[12]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[12]_i_7 
       (.I0(temp__0_n_91),
        .I1(Yinport_IBUF[14]),
        .I2(looping),
        .I3(y_var_reg[14]),
        .O(\y_var[12]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[12]_i_8 
       (.I0(temp__0_n_92),
        .I1(Yinport_IBUF[13]),
        .I2(looping),
        .I3(y_var_reg[13]),
        .O(\y_var[12]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[12]_i_9 
       (.I0(temp__0_n_93),
        .I1(Yinport_IBUF[12]),
        .I2(looping),
        .I3(y_var_reg[12]),
        .O(\y_var[12]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[16]_i_2 
       (.I0(B[19]),
        .I1(looping),
        .O(\y_var[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[16]_i_3 
       (.I0(B[18]),
        .I1(looping),
        .O(\y_var[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[16]_i_4 
       (.I0(B[17]),
        .I1(looping),
        .O(\y_var[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[16]_i_5 
       (.I0(B[16]),
        .I1(looping),
        .O(\y_var[16]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[16]_i_6 
       (.I0(B[19]),
        .I1(Yinport_IBUF[19]),
        .I2(looping),
        .I3(y_var_reg[19]),
        .O(\y_var[16]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[16]_i_7 
       (.I0(B[18]),
        .I1(Yinport_IBUF[18]),
        .I2(looping),
        .I3(y_var_reg[18]),
        .O(\y_var[16]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[16]_i_8 
       (.I0(B[17]),
        .I1(Yinport_IBUF[17]),
        .I2(looping),
        .I3(y_var_reg[17]),
        .O(\y_var[16]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[16]_i_9 
       (.I0(B[16]),
        .I1(Yinport_IBUF[16]),
        .I2(looping),
        .I3(y_var_reg[16]),
        .O(\y_var[16]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[20]_i_2 
       (.I0(B[23]),
        .I1(looping),
        .O(\y_var[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[20]_i_3 
       (.I0(B[22]),
        .I1(looping),
        .O(\y_var[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[20]_i_4 
       (.I0(B[21]),
        .I1(looping),
        .O(\y_var[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[20]_i_5 
       (.I0(B[20]),
        .I1(looping),
        .O(\y_var[20]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[20]_i_6 
       (.I0(B[23]),
        .I1(Yinport_IBUF[23]),
        .I2(looping),
        .I3(y_var_reg[23]),
        .O(\y_var[20]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[20]_i_7 
       (.I0(B[22]),
        .I1(Yinport_IBUF[22]),
        .I2(looping),
        .I3(y_var_reg[22]),
        .O(\y_var[20]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[20]_i_8 
       (.I0(B[21]),
        .I1(Yinport_IBUF[21]),
        .I2(looping),
        .I3(y_var_reg[21]),
        .O(\y_var[20]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[20]_i_9 
       (.I0(B[20]),
        .I1(Yinport_IBUF[20]),
        .I2(looping),
        .I3(y_var_reg[20]),
        .O(\y_var[20]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[24]_i_2 
       (.I0(B[27]),
        .I1(looping_reg_rep_n_0),
        .O(\y_var[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[24]_i_3 
       (.I0(B[26]),
        .I1(looping_reg_rep_n_0),
        .O(\y_var[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[24]_i_4 
       (.I0(B[25]),
        .I1(looping_reg_rep_n_0),
        .O(\y_var[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[24]_i_5 
       (.I0(B[24]),
        .I1(looping_reg_rep_n_0),
        .O(\y_var[24]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[24]_i_6 
       (.I0(B[27]),
        .I1(Yinport_IBUF[27]),
        .I2(looping_reg_rep_n_0),
        .I3(y_var_reg[27]),
        .O(\y_var[24]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[24]_i_7 
       (.I0(B[26]),
        .I1(Yinport_IBUF[26]),
        .I2(looping_reg_rep_n_0),
        .I3(y_var_reg[26]),
        .O(\y_var[24]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[24]_i_8 
       (.I0(B[25]),
        .I1(Yinport_IBUF[25]),
        .I2(looping_reg_rep_n_0),
        .I3(y_var_reg[25]),
        .O(\y_var[24]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[24]_i_9 
       (.I0(B[24]),
        .I1(Yinport_IBUF[24]),
        .I2(looping_reg_rep_n_0),
        .I3(y_var_reg[24]),
        .O(\y_var[24]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[28]_i_2 
       (.I0(B[30]),
        .I1(looping_reg_rep_n_0),
        .O(\y_var[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[28]_i_3 
       (.I0(B[29]),
        .I1(looping_reg_rep_n_0),
        .O(\y_var[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[28]_i_4 
       (.I0(B[28]),
        .I1(looping_reg_rep_n_0),
        .O(\y_var[28]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[28]_i_5 
       (.I0(B[31]),
        .I1(Yinport_IBUF[31]),
        .I2(looping_reg_rep_n_0),
        .I3(y_var_reg[31]),
        .O(\y_var[28]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[28]_i_6 
       (.I0(B[30]),
        .I1(Yinport_IBUF[30]),
        .I2(looping_reg_rep_n_0),
        .I3(y_var_reg[30]),
        .O(\y_var[28]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[28]_i_7 
       (.I0(B[29]),
        .I1(Yinport_IBUF[29]),
        .I2(looping_reg_rep_n_0),
        .I3(y_var_reg[29]),
        .O(\y_var[28]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[28]_i_8 
       (.I0(B[28]),
        .I1(Yinport_IBUF[28]),
        .I2(looping_reg_rep_n_0),
        .I3(y_var_reg[28]),
        .O(\y_var[28]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[4]_i_2 
       (.I0(temp__0_n_98),
        .I1(looping),
        .O(\y_var[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[4]_i_3 
       (.I0(temp__0_n_99),
        .I1(looping),
        .O(\y_var[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[4]_i_4 
       (.I0(temp__0_n_100),
        .I1(looping),
        .O(\y_var[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[4]_i_5 
       (.I0(temp__0_n_101),
        .I1(looping),
        .O(\y_var[4]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[4]_i_6 
       (.I0(temp__0_n_98),
        .I1(Yinport_IBUF[7]),
        .I2(looping),
        .I3(y_var_reg[7]),
        .O(\y_var[4]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[4]_i_7 
       (.I0(temp__0_n_99),
        .I1(Yinport_IBUF[6]),
        .I2(looping),
        .I3(y_var_reg[6]),
        .O(\y_var[4]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[4]_i_8 
       (.I0(temp__0_n_100),
        .I1(Yinport_IBUF[5]),
        .I2(looping),
        .I3(y_var_reg[5]),
        .O(\y_var[4]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[4]_i_9 
       (.I0(temp__0_n_101),
        .I1(Yinport_IBUF[4]),
        .I2(looping),
        .I3(y_var_reg[4]),
        .O(\y_var[4]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[8]_i_2 
       (.I0(temp__0_n_94),
        .I1(looping),
        .O(\y_var[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[8]_i_3 
       (.I0(temp__0_n_95),
        .I1(looping),
        .O(\y_var[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[8]_i_4 
       (.I0(temp__0_n_96),
        .I1(looping),
        .O(\y_var[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \y_var[8]_i_5 
       (.I0(temp__0_n_97),
        .I1(looping),
        .O(\y_var[8]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[8]_i_6 
       (.I0(temp__0_n_94),
        .I1(Yinport_IBUF[11]),
        .I2(looping),
        .I3(y_var_reg[11]),
        .O(\y_var[8]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[8]_i_7 
       (.I0(temp__0_n_95),
        .I1(Yinport_IBUF[10]),
        .I2(looping),
        .I3(y_var_reg[10]),
        .O(\y_var[8]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[8]_i_8 
       (.I0(temp__0_n_96),
        .I1(Yinport_IBUF[9]),
        .I2(looping),
        .I3(y_var_reg[9]),
        .O(\y_var[8]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h5CAC)) 
    \y_var[8]_i_9 
       (.I0(temp__0_n_97),
        .I1(Yinport_IBUF[8]),
        .I2(looping),
        .I3(y_var_reg[8]),
        .O(\y_var[8]_i_9_n_0 ));
  FDRE \y_var_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[0]_i_1_n_7 ),
        .Q(y_var_reg[0]),
        .R(reset_IBUF));
  CARRY4 \y_var_reg[0]_i_1 
       (.CI(\<const0> ),
        .CO({\y_var_reg[0]_i_1_n_0 ,\NLW_y_var_reg[0]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\y_var[0]_i_2_n_0 ,\y_var[0]_i_3_n_0 ,\y_var[0]_i_4_n_0 ,\y_var[0]_i_5_n_0 }),
        .O({\y_var_reg[0]_i_1_n_4 ,\y_var_reg[0]_i_1_n_5 ,\y_var_reg[0]_i_1_n_6 ,\y_var_reg[0]_i_1_n_7 }),
        .S({\y_var[0]_i_6_n_0 ,\y_var[0]_i_7_n_0 ,\y_var[0]_i_8_n_0 ,\y_var[0]_i_9_n_0 }));
  FDRE \y_var_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[8]_i_1_n_5 ),
        .Q(y_var_reg[10]),
        .R(reset_IBUF));
  FDRE \y_var_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[8]_i_1_n_4 ),
        .Q(y_var_reg[11]),
        .R(reset_IBUF));
  FDRE \y_var_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[12]_i_1_n_7 ),
        .Q(y_var_reg[12]),
        .R(reset_IBUF));
  CARRY4 \y_var_reg[12]_i_1 
       (.CI(\y_var_reg[8]_i_1_n_0 ),
        .CO({\y_var_reg[12]_i_1_n_0 ,\NLW_y_var_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\y_var[12]_i_2_n_0 ,\y_var[12]_i_3_n_0 ,\y_var[12]_i_4_n_0 ,\y_var[12]_i_5_n_0 }),
        .O({\y_var_reg[12]_i_1_n_4 ,\y_var_reg[12]_i_1_n_5 ,\y_var_reg[12]_i_1_n_6 ,\y_var_reg[12]_i_1_n_7 }),
        .S({\y_var[12]_i_6_n_0 ,\y_var[12]_i_7_n_0 ,\y_var[12]_i_8_n_0 ,\y_var[12]_i_9_n_0 }));
  FDRE \y_var_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[12]_i_1_n_6 ),
        .Q(y_var_reg[13]),
        .R(reset_IBUF));
  FDRE \y_var_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[12]_i_1_n_5 ),
        .Q(y_var_reg[14]),
        .R(reset_IBUF));
  FDRE \y_var_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[12]_i_1_n_4 ),
        .Q(y_var_reg[15]),
        .R(reset_IBUF));
  FDRE \y_var_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[16]_i_1_n_7 ),
        .Q(y_var_reg[16]),
        .R(reset_IBUF));
  CARRY4 \y_var_reg[16]_i_1 
       (.CI(\y_var_reg[12]_i_1_n_0 ),
        .CO({\y_var_reg[16]_i_1_n_0 ,\NLW_y_var_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\y_var[16]_i_2_n_0 ,\y_var[16]_i_3_n_0 ,\y_var[16]_i_4_n_0 ,\y_var[16]_i_5_n_0 }),
        .O({\y_var_reg[16]_i_1_n_4 ,\y_var_reg[16]_i_1_n_5 ,\y_var_reg[16]_i_1_n_6 ,\y_var_reg[16]_i_1_n_7 }),
        .S({\y_var[16]_i_6_n_0 ,\y_var[16]_i_7_n_0 ,\y_var[16]_i_8_n_0 ,\y_var[16]_i_9_n_0 }));
  FDRE \y_var_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[16]_i_1_n_6 ),
        .Q(y_var_reg[17]),
        .R(reset_IBUF));
  FDRE \y_var_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[16]_i_1_n_5 ),
        .Q(y_var_reg[18]),
        .R(reset_IBUF));
  FDRE \y_var_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[16]_i_1_n_4 ),
        .Q(y_var_reg[19]),
        .R(reset_IBUF));
  FDRE \y_var_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[0]_i_1_n_6 ),
        .Q(y_var_reg[1]),
        .R(reset_IBUF));
  FDRE \y_var_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[20]_i_1_n_7 ),
        .Q(y_var_reg[20]),
        .R(reset_IBUF));
  CARRY4 \y_var_reg[20]_i_1 
       (.CI(\y_var_reg[16]_i_1_n_0 ),
        .CO({\y_var_reg[20]_i_1_n_0 ,\NLW_y_var_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\y_var[20]_i_2_n_0 ,\y_var[20]_i_3_n_0 ,\y_var[20]_i_4_n_0 ,\y_var[20]_i_5_n_0 }),
        .O({\y_var_reg[20]_i_1_n_4 ,\y_var_reg[20]_i_1_n_5 ,\y_var_reg[20]_i_1_n_6 ,\y_var_reg[20]_i_1_n_7 }),
        .S({\y_var[20]_i_6_n_0 ,\y_var[20]_i_7_n_0 ,\y_var[20]_i_8_n_0 ,\y_var[20]_i_9_n_0 }));
  FDRE \y_var_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[20]_i_1_n_6 ),
        .Q(y_var_reg[21]),
        .R(reset_IBUF));
  FDRE \y_var_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[20]_i_1_n_5 ),
        .Q(y_var_reg[22]),
        .R(reset_IBUF));
  FDRE \y_var_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[20]_i_1_n_4 ),
        .Q(y_var_reg[23]),
        .R(reset_IBUF));
  FDRE \y_var_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[24]_i_1_n_7 ),
        .Q(y_var_reg[24]),
        .R(reset_IBUF));
  CARRY4 \y_var_reg[24]_i_1 
       (.CI(\y_var_reg[20]_i_1_n_0 ),
        .CO({\y_var_reg[24]_i_1_n_0 ,\NLW_y_var_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\y_var[24]_i_2_n_0 ,\y_var[24]_i_3_n_0 ,\y_var[24]_i_4_n_0 ,\y_var[24]_i_5_n_0 }),
        .O({\y_var_reg[24]_i_1_n_4 ,\y_var_reg[24]_i_1_n_5 ,\y_var_reg[24]_i_1_n_6 ,\y_var_reg[24]_i_1_n_7 }),
        .S({\y_var[24]_i_6_n_0 ,\y_var[24]_i_7_n_0 ,\y_var[24]_i_8_n_0 ,\y_var[24]_i_9_n_0 }));
  FDRE \y_var_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[24]_i_1_n_6 ),
        .Q(y_var_reg[25]),
        .R(reset_IBUF));
  FDRE \y_var_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[24]_i_1_n_5 ),
        .Q(y_var_reg[26]),
        .R(reset_IBUF));
  FDRE \y_var_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[24]_i_1_n_4 ),
        .Q(y_var_reg[27]),
        .R(reset_IBUF));
  FDRE \y_var_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[28]_i_1_n_7 ),
        .Q(y_var_reg[28]),
        .R(reset_IBUF));
  CARRY4 \y_var_reg[28]_i_1 
       (.CI(\y_var_reg[24]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\y_var[28]_i_2_n_0 ,\y_var[28]_i_3_n_0 ,\y_var[28]_i_4_n_0 }),
        .O({\y_var_reg[28]_i_1_n_4 ,\y_var_reg[28]_i_1_n_5 ,\y_var_reg[28]_i_1_n_6 ,\y_var_reg[28]_i_1_n_7 }),
        .S({\y_var[28]_i_5_n_0 ,\y_var[28]_i_6_n_0 ,\y_var[28]_i_7_n_0 ,\y_var[28]_i_8_n_0 }));
  FDRE \y_var_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[28]_i_1_n_6 ),
        .Q(y_var_reg[29]),
        .R(reset_IBUF));
  FDRE \y_var_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[0]_i_1_n_5 ),
        .Q(y_var_reg[2]),
        .R(reset_IBUF));
  FDRE \y_var_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[28]_i_1_n_5 ),
        .Q(y_var_reg[30]),
        .R(reset_IBUF));
  FDRE \y_var_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[28]_i_1_n_4 ),
        .Q(y_var_reg[31]),
        .R(reset_IBUF));
  FDRE \y_var_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[0]_i_1_n_4 ),
        .Q(y_var_reg[3]),
        .R(reset_IBUF));
  FDRE \y_var_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[4]_i_1_n_7 ),
        .Q(y_var_reg[4]),
        .R(reset_IBUF));
  CARRY4 \y_var_reg[4]_i_1 
       (.CI(\y_var_reg[0]_i_1_n_0 ),
        .CO({\y_var_reg[4]_i_1_n_0 ,\NLW_y_var_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\y_var[4]_i_2_n_0 ,\y_var[4]_i_3_n_0 ,\y_var[4]_i_4_n_0 ,\y_var[4]_i_5_n_0 }),
        .O({\y_var_reg[4]_i_1_n_4 ,\y_var_reg[4]_i_1_n_5 ,\y_var_reg[4]_i_1_n_6 ,\y_var_reg[4]_i_1_n_7 }),
        .S({\y_var[4]_i_6_n_0 ,\y_var[4]_i_7_n_0 ,\y_var[4]_i_8_n_0 ,\y_var[4]_i_9_n_0 }));
  FDRE \y_var_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[4]_i_1_n_6 ),
        .Q(y_var_reg[5]),
        .R(reset_IBUF));
  FDRE \y_var_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[4]_i_1_n_5 ),
        .Q(y_var_reg[6]),
        .R(reset_IBUF));
  FDRE \y_var_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[4]_i_1_n_4 ),
        .Q(y_var_reg[7]),
        .R(reset_IBUF));
  FDRE \y_var_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[8]_i_1_n_7 ),
        .Q(y_var_reg[8]),
        .R(reset_IBUF));
  CARRY4 \y_var_reg[8]_i_1 
       (.CI(\y_var_reg[4]_i_1_n_0 ),
        .CO({\y_var_reg[8]_i_1_n_0 ,\NLW_y_var_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\y_var[8]_i_2_n_0 ,\y_var[8]_i_3_n_0 ,\y_var[8]_i_4_n_0 ,\y_var[8]_i_5_n_0 }),
        .O({\y_var_reg[8]_i_1_n_4 ,\y_var_reg[8]_i_1_n_5 ,\y_var_reg[8]_i_1_n_6 ,\y_var_reg[8]_i_1_n_7 }),
        .S({\y_var[8]_i_6_n_0 ,\y_var[8]_i_7_n_0 ,\y_var[8]_i_8_n_0 ,\y_var[8]_i_9_n_0 }));
  FDRE \y_var_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(u_var2_i_1_n_0),
        .D(\y_var_reg[8]_i_1_n_6 ),
        .Q(y_var_reg[9]),
        .R(reset_IBUF));
endmodule
