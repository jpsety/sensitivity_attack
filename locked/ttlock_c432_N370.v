
// Generated by Cadence Genus(TM) Synthesis Solution 16.22-s033_1
// Generated on: Apr 20 2020 15:40:31 EDT (Apr 20 2020 19:40:31 UTC)

// Verification Directory fv/c432 

module DUT(in, out);
  input [35:0] in;
  output out;
  wire [35:0] in;
  wire out;
  wire N118, N119, N122, N123, N126, N127, N130, N131;
  wire N134, N135, N138, N139, N142, N143, N146, N147;
  wire N150, N151, N154, N157, N158, N159, N162, N165;
  wire N168, N171, N174, N177, N180, N183, N184, N185;
  wire N186, N187, N188, N189, N190, N191, N192, N193;
  wire N194, N195, N196, N197, N198, N199, N224, N227;
  wire N230, N233, N236, N239, N243, N247, N251, N260;
  wire N263, N264, N267, N270, N273, N276, N279, N282;
  wire N285, N288, N289, N290, N291, N292, N293, N294;
  wire N295, N296, N300, N301, N302, N303, N304, N305;
  wire N306, N307, N308, N330, N331, N332, N333, N335;
  wire N337, N339, N341, N343, N348, N349, N350, N351;
  wire N352, N353, N354, N355, N356, N357, n_11, n_21;
  wire n_44, n_45, n_46, n_47, n_48, n_49, n_50, n_51;
  wire n_52, n_53, n_54, n_55;
  nand NAND2_19 (N154, N118, in[1]);
  nand NAND2_22 (N159, N122, in[3]);
  nand NAND2_23 (N162, N126, in[5]);
  nand NAND2_24 (N165, N130, in[7]);
  nand NAND2_25 (N168, N134, in[9]);
  nand NAND2_26 (N171, N138, in[11]);
  nand NAND2_27 (N174, N142, in[13]);
  nand NAND2_28 (N177, N146, in[15]);
  nand NAND2_29 (N180, N150, in[17]);
  nand NAND2_68 (N260, N224, N157);
  nand NAND2_69 (N263, N224, N158);
  nand NAND2_70 (N264, N227, N183);
  nand NAND2_71 (N267, N230, N185);
  nand NAND2_72 (N270, N233, N187);
  nand NAND2_73 (N273, N236, N189);
  nand NAND2_74 (N276, N239, N191);
  nand NAND2_75 (N279, N243, N193);
  nand NAND2_76 (N282, N247, N195);
  nand NAND2_77 (N285, N251, N197);
  nand NAND2_78 (N288, N227, N184);
  nand NAND2_79 (N289, N230, N186);
  nand NAND2_80 (N290, N233, N188);
  nand NAND2_81 (N291, N236, N190);
  nand NAND2_82 (N292, N239, N192);
  nand NAND2_83 (N293, N243, N194);
  nand NAND2_84 (N294, N247, N196);
  nand NAND2_85 (N295, N251, N198);
  nand NAND2_117 (N348, N330, N300);
  nand NAND2_118 (N349, N331, N301);
  nand NAND2_119 (N350, N332, N302);
  nand NAND2_120 (N351, N333, N303);
  nand NAND2_121 (N352, N335, N304);
  nand NAND2_122 (N353, N337, N305);
  nand NAND2_123 (N354, N339, N306);
  nand NAND2_124 (N355, N341, N307);
  nand NAND2_125 (N356, N343, N308);
  nor NOR2_20 (N157, in[18], N119);
  nor NOR2_21 (N158, in[27], N119);
  nor NOR2_30 (N183, in[19], N123);
  nor NOR2_31 (N184, in[28], N123);
  nor NOR2_32 (N185, in[20], N127);
  nor NOR2_33 (N186, in[29], N127);
  nor NOR2_34 (N187, in[21], N131);
  nor NOR2_35 (N188, in[30], N131);
  nor NOR2_36 (N189, in[22], N135);
  nor NOR2_37 (N190, in[31], N135);
  nor NOR2_38 (N191, in[23], N139);
  nor NOR2_39 (N192, in[32], N139);
  nor NOR2_40 (N193, in[24], N143);
  nor NOR2_41 (N194, in[33], N143);
  nor NOR2_42 (N195, in[25], N147);
  nor NOR2_43 (N196, in[34], N147);
  nor NOR2_44 (N197, in[26], N151);
  nor NOR2_45 (N198, in[35], N151);
  not NOT1_1 (N118, in[0]);
  not NOT1_2 (N119, in[1]);
  not NOT1_3 (N122, in[2]);
  not NOT1_4 (N123, in[3]);
  not NOT1_5 (N126, in[4]);
  not NOT1_6 (N127, in[5]);
  not NOT1_7 (N130, in[6]);
  not NOT1_8 (N131, in[7]);
  not NOT1_9 (N134, in[8]);
  not NOT1_10 (N135, in[9]);
  not NOT1_11 (N138, in[10]);
  not NOT1_12 (N139, in[11]);
  not NOT1_13 (N142, in[12]);
  not NOT1_14 (N143, in[13]);
  not NOT1_15 (N146, in[14]);
  not NOT1_16 (N147, in[15]);
  not NOT1_17 (N150, in[16]);
  not NOT1_18 (N151, in[17]);
  not NOT1_47 (n_11, N199);
  not NOT1_87 (N300, N263);
  not NOT1_88 (N301, N288);
  not NOT1_89 (N302, N289);
  not NOT1_90 (N303, N290);
  not NOT1_91 (N304, N291);
  not NOT1_92 (N305, N292);
  not NOT1_93 (N306, N293);
  not NOT1_94 (N307, N294);
  not NOT1_95 (N308, N295);
  not NOT1_96 (n_21, N296);
  not NOT1_127 (out, N357);
  xor XOR2_50 (N224, n_11, N154);
  xor XOR2_51 (N227, n_11, N159);
  xor XOR2_52 (N230, n_11, N162);
  xor XOR2_53 (N233, n_11, N165);
  xor XOR2_54 (N236, n_11, N168);
  xor XOR2_55 (N239, n_11, N171);
  xor XOR2_57 (N243, n_11, N174);
  xor XOR2_59 (N247, n_11, N177);
  xor XOR2_61 (N251, n_11, N180);
  xor XOR2_99 (N330, n_21, N260);
  xor XOR2_100 (N331, n_21, N264);
  xor XOR2_101 (N332, n_21, N267);
  xor XOR2_102 (N333, n_21, N270);
  xor XOR2_104 (N335, n_21, N273);
  xor XOR2_106 (N337, n_21, N276);
  xor XOR2_108 (N339, n_21, N279);
  xor XOR2_110 (N341, n_21, N282);
  xor XOR2_112 (N343, n_21, N285);
  and g1 (n_44, N154, N159, N162);
  and g2 (n_45, N165, N168);
  and g3 (n_46, N171, N174);
  and g4 (n_47, N177, N180);
  and g5 (N199, n_44, n_45, n_46, n_47);
  and g6 (n_48, N260, N264, N267);
  and g7 (n_49, N270, N273);
  and g8 (n_50, N276, N279);
  and g9 (n_51, N282, N285);
  and g10 (N296, n_48, n_49, n_50, n_51);
  and g11 (n_52, N348, N349, N350);
  and g12 (n_53, N351, N352);
  and g13 (n_54, N353, N354);
  and g14 (n_55, N355, N356);
  and g15 (N357, n_52, n_53, n_54, n_55);
endmodule
