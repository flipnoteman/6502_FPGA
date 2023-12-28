`timescale 1ns / 1ps

// References
// https://web.archive.org/web/20160304185423/http://visual6502.org/wiki/index.php?title=6507_Decode_ROM
// http://visual6502.org/JSSim/expert.html
// https://davidmjc.github.io/6502/bcd.svg 


module decode_rom(
        input rdy,
        input [7:0] IR,
        input [5:0] timing_sig, //active low
        output [129:0] pla
    );

    wire IR10;
    or(IR10, IR[1], IR[0]);   
     
    //                                                                                         INSTADDR G T T  InstName     Net
    nor(pla[0], ~IR[2], IR[5], IR[6], ~IR[7], IR10);                                        // 100XX1XX 3 X TA STY          #1601
    nor(pla[1], timing_sig[3], IR[3], IR[4], ~IR[5], ~IR[0]);                               // XXX100XX 1 3 T3 INDY A       #60
    nor(pla[2], timing_sig[2], IR[2], ~IR[3], ~IR[4], ~IR[0]);                              // XXX110XX 1 2 T2 ADY          #1512
    nor(pla[3], timing_sig[0], IR[2], ~IR[3], IR[4], IR[5], ~IR[7], IR10);                  // 1X0010XX 3 0 T0 INY DEY      #382
    nor(pla[4], timing_sig[0], IR[2], ~IR[3], ~IR[4], IR[5], IR[6], ~IR[7], IR10);          // 100110XX 3 0 T0 TYAA         #1173
    nor(pla[5], timing_sig[0], IR[4], IR[5], ~IR[6], ~IR[7], IR10);                         // 1100XXXX 3 0 T0 CPY INY      #1233
    nor(pla[6], IR[6], ~IR[7], IR10);                                                       // 10XXXXXX 2 X T* LDX STX         
    nor(pla[7], timing_sig[2], ~IR[2], ~IR[4]);                                             // XXX1X1XX X 2 T2 ANY X        #258
    nor(pla[8], timing_sig[2], IR[2], IR[3]);                                               // XXXX00XX X 2 T2 INDX         #84
    nor(pla[9], timing_sig[0], IR[2], ~IR[3], IR[4], IR[5], IR[6], ~IR[7], ~IR[1]);         // 100010XX 2 0 T0 TXA A        #1543
    nor(pla[10], timing_sig[0], IR[2], IR[3], IR[4], IR[5], ~IR[6], ~IR[7], ~IR[1]);        // 110000XX 2 0 T0 DEX          #76
    nor(pla[11], timing_sig[0], IR[4], ~IR[5], ~IR[6], IR[7], IR10);                        // 0110XXXX 3 0 T0 CPX INX      #1658
    nor(pla[12], IR[5], IR[6], ~IR[7], ~IR[1]);                                             // 100XXXXX 2 X TA STX    
    nor(pla[13], timing_sig[0], IR[2], ~IR[3], ~IR[4], IR[5], IR[6], ~IR[7], ~IR[1]);       // 100110XX 2 0 T0 TXS          #245
    nor(pla[14], timing_sig[0], ~IR[5], IR[6], ~IR[7], ~IR[1]);                             // 101XXXXX 2 0 T0 T/LDX        #985
    nor(pla[15], timing_sig[1], IR[2], ~IR[3], IR[4], IR[5], ~IR[6], ~IR[7], ~IR[1]);       // 110010XX 2 1 T1 DEX          #786
    nor(pla[16], timing_sig[1], IR[2], ~IR[3], IR[4], ~IR[5], ~IR[6], ~IR[7], IR10);        // 111010XX 3 1 T1 INX          #1664
    nor(pla[17], timing_sig[0], IR[2], ~IR[3], ~IR[4], ~IR[5], IR[6], ~IR[7], ~IR[1]);      // 101110XX 2 0 T0 TSX          #682
    nor(pla[18], timing_sig[1], IR[2], ~IR[3], IR[4], IR[5], IR[7], IR10);                  // 0X0010XX 3 1 T1 DEY INY      #1482
    nor(pla[19], timing_sig[0], ~IR[2], ~IR[5], IR[6], ~IR[7], IR10);                       // 101XX1XX 3 0 T0 LDY not#     #665
    nor(pla[20], timing_sig[0], IR[4], ~IR[5], IR[6], ~IR[7], IR10);                        // 1010XXXX 3 0 T0 T/LDY        #286
    nor(pla[21], timing_sig[0], IR[2], IR[3], IR[4], ~IR[5], IR[6], IR[7], IR10);           // 001000XX 3 0 T0 JSR          #271
    nor(pla[22], timing_sig[5], IR[2], IR[3], IR[4], IR[5], IR[6], IR[7], IR10);            // 000000XX 3 5 T5 BRK          #370
    nor(pla[23], timing_sig[0], IR[2], ~IR[3], IR[4], IR[5], IR[7], IR10);                  // 0X0010XX 3 0 T0 PHP/A        #552
    nor(pla[24], timing_sig[4], IR[2], IR[3], IR[4], ~IR[5], ~IR[6], IR[7], IR10);          // 011000XX 3 4 T4 RTS          #1612
    nor(pla[25], timing_sig[3], IR[2], ~IR[3], IR[4], ~IR[5], IR[7], IR10);                 // 1X0010XX 3 3 T3 PLP/A        #1487
    nor(pla[26], timing_sig[5], IR[2], IR[3], IR[4], IR[5], ~IR[6], IR[7], IR10);           // 010000XX 3 5 T5 RTI           #784
    nor(pla[27], timing_sig[2], IR[3]);                                                     // XXXX0XXX X 2 T2 ZP
    nor(pla[28], timing_sig[0]);                                                            // XXXXXXXX X 0 T0              #1273
    nor(pla[29], timing_sig[2], IR[2], IR[4], ~IR[5], IR[7], IR10);                         // 0X10X0XX 3 2 T2 BRK/RTP/JSR
    nor(pla[30], timing_sig[3], IR[4], ~IR[5], IR[7], IR10);                                // 0X10XXXX 3 3 T3 BRK/RTP/J
    nor(pla[31], timing_sig[4], IR[2], IR[3], IR[4], IR[6], IR[7], IR10);                   // 00X000XX 3 4 T4 BRK/JSR
    nor(pla[32], timing_sig[4], IR[2], IR[3], IR[4], IR[5], ~IR[6], IR[7], IR10);           // 010000XX 3 4 T4 RTIA         #1311
    nor(pla[33], timing_sig[3], IR[2], IR[3], IR[4], ~IR[0]);                               // XXX000XX 1 3 T3 INDX         #1428
    nor(pla[34], timing_sig[4], IR[2], IR[3], ~IR[4], ~IR[0]);                              // XXX100XX 1 4 T4 INDY         #492
    nor(pla[35], timing_sig[2], IR[2], IR[3], ~IR[4], ~IR[0]);                              // XXX100XX 1 2 T2 INDY         #1204
    nor(pla[36], timing_sig[3], ~IR[3], ~IR[4]);                                            // XXX11XXX X 3 T3 ADXY         #58
    nor(pla[37], ~IR[5], ~IR[6], IR[7], ~IR[1]);                                            // 011XXXXX 2 X T* ROR          #244
    nor(pla[38], timing_sig[2]);                                                            // XXXXXXXX X 2 T2              #788
    nor(pla[39], timing_sig[0], IR[5], ~IR[6], IR[7], ~IR[0]);                              // 010XXXXX 1 0 T0 EOR          #1623
    nor(pla[40], ~IR[2], ~IR[3], IR[4], ~IR[6], IR[7], IR10);                               // 01X011XX 3 X T* JMP             #764
    nor(pla[41], IR[2], ~IR[3], IR[4], ~IR[5], IR[7], IR10);                                // 0X1010XX 3 X T* PLP/A
    nor(pla[42], ~IR[5], ~IR[6], ~IR[7], ~IR[1]);                                           // 111XXXXX 2 X TM INC             #324
    nor(pla[43], timing_sig[2], IR[2], IR[3], IR[4], ~IR[5], IR[6], IR[7], IR10);           // 001000XX 3 2 T2 JSR          #712
    nor(pla[44], timing_sig[2], ~IR[2], ~IR[3], IR[4]);                                     // XXX011XX X 2 T2 ad
    nor(pla[45], IR[5], IR[6], IR[7], ~IR[0]);                                              // 000XXXXX 1 0 T0 ORA          #403
    nor(pla[46], timing_sig[3], ~IR[2], ~IR[3], IR[4], ~IR[6], IR[7], IR10);                // 01X011XX 3 3 T3 JMP          #1381
    nor(pla[47], IR[2], IR[3], IR[4], ~IR[6], IR[7], IR10);                                 // 01X000XX 3 X T* RTS/I         #857
    nor(pla[48], timing_sig[4], IR[2], IR[3], IR[4], ~IR[0]);                               // XXX000XX 1 4 T4 INDX         #1259
    nor(pla[49], timing_sig[0], IR[4], ~IR[6], ~IR[7], IR10);                               // 11X0XXXX 3 0 T0 CP/INX/Y     #1337
    nor(pla[50], timing_sig[3], IR[2], IR[3], ~IR[4], ~IR[0]);                              // XXX100XX 1 3 T3 INDY        #342
    nor(pla[51], timing_sig[0], IR[5], ~IR[6], ~IR[7], ~IR[0]);                             // 110XXXXX 1 0 T0 CMP          #1355
    nor(pla[52], timing_sig[5], IR[2], IR[3], IR[4], ~IR[5], IR[6], IR[7], IR10);           // 001000XX 3 5 T5 JSR A        #776
    nor(pla[53], timing_sig[0], ~IR[5], ~IR[6], ~IR[7], ~IR[0]);                            // 111XXXXX 1 0 T0 SBC          #787
    nor(pla[54], timing_sig[0], ~IR[5], ~IR[6], ~IR[0]);                                    // X11XXXXX 1 0 T0 ADC/SBC      #575
    nor(pla[55], ~IR[5], IR[6], IR[7], ~IR[1]);                                             // 001XXXXX 2 X T* ROL       #1466
    nor(pla[56], IR[6], IR[7], ~IR[1]);                                                     // 00XXXXXX 2 X TM ASL/ROL
    nor(pla[57], timing_sig[0], ~IR[2], IR[3], ~IR[4], IR[7], ~IR[1]);                      // 0XX010XX 2 0 T0 S/ROL/ROR
    nor(pla[58], timing_sig[0], IR[2], IR[4], ~IR[5], IR[7], IR10);                         // 0X10X0XX 3 0 T0 BRK/USR/PHL
    nor(pla[59], timing_sig[0], IR[2], ~IR[3], ~IR[4], IR[5], IR[6], ~IR[7], IR10);         // 100110XX 3 0 T0 TYA        #257
    nor(pla[60], timing_sig[1], IR[7], ~IR[0]);                                             // 0XXXXXXX 1 1 T1 AND/EOR/ORA/ADC #1243
    nor(pla[61], timing_sig[1], ~IR[5], ~IR[6], ~IR[0]);                                    // X11XXXXX 1 1 T1 ADC SBC A    #822
    nor(pla[62], timing_sig[1], IR[2], ~IR[3], IR[4], IR[7], ~IR[1]);                       // 0XX010XX 2 1 T1 S/ROL/ROR A #1665
    nor(pla[63], timing_sig[0], IR[2], ~IR[3], IR[4], IR[5], IR[6], ~IR[7], ~IR[1]);        // 100010XX 2 0 T0 TXA B        #179
    nor(pla[64], timing_sig[0], IR[2], ~IR[3], ~IR[5], ~IR[6], IR[7], IR10);                // 011X10XX 3 0 T0 PLA
    nor(pla[65], timing_sig[0], ~IR[5], IR[6], ~IR[7], ~IR[0]);                             // 101XXXXX 1 0 T0 LDA
    nor(pla[66], timing_sig[0], ~IR[0]);                                                    // XXXXXXXX 1 0 T0 GP1
    nor(pla[67], timing_sig[0], IR[2], ~IR[3], IR[4], ~IR[5], IR[6], ~IR[7], IR10);         // 101010XX 3 0 T0 TAY           #4
    nor(pla[68], timing_sig[0], IR[2], ~IR[3], IR[4], IR[5], IR[6], ~IR[7], ~IR[1]);        // 100010XX 2 0 T0 TAX
    nor(pla[69], timing_sig[0], ~IR[2], IR[4], ~IR[5], IR[6], IR[7], IR10);                 // 0010X1XX 3 0 T0 BIT
    nor(pla[70], timing_sig[0], ~IR[5], IR[6], IR[7], ~IR[0]);                              // 001XXXXX 1 0 T0 AND
    nor(pla[71], timing_sig[4], ~IR[3], ~IR[4]);                                            // XXX11XXX X 4 T4 ADXY
    nor(pla[72], timing_sig[5], IR[2], IR[3], ~IR[4], ~IR[0]);                              // XXX100XX 1 5 T5 INDY
    nor(pla[73], timing_sig[0], IR[2], IR[3], ~IR[4], IR10);                                // XXX100XX 3 0 T0 BR rdy
    nor(pla[74], timing_sig[2], IR[2], ~IR[3], IR[4], IR[5], IR[6], IR[7], IR10);           // 000010XX 3 2 T2 PSHA
    nor(pla[75], timing_sig[0], IR[2], ~IR[3], IR[4], ~IR[6], IR[7], ~IR[1]);               // 01X010XX 2 0 T0 LSR/ROR A
    nor(pla[76], ~IR[6], IR[7], ~IR[1]);                                                    // 01XXXXXX 2 X TM LSR/ROR
    nor(pla[77], timing_sig[2], IR[2], IR[3], IR[4], IR[5], IR[6], IR[7], IR10);            // 000000XX 3 2 T2 BRK
    nor(pla[78], timing_sig[3], IR[2], IR[3], IR[4], ~IR[5], IR[6], IR[7], IR10);           // 001000XX 3 3 T3 JSR
    nor(pla[79], IR[5], IR[6], IR[7], ~IR[0]);                                              // 000XXXXX 1 X TA STA
    nor(pla[80], timing_sig[2], IR[2], IR[3], ~IR[4], IR10);                                // XXX100XX 3 2 T2 BR
    nor(pla[81], timing_sig[2], ~IR[2], IR[3]);                                             // XXXX01XX X 2 T2 zpd/XY
    nor(pla[82], timing_sig[2], IR[2], IR[3], ~IR[4], ~IR[0]);                              // XXX100XX 1 2 T2 GP1 ind
    nor(pla[83], timing_sig[2], ~IR[3], pla[97]);                                           // XXXX1XXX X 2 T2 #adXY
    nor(pla[84], timing_sig[3], IR[2], IR[3], ~IR[4], IR10);                                // XXX100XX 3 3 T3 BR           #660
    nor(pla[85], timing_sig[5], IR[2], IR[3], IR[4], ~IR[5], ~IR[6], IR[7], IR10);          // 011000XX 3 5 T5 RTS
    nor(pla[86], timing_sig[4]);                                                            // XXXXXXXX X 4 T4
    nor(pla[87], timing_sig[3]);                                                            // XXXXXXXX X 3 T3
    nor(pla[88], timing_sig[0], IR[2], IR[3], IR[4], IR[5], IR[7], IR10);                   // 0X0000XX 3 0 T0 BRK/RTI
    nor(pla[89], timing_sig[0], ~IR[2], ~IR[3], IR[4], ~IR[6], IR[7], IR10, pla[97]);       // 01X011XX 3 0 T0 JMP
    nor(pla[90], timing_sig[5], IR[2], IR[3], IR[4]);                                       // XXX000XX X 5 T5 INDX
    nor(pla[91], timing_sig[3], ~IR[3]);                                                    // XXXX1XXX X 3 T3 #ADXY
    nor(pla[92], timing_sig[4], IR[2], IR[3]);                                              // XXXX00XX X 4 T4 INDY
    nor(pla[93], pla[91]);                                                                  // XXXX1XXX X 3 T3 ADXY
    nor(pla[94], IR[3], IR[4], IR[5], IR[7], IR10);                                         // 0X000XXX 3 X T* RTIINT
    nor(pla[95], IR[3], IR[4], ~IR[5], IR[6], IR[7], IR10);                                 // 00100XXX 3 X T* JSR
    nor(pla[96], ~IR[2], ~IR[3], IR[4], ~IR[6], IR[7], IR10);                               // 01X011XX 3 X T* JMPB
    nor(pla[97], IR[2], ~IR[3], IR[4], IR[7], IR10);                                        // 0XX010XX 3 X T* PHL       #91
    nor(pla[98], IR[6], IR[7]);                                                             // 100XXXXX X X TA STA/X/Y
    nor(pla[99], timing_sig[4], IR[2], IR[3], IR[4], IR[5], IR[6], IR[7], IR10);            // 000000XX 3 4 T4 BRK
    nor(pla[100], timing_sig[2], IR[2], ~IR[3], IR[4], IR[5], IR[6], IR[7], IR10);          // 000010XX 3 2 T2 PHP
    nor(pla[101], timing_sig[2], IR[2], ~IR[3], IR[4], IR[5], IR[7], IR10);                 // 0X0010XX 3 2 T2 PHP/A
    nor(pla[102], timing_sig[4], ~IR[2], ~IR[3], IR[4], ~IR[6], IR[7], IR10);               // 01X011XX 3 4 T4 JMP
    nor(pla[103], timing_sig[5], IR[2], IR[3], IR[4], ~IR[6], IR[7], IR10);                 // 01X000XX 3 5 T5 RTI/S
    nor(pla[104], timing_sig[5], IR[2], IR[3], IR[4], ~IR[5], IR[6], IR[7], IR10);          // 001000XX 3 5 T5 JSR
    nor(pla[105], timing_sig[2], ~IR[2], ~IR[3], IR[4], IR[5], ~IR[6], IR[7], IR10);        // 010011XX 3 2 T2 JMP ad
    nor(pla[106], timing_sig[3], IR[2], ~IR[3], IR[4], ~IR[5], IR[7], IR10);                // 0X1010XX 3 3 T3 PLP/A
    nor(pla[107], ~IR[6], ~IR[1]);                                                          // X1XXXXXX 2 X T* S/ROR/DE/INC
    nor(pla[108], ~IR[2], IR[6], IR[7], ~IR[1]);                                            // 00X010XX 2 X TW ASL/ROL  
    nor(pla[109], timing_sig[0], IR[2], ~IR[3], ~IR[4], ~IR[6], IR[7], IR10);               // 01X110XX 3 0 T0 CL/SEI
    nor(pla[110], timing_sig[1], ~IR[2], IR[4], ~IR[5], IR[6], IR[7], IR10);                // 0010X1XX 3 1 T1 BIT          #1646
    nor(pla[111], timing_sig[0], IR[2], ~IR[3], ~IR[4], IR[6], IR[7], IR10);                // 00X110XX 3 0 T0 CL/SEC
    nor(pla[112], timing_sig[3], ~IR[2], IR[3], ~IR[4]);                                    // XXX101XX X 3 T3 zpdXY
    nor(pla[113], timing_sig[1], ~IR[5], ~IR[6], ~IR[0]);                                   // X11XXXXX 1 1 T1 ADC/SBC    #1155
    nor(pla[114], timing_sig[0], ~IR[2], IR[4], ~IR[5], IR[6], IR[7], IR10);                // 0010X1XX 3 0 T0 BIT
    nor(pla[115], timing_sig[0], IR[2], ~IR[3], IR[4], ~IR[5], IR[6], IR[7], IR10);         // 001010XX 3 0 T0 PLP
    nor(pla[116], timing_sig[4], IR[2], IR[3], IR[4], IR[5], ~IR[6], IR[7], IR10);          // 010000XX 3 4 T4 RTI
    nor(pla[117], timing_sig[1], IR[5], ~IR[6], ~IR[7], ~IR[0]);                            // 110XXXXX 1 1 T1 CMP          #301
    nor(pla[118], timing_sig[1], ~IR[2], ~IR[3], IR[4], ~IR[6], ~IR[7], IR10);              // 11X011XX 3 1 T1 CPX/Y ad  #950
    nor(pla[119], timing_sig[1], IR[2], ~IR[3], IR[4], IR[6], IR[7], ~IR[1]);               // 00X010XX 2 1 T1 ASL/ROL A
    nor(pla[120], timing_sig[1], IR[3], IR[4], ~IR[6], ~IR[7], IR10);                       // 11X00XXX 3 1 T1 CPX/CPY - zp/#  #1710
    nor(pla[121], timing_sig[0], IR[2], ~IR[3], ~IR[4], ~IR[6], ~IR[7], IR10);              // 11X110XX 3 0 T0 CL/SED
    nor(pla[122], IR[6]);                                                                   // X0XXXXXX X X T* IR6
    nor(pla[123], timing_sig[3], ~IR[2], ~IR[3], IR[4]);                                    // XXX011XX X 3 T3 ad
    nor(pla[124], timing_sig[2], ~IR[2], IR[3], IR[4]);                                     // XXX001XX X 2 T2 zpd
    nor(pla[125], timing_sig[5], IR[2], IR[3], ~IR[0]);                                     // XXXX00XX 1 5 T5 ind
    nor(pla[126], timing_sig[4], ~IR[3], ~IR[4]);                                           // XXX11XXX X 4 T4 adXY
    nor(pla[127], IR[7]);                                                                   // 0XXXXXXX X X T* IR7
    nor(pla[128], IR[2], ~IR[3], ~IR[4], ~IR[5], IR[6], ~IR[7], IR10);                      // 101110XX 3 X T* CLV
    nor(pla[129], IR[2], ~IR[3], IR[0], pla[98]);                                           // XXXX10XX X X T* Implied
endmodule   
