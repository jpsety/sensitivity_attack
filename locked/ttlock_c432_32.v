
// Generated by Cadence Genus(TM) Synthesis Solution 16.22-s033_1
// Generated on: Apr 20 2020 15:40:31 EDT (Apr 20 2020 19:40:31 UTC)

// Verification Directory fv/ttlock_wrapper_WKEY32_WINPUT36 

module DUTLock(other_in, protected_in, out);
  input [3:0] other_in;
  input [31:0] protected_in;
  output out;
  wire [3:0] other_in;
  wire [31:0] protected_in;
  wire out;
  wire f_out, \genblk1.dut_N118 , \genblk1.dut_N119 , \genblk1.dut_N122
       , \genblk1.dut_N123 , \genblk1.dut_N126 , \genblk1.dut_N127 ,
       \genblk1.dut_N130 ;
  wire \genblk1.dut_N131 , \genblk1.dut_N134 , \genblk1.dut_N135 ,
       \genblk1.dut_N138 , \genblk1.dut_N139 , \genblk1.dut_N142 ,
       \genblk1.dut_N143 , \genblk1.dut_N146 ;
  wire \genblk1.dut_N147 , \genblk1.dut_N150 , \genblk1.dut_N151 ,
       \genblk1.dut_N154 , \genblk1.dut_N157 , \genblk1.dut_N158 ,
       \genblk1.dut_N159 , \genblk1.dut_N162 ;
  wire \genblk1.dut_N165 , \genblk1.dut_N168 , \genblk1.dut_N171 ,
       \genblk1.dut_N174 , \genblk1.dut_N177 , \genblk1.dut_N180 ,
       \genblk1.dut_N183 , \genblk1.dut_N184 ;
  wire \genblk1.dut_N185 , \genblk1.dut_N186 , \genblk1.dut_N187 ,
       \genblk1.dut_N188 , \genblk1.dut_N189 , \genblk1.dut_N190 ,
       \genblk1.dut_N191 , \genblk1.dut_N192 ;
  wire \genblk1.dut_N193 , \genblk1.dut_N194 , \genblk1.dut_N195 ,
       \genblk1.dut_N196 , \genblk1.dut_N197 , \genblk1.dut_N198 ,
       \genblk1.dut_N199 , \genblk1.dut_N224 ;
  wire \genblk1.dut_N227 , \genblk1.dut_N230 , \genblk1.dut_N233 ,
       \genblk1.dut_N236 , \genblk1.dut_N239 , \genblk1.dut_N243 ,
       \genblk1.dut_N247 , \genblk1.dut_N251 ;
  wire \genblk1.dut_N260 , \genblk1.dut_N263 , \genblk1.dut_N264 ,
       \genblk1.dut_N267 , \genblk1.dut_N270 , \genblk1.dut_N273 ,
       \genblk1.dut_N276 , \genblk1.dut_N279 ;
  wire \genblk1.dut_N282 , \genblk1.dut_N285 , \genblk1.dut_N288 ,
       \genblk1.dut_N289 , \genblk1.dut_N290 , \genblk1.dut_N291 ,
       \genblk1.dut_N292 , \genblk1.dut_N293 ;
  wire \genblk1.dut_N294 , \genblk1.dut_N295 , \genblk1.dut_N296 ,
       \genblk1.dut_N300 , \genblk1.dut_N301 , \genblk1.dut_N302 ,
       \genblk1.dut_N303 , \genblk1.dut_N304 ;
  wire \genblk1.dut_N305 , \genblk1.dut_N306 , \genblk1.dut_N307 ,
       \genblk1.dut_N308 , \genblk1.dut_N330 , \genblk1.dut_N331 ,
       \genblk1.dut_N332 , \genblk1.dut_N333 ;
  wire \genblk1.dut_N335 , \genblk1.dut_N337 , \genblk1.dut_N339 ,
       \genblk1.dut_N341 , \genblk1.dut_N343 , \genblk1.dut_N348 ,
       \genblk1.dut_N349 , \genblk1.dut_N350 ;
  wire \genblk1.dut_N351 , \genblk1.dut_N352 , \genblk1.dut_N353 ,
       \genblk1.dut_N354 , \genblk1.dut_N355 , \genblk1.dut_N356 ,
       \genblk1.dut_N357 , \genblk1.dut_n_11 ;
  wire \genblk1.dut_n_21 , \genblk1.dut_n_44 , \genblk1.dut_n_45 ,
       \genblk1.dut_n_46 , \genblk1.dut_n_47 , \genblk1.dut_n_48 ,
       \genblk1.dut_n_49 , \genblk1.dut_n_50 ;
  wire \genblk1.dut_n_51 , \genblk1.dut_n_52 , \genblk1.dut_n_53 ,
       \genblk1.dut_n_54 , \genblk1.dut_n_55 , n_37, n_71, n_72;
  wire n_73, n_74, n_75, n_76, n_77, n_78, n_79, n_80;
  wire n_81, n_82, n_83, n_84, n_85, n_86, n_87, n_88;
  wire n_89, n_90, n_91, n_92, n_93, n_94, n_95, n_96;
  wire n_97, n_98, n_99, n_100, n_101, n_102, n_103, n_104;
  wire n_105, n_106, n_107, n_108, n_109, n_110, n_111, n_112;
  wire n_113;
  xor g1 (out, n_37, f_out);
  xnor g2 (n_71, protected_in[0], 1'b0);
  xnor g3 (n_72, protected_in[1], 1'b0);
  xnor g4 (n_73, protected_in[2], 1'b1);
  xnor g5 (n_74, protected_in[3], 1'b1);
  xnor g6 (n_75, protected_in[4], 1'b0);
  xnor g7 (n_76, protected_in[5], 1'b0);
  xnor g8 (n_77, protected_in[6], 1'b1);
  xnor g9 (n_78, protected_in[7], 1'b1);
  xnor g10 (n_79, protected_in[8], 1'b0);
  xnor g11 (n_80, protected_in[9], 1'b1);
  xnor g12 (n_81, protected_in[10], 1'b1);
  xnor g13 (n_82, protected_in[11], 1'b0);
  xnor g14 (n_83, protected_in[12], 1'b0);
  xnor g15 (n_84, protected_in[13], 1'b0);
  xnor g16 (n_85, protected_in[14], 1'b0);
  xnor g17 (n_86, protected_in[15], 1'b0);
  xnor g18 (n_87, protected_in[16], 1'b1);
  xnor g19 (n_88, protected_in[17], 1'b0);
  xnor g20 (n_89, protected_in[18], 1'b1);
  xnor g21 (n_90, protected_in[19], 1'b0);
  xnor g22 (n_91, protected_in[20], 1'b0);
  xnor g23 (n_92, protected_in[21], 1'b0);
  xnor g24 (n_93, protected_in[22], 1'b0);
  xnor g25 (n_94, protected_in[23], 1'b1);
  xnor g26 (n_95, protected_in[24], 1'b0);
  xnor g27 (n_96, protected_in[25], 1'b0);
  xnor g28 (n_97, protected_in[26], 1'b0);
  xnor g29 (n_98, protected_in[27], 1'b0);
  xnor g30 (n_99, protected_in[28], 1'b0);
  xnor g31 (n_100, protected_in[29], 1'b0);
  xnor g32 (n_101, protected_in[30], 1'b1);
  xnor g33 (n_102, protected_in[31], 1'b1);
  nand g34 (n_103, n_71, n_72, n_73, n_74);
  nand g35 (n_104, n_75, n_76, n_77, n_78);
  nand g36 (n_105, n_79, n_80, n_81, n_82);
  nand g37 (n_106, n_83, n_84, n_85, n_86);
  nand g38 (n_107, n_87, n_88, n_89, n_90);
  nand g39 (n_108, n_91, n_92, n_93, n_94);
  nand g40 (n_109, n_95, n_96, n_97, n_98);
  nand g41 (n_110, n_99, n_100, n_101, n_102);
  nor g42 (n_112, n_103, n_104, n_105, n_106);
  nor g43 (n_111, n_107, n_108, n_109, n_110);
  nand g44 (n_113, n_111, n_112);
  not g45 (n_37, n_113);
  nand \genblk1.dut_NAND2_19  (\genblk1.dut_N154 , \genblk1.dut_N118 ,
       protected_in[1]);
  nand \genblk1.dut_NAND2_22  (\genblk1.dut_N159 , \genblk1.dut_N122 ,
       protected_in[3]);
  nand \genblk1.dut_NAND2_23  (\genblk1.dut_N162 , \genblk1.dut_N126 ,
       protected_in[5]);
  nand \genblk1.dut_NAND2_24  (\genblk1.dut_N165 , \genblk1.dut_N130 ,
       protected_in[7]);
  nand \genblk1.dut_NAND2_25  (\genblk1.dut_N168 , \genblk1.dut_N134 ,
       protected_in[9]);
  nand \genblk1.dut_NAND2_26  (\genblk1.dut_N171 , \genblk1.dut_N138 ,
       protected_in[11]);
  nand \genblk1.dut_NAND2_27  (\genblk1.dut_N174 , \genblk1.dut_N142 ,
       protected_in[13]);
  nand \genblk1.dut_NAND2_28  (\genblk1.dut_N177 , \genblk1.dut_N146 ,
       protected_in[15]);
  nand \genblk1.dut_NAND2_29  (\genblk1.dut_N180 , \genblk1.dut_N150 ,
       protected_in[17]);
  nand \genblk1.dut_NAND2_68  (\genblk1.dut_N260 , \genblk1.dut_N224 ,
       \genblk1.dut_N157 );
  nand \genblk1.dut_NAND2_69  (\genblk1.dut_N263 , \genblk1.dut_N224 ,
       \genblk1.dut_N158 );
  nand \genblk1.dut_NAND2_70  (\genblk1.dut_N264 , \genblk1.dut_N227 ,
       \genblk1.dut_N183 );
  nand \genblk1.dut_NAND2_71  (\genblk1.dut_N267 , \genblk1.dut_N230 ,
       \genblk1.dut_N185 );
  nand \genblk1.dut_NAND2_72  (\genblk1.dut_N270 , \genblk1.dut_N233 ,
       \genblk1.dut_N187 );
  nand \genblk1.dut_NAND2_73  (\genblk1.dut_N273 , \genblk1.dut_N236 ,
       \genblk1.dut_N189 );
  nand \genblk1.dut_NAND2_74  (\genblk1.dut_N276 , \genblk1.dut_N239 ,
       \genblk1.dut_N191 );
  nand \genblk1.dut_NAND2_75  (\genblk1.dut_N279 , \genblk1.dut_N243 ,
       \genblk1.dut_N193 );
  nand \genblk1.dut_NAND2_76  (\genblk1.dut_N282 , \genblk1.dut_N247 ,
       \genblk1.dut_N195 );
  nand \genblk1.dut_NAND2_77  (\genblk1.dut_N285 , \genblk1.dut_N251 ,
       \genblk1.dut_N197 );
  nand \genblk1.dut_NAND2_78  (\genblk1.dut_N288 , \genblk1.dut_N227 ,
       \genblk1.dut_N184 );
  nand \genblk1.dut_NAND2_79  (\genblk1.dut_N289 , \genblk1.dut_N230 ,
       \genblk1.dut_N186 );
  nand \genblk1.dut_NAND2_80  (\genblk1.dut_N290 , \genblk1.dut_N233 ,
       \genblk1.dut_N188 );
  nand \genblk1.dut_NAND2_81  (\genblk1.dut_N291 , \genblk1.dut_N236 ,
       \genblk1.dut_N190 );
  nand \genblk1.dut_NAND2_82  (\genblk1.dut_N292 , \genblk1.dut_N239 ,
       \genblk1.dut_N192 );
  nand \genblk1.dut_NAND2_83  (\genblk1.dut_N293 , \genblk1.dut_N243 ,
       \genblk1.dut_N194 );
  nand \genblk1.dut_NAND2_84  (\genblk1.dut_N294 , \genblk1.dut_N247 ,
       \genblk1.dut_N196 );
  nand \genblk1.dut_NAND2_85  (\genblk1.dut_N295 , \genblk1.dut_N251 ,
       \genblk1.dut_N198 );
  nand \genblk1.dut_NAND2_117  (\genblk1.dut_N348 , \genblk1.dut_N330 ,
       \genblk1.dut_N300 );
  nand \genblk1.dut_NAND2_118  (\genblk1.dut_N349 , \genblk1.dut_N331 ,
       \genblk1.dut_N301 );
  nand \genblk1.dut_NAND2_119  (\genblk1.dut_N350 , \genblk1.dut_N332 ,
       \genblk1.dut_N302 );
  nand \genblk1.dut_NAND2_120  (\genblk1.dut_N351 , \genblk1.dut_N333 ,
       \genblk1.dut_N303 );
  nand \genblk1.dut_NAND2_121  (\genblk1.dut_N352 , \genblk1.dut_N335 ,
       \genblk1.dut_N304 );
  nand \genblk1.dut_NAND2_122  (\genblk1.dut_N353 , \genblk1.dut_N337 ,
       \genblk1.dut_N305 );
  nand \genblk1.dut_NAND2_123  (\genblk1.dut_N354 , \genblk1.dut_N339 ,
       \genblk1.dut_N306 );
  nand \genblk1.dut_NAND2_124  (\genblk1.dut_N355 , \genblk1.dut_N341 ,
       \genblk1.dut_N307 );
  nand \genblk1.dut_NAND2_125  (\genblk1.dut_N356 , \genblk1.dut_N343 ,
       \genblk1.dut_N308 );
  nor \genblk1.dut_NOR2_20  (\genblk1.dut_N157 , protected_in[18],
       \genblk1.dut_N119 );
  nor \genblk1.dut_NOR2_21  (\genblk1.dut_N158 , protected_in[27],
       \genblk1.dut_N119 );
  nor \genblk1.dut_NOR2_30  (\genblk1.dut_N183 , protected_in[19],
       \genblk1.dut_N123 );
  nor \genblk1.dut_NOR2_31  (\genblk1.dut_N184 , protected_in[28],
       \genblk1.dut_N123 );
  nor \genblk1.dut_NOR2_32  (\genblk1.dut_N185 , protected_in[20],
       \genblk1.dut_N127 );
  nor \genblk1.dut_NOR2_33  (\genblk1.dut_N186 , protected_in[29],
       \genblk1.dut_N127 );
  nor \genblk1.dut_NOR2_34  (\genblk1.dut_N187 , protected_in[21],
       \genblk1.dut_N131 );
  nor \genblk1.dut_NOR2_35  (\genblk1.dut_N188 , protected_in[30],
       \genblk1.dut_N131 );
  nor \genblk1.dut_NOR2_36  (\genblk1.dut_N189 , protected_in[22],
       \genblk1.dut_N135 );
  nor \genblk1.dut_NOR2_37  (\genblk1.dut_N190 , protected_in[31],
       \genblk1.dut_N135 );
  nor \genblk1.dut_NOR2_38  (\genblk1.dut_N191 , protected_in[23],
       \genblk1.dut_N139 );
  nor \genblk1.dut_NOR2_39  (\genblk1.dut_N192 , other_in[0],
       \genblk1.dut_N139 );
  nor \genblk1.dut_NOR2_40  (\genblk1.dut_N193 , protected_in[24],
       \genblk1.dut_N143 );
  nor \genblk1.dut_NOR2_41  (\genblk1.dut_N194 , other_in[1],
       \genblk1.dut_N143 );
  nor \genblk1.dut_NOR2_42  (\genblk1.dut_N195 , protected_in[25],
       \genblk1.dut_N147 );
  nor \genblk1.dut_NOR2_43  (\genblk1.dut_N196 , other_in[2],
       \genblk1.dut_N147 );
  nor \genblk1.dut_NOR2_44  (\genblk1.dut_N197 , protected_in[26],
       \genblk1.dut_N151 );
  nor \genblk1.dut_NOR2_45  (\genblk1.dut_N198 , other_in[3],
       \genblk1.dut_N151 );
  not \genblk1.dut_NOT1_1  (\genblk1.dut_N118 , protected_in[0]);
  not \genblk1.dut_NOT1_2  (\genblk1.dut_N119 , protected_in[1]);
  not \genblk1.dut_NOT1_3  (\genblk1.dut_N122 , protected_in[2]);
  not \genblk1.dut_NOT1_4  (\genblk1.dut_N123 , protected_in[3]);
  not \genblk1.dut_NOT1_5  (\genblk1.dut_N126 , protected_in[4]);
  not \genblk1.dut_NOT1_6  (\genblk1.dut_N127 , protected_in[5]);
  not \genblk1.dut_NOT1_7  (\genblk1.dut_N130 , protected_in[6]);
  not \genblk1.dut_NOT1_8  (\genblk1.dut_N131 , protected_in[7]);
  not \genblk1.dut_NOT1_9  (\genblk1.dut_N134 , protected_in[8]);
  not \genblk1.dut_NOT1_10  (\genblk1.dut_N135 , protected_in[9]);
  not \genblk1.dut_NOT1_11  (\genblk1.dut_N138 , protected_in[10]);
  not \genblk1.dut_NOT1_12  (\genblk1.dut_N139 , protected_in[11]);
  not \genblk1.dut_NOT1_13  (\genblk1.dut_N142 , protected_in[12]);
  not \genblk1.dut_NOT1_14  (\genblk1.dut_N143 , protected_in[13]);
  not \genblk1.dut_NOT1_15  (\genblk1.dut_N146 , protected_in[14]);
  not \genblk1.dut_NOT1_16  (\genblk1.dut_N147 , protected_in[15]);
  not \genblk1.dut_NOT1_17  (\genblk1.dut_N150 , protected_in[16]);
  not \genblk1.dut_NOT1_18  (\genblk1.dut_N151 , protected_in[17]);
  not \genblk1.dut_NOT1_47  (\genblk1.dut_n_11 , \genblk1.dut_N199 );
  not \genblk1.dut_NOT1_87  (\genblk1.dut_N300 , \genblk1.dut_N263 );
  not \genblk1.dut_NOT1_88  (\genblk1.dut_N301 , \genblk1.dut_N288 );
  not \genblk1.dut_NOT1_89  (\genblk1.dut_N302 , \genblk1.dut_N289 );
  not \genblk1.dut_NOT1_90  (\genblk1.dut_N303 , \genblk1.dut_N290 );
  not \genblk1.dut_NOT1_91  (\genblk1.dut_N304 , \genblk1.dut_N291 );
  not \genblk1.dut_NOT1_92  (\genblk1.dut_N305 , \genblk1.dut_N292 );
  not \genblk1.dut_NOT1_93  (\genblk1.dut_N306 , \genblk1.dut_N293 );
  not \genblk1.dut_NOT1_94  (\genblk1.dut_N307 , \genblk1.dut_N294 );
  not \genblk1.dut_NOT1_95  (\genblk1.dut_N308 , \genblk1.dut_N295 );
  not \genblk1.dut_NOT1_96  (\genblk1.dut_n_21 , \genblk1.dut_N296 );
  not \genblk1.dut_NOT1_127  (f_out, \genblk1.dut_N357 );
  xor \genblk1.dut_XOR2_50  (\genblk1.dut_N224 , \genblk1.dut_n_11 ,
       \genblk1.dut_N154 );
  xor \genblk1.dut_XOR2_51  (\genblk1.dut_N227 , \genblk1.dut_n_11 ,
       \genblk1.dut_N159 );
  xor \genblk1.dut_XOR2_52  (\genblk1.dut_N230 , \genblk1.dut_n_11 ,
       \genblk1.dut_N162 );
  xor \genblk1.dut_XOR2_53  (\genblk1.dut_N233 , \genblk1.dut_n_11 ,
       \genblk1.dut_N165 );
  xor \genblk1.dut_XOR2_54  (\genblk1.dut_N236 , \genblk1.dut_n_11 ,
       \genblk1.dut_N168 );
  xor \genblk1.dut_XOR2_55  (\genblk1.dut_N239 , \genblk1.dut_n_11 ,
       \genblk1.dut_N171 );
  xor \genblk1.dut_XOR2_57  (\genblk1.dut_N243 , \genblk1.dut_n_11 ,
       \genblk1.dut_N174 );
  xor \genblk1.dut_XOR2_59  (\genblk1.dut_N247 , \genblk1.dut_n_11 ,
       \genblk1.dut_N177 );
  xor \genblk1.dut_XOR2_61  (\genblk1.dut_N251 , \genblk1.dut_n_11 ,
       \genblk1.dut_N180 );
  xor \genblk1.dut_XOR2_99  (\genblk1.dut_N330 , \genblk1.dut_n_21 ,
       \genblk1.dut_N260 );
  xor \genblk1.dut_XOR2_100  (\genblk1.dut_N331 , \genblk1.dut_n_21 ,
       \genblk1.dut_N264 );
  xor \genblk1.dut_XOR2_101  (\genblk1.dut_N332 , \genblk1.dut_n_21 ,
       \genblk1.dut_N267 );
  xor \genblk1.dut_XOR2_102  (\genblk1.dut_N333 , \genblk1.dut_n_21 ,
       \genblk1.dut_N270 );
  xor \genblk1.dut_XOR2_104  (\genblk1.dut_N335 , \genblk1.dut_n_21 ,
       \genblk1.dut_N273 );
  xor \genblk1.dut_XOR2_106  (\genblk1.dut_N337 , \genblk1.dut_n_21 ,
       \genblk1.dut_N276 );
  xor \genblk1.dut_XOR2_108  (\genblk1.dut_N339 , \genblk1.dut_n_21 ,
       \genblk1.dut_N279 );
  xor \genblk1.dut_XOR2_110  (\genblk1.dut_N341 , \genblk1.dut_n_21 ,
       \genblk1.dut_N282 );
  xor \genblk1.dut_XOR2_112  (\genblk1.dut_N343 , \genblk1.dut_n_21 ,
       \genblk1.dut_N285 );
  and \genblk1.dut_g1  (\genblk1.dut_n_44 , \genblk1.dut_N154 ,
       \genblk1.dut_N159 , \genblk1.dut_N162 );
  and \genblk1.dut_g2  (\genblk1.dut_n_45 , \genblk1.dut_N165 ,
       \genblk1.dut_N168 );
  and \genblk1.dut_g3  (\genblk1.dut_n_46 , \genblk1.dut_N171 ,
       \genblk1.dut_N174 );
  and \genblk1.dut_g4  (\genblk1.dut_n_47 , \genblk1.dut_N177 ,
       \genblk1.dut_N180 );
  and \genblk1.dut_g5  (\genblk1.dut_N199 , \genblk1.dut_n_44 ,
       \genblk1.dut_n_45 , \genblk1.dut_n_46 , \genblk1.dut_n_47 );
  and \genblk1.dut_g6  (\genblk1.dut_n_48 , \genblk1.dut_N260 ,
       \genblk1.dut_N264 , \genblk1.dut_N267 );
  and \genblk1.dut_g7  (\genblk1.dut_n_49 , \genblk1.dut_N270 ,
       \genblk1.dut_N273 );
  and \genblk1.dut_g8  (\genblk1.dut_n_50 , \genblk1.dut_N276 ,
       \genblk1.dut_N279 );
  and \genblk1.dut_g9  (\genblk1.dut_n_51 , \genblk1.dut_N282 ,
       \genblk1.dut_N285 );
  and \genblk1.dut_g10  (\genblk1.dut_N296 , \genblk1.dut_n_48 ,
       \genblk1.dut_n_49 , \genblk1.dut_n_50 , \genblk1.dut_n_51 );
  and \genblk1.dut_g11  (\genblk1.dut_n_52 , \genblk1.dut_N348 ,
       \genblk1.dut_N349 , \genblk1.dut_N350 );
  and \genblk1.dut_g12  (\genblk1.dut_n_53 , \genblk1.dut_N351 ,
       \genblk1.dut_N352 );
  and \genblk1.dut_g13  (\genblk1.dut_n_54 , \genblk1.dut_N353 ,
       \genblk1.dut_N354 );
  and \genblk1.dut_g14  (\genblk1.dut_n_55 , \genblk1.dut_N355 ,
       \genblk1.dut_N356 );
  and \genblk1.dut_g15  (\genblk1.dut_N357 , \genblk1.dut_n_52 ,
       \genblk1.dut_n_53 , \genblk1.dut_n_54 , \genblk1.dut_n_55 );
endmodule

