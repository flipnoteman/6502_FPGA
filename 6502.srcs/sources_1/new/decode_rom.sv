`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2023 03:15:43 PM
// Design Name: 
// Module Name: decode_rom
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// Reference
// https://web.archive.org/web/20160304185423/http://visual6502.org/wiki/index.php?title=6507_Decode_ROM


module decode_rom(
        input [7:0] IR,
        input [5:0] timing_sig, //active low
        output [129:0] pla
    );

    wire IR10;
    or(IR10, IR[1], IR[0]);
    
    nor(pla[0], ~IR[2], IR[5], IR[6], ~IR[7], IR10);                                        // 100XX1XX 3 X STY
    nor(pla[1], timing_sig[3], IR[3], IR[4], ~IR[5], IR[0]);                                // XXX100XX 1 3 T3INDYA
    nor(pla[2], timing_sig[2], IR[2], ~IR[3], ~IR[4], IR[0]);                               // XXX110XX 1 2 T2ABSY
    nor(pla[3], timing_sig[0], IR[4], IR[5], ~IR[6], ~IR[7], IR10);                         // 1100XXXX 3 0 T0CPYINY
    nor(pla[4], timing_sig[0], IR[2], ~IR[3], ~IR[4], IR[5], IR[6], IR[7], IR10);           // 100110XX 3 0 T0TYAA
    nor(pla[5], timing_sig[0], IR[2], ~IR[3], IR[4], IR[5], ~IR[7], IR10);                  // 1X0010XX 3 0 T0DEYINY
    nor(pla[6], timing_sig[5], IR[2], IR[3], IR[4], IR[5], IR[6], IR[7], IR10);             // 000000XX 3 5 T5BRK
    nor(pla[7], IR[6], ~IR[7], IR[1]);                                                      // 10XXXXXX 2 X LDXSDX
    nor(pla[8], timing_sig[2], ~IR[2], ~IR[4]);                                             // XXX1X1XX X 2 T2ANYX
    nor(pla[9], timing_sig[2], IR[2], IR[3], IR[4], IR[0]);                                 // XXX000XX 1 2 T2XIND
    nor(pla[10], timing_sig[0], IR[2], ~IR[3], IR[4], IR[5], IR[6], ~IR[7], IR[1]);         // 100010XX 2 0 T0TXAA
    nor(pla[11], timing_sig[0], IR[2], ~IR[3], IR[4], IR[5], ~IR[6], ~IR[7], IR[1]);        // 110010XX 2 0 T0DEX
    nor(pla[12], timing_sig[0], IR[4], ~IR[5], ~IR[6], ~IR[7], IR10);                       // 1110XXXX 3 0 T0CPXINX
    nor(pla[13], timing_sig[0], IR[2], ~IR[3], ~IR[4], IR[5], IR[6], ~IR[7], IR[1]);        // 100110XX 2 0 T0TXS
    nor(pla[14], IR[5], IR[6], ~IR[7], IR[1]);                                              // 100XXXXX 2 X SDX
    nor(pla[15], timing_sig[0], ~IR[5], IR[6], ~IR[7], IR[1]);                              // 101XXXXX 2 0 T0TALDTSX
    nor(pla[16], timing_sig[1], IR[2], ~IR[3], IR[4], IR[5], ~IR[6], ~IR[7], IR[1]);        // 110010XX 2 1 T1DEX
    nor(pla[17], timing_sig[1], IR[2], ~IR[3], IR[4], ~IR[5], ~IR[6], ~IR[7], IR10);        // 111010XX 3 1 T1INX
    nor(pla[18], timing_sig[0], IR[2], ~IR[3], ~IR[4], ~IR[5], IR[6], ~IR[7], IR[1]);       // 101110XX 2 0 T0TSX
    nor(pla[19], timing_sig[1], IR[2], ~IR[3], IR[4], IR[5], ~IR[7], IR10);                 // 1X0010XX 3 1 T1DEYINY
    nor(pla[20], timing_sig[0], ~IR[2], ~IR[5], IR[6], ~IR[7], IR10);                       // 101XX1XX 3 0 T0LDY1
    nor(pla[21], timing_sig[0], IR[4], ~IR[5], IR[6], ~IR[7], IR10);                        // 1010XXXX 3 0 T0LDY2TAY
    nor(pla[22], timing_sig[2], IR[2], IR[4], IR[7], IR10);                                 // 0XX0X0XX 3 2 CCC
    nor(pla[23], timing_sig[0], IR[2], IR[3], IR[4], ~IR[5], IR[6], IR[7], IR10);           // 001000XX 3 0 T0JSR
    nor(pla[24], timing_sig[0], IR[2], ~IR[3], IR[4], IR[5], IR[7], IR10);                  // 0X0010XX 3 0 T0PSHASHP
    nor(pla[25], timing_sig[4], IR[2], IR[3], IR[4], ~IR[5], ~IR[6], IR[7], IR10);          // 011000XX 3 4 T4RTS
    nor(pla[26], timing_sig[3], IR[2], ~IR[3], IR[4], IR[5], ~IR[7], IR10);                 // 0X1010XX 3 3 T3PLAPLPA
    nor(pla[27], timing_sig[5], IR[2], IR[3], IR[4], IR[5], ~IR[6], IR[7], IR10);           // 010000XX 3 5 T5RTI
    nor(pla[28], ~IR[5], ~IR[6], IR[7], IR[1]);                                             // 011XXXXX 2 X RORRORA
    nor(pla[29], timing_sig[2], IR[2], IR[3], IR[4], ~IR[5], IR[6], IR[7], IR10);           // 001000XX 3 2 T2JSR
    nor(pla[30], ~IR[2], ~IR[3], IR[4], ~IR[5], IR[7], IR10);                               // 01X011XX 3 X JMPA
    nor(pla[31], timing_sig[2]);                                                            // XXXXXXXX X 2 T2
    nor(pla[32], timing_sig[2], ~IR[2], ~IR[3], IR[4]);                                     // XXX011XX X 2 T2EXT
    nor(pla[33], IR[2], IR[3], IR[4], ~IR[6], IR[7], IR10);                                 // 01X000XX 3 X RTIRTS
    nor(pla[34], timing_sig[4], IR[2], IR[3], IR[4], IR[0]);                                // XXX000XX 1 4 T4XIND
    nor(pla[35], timing_sig[0]);                                                            // XXXXXXXX X 0 T0A
    nor(pla[36], timing_sig[2], IR[3]);                                                     // XXXX0XXX X 2 T2NANYABS
    nor(pla[37], timing_sig[4], IR[2], IR[3], IR[4], IR[5], ~IR[6], IR[7], IR10);           // 010000XX 3 4 T4RTIA
    nor(pla[38], timing_sig[4], IR[2], IR[3], IR[4], IR[6], IR[7], IR10);                   // 00X000XX 3 4 T4JSRINT
    nor(pla[39], timing_sig[3], IR[4], IR[7], IR10);                                        // 0XX0XXXX 3 3 NAME1:T3_RTI_RTS_JSR_JMP_INT_PULA_PUPL
    nor(pla[40], timing_sig[3], IR[2], IR[3], ~IR[4], IR[0]);                               // XXX100XX 1 3 T3INDYB
    nor(pla[41], timing_sig[3], IR[2], IR[3], IR[4], IR[0]);                                // XXX000XX 1 3 T3XIND
    nor(pla[42], timing_sig[4], IR[2], IR[3], ~IR[4], IR[0]);                               // XXX100XX 1 4 T4INDYA
    nor(pla[43], timing_sig[2], IR[2], IR[3], ~IR[4], IR[0]);                               // XXX100XX 1 2 T2INDY
    nor(pla[44], timing_sig[3], ~IR[3], ~IR[4]);                                            // XXX11XXX X 3 T3ABSXYA
    nor(pla[45], IR[2], ~IR[3], IR[4], ~IR[5], IR[7], IR10);                                // 0X1010XX 3 X PULAPULP
    nor(pla[46], ~IR[5], ~IR[6], ~IR[7], IR[1]);                                            // 111XXXXX 2 X INC
    nor(pla[47], timing_sig[0], IR[5], ~IR[6], IR[7], IR[0]);                               // 010XXXXX 1 0 T0EOR
    nor(pla[48], timing_sig[0], IR[5], ~IR[6], ~IR[7], IR[0]);                              // 110XXXXX 1 0 T0CMP
    nor(pla[49], timing_sig[0], IR[4], ~IR[6], ~IR[7], IR10);                               // 11X0XXXX 3 0 NAME2:T0_CPX_CPY_INX_INY
    nor(pla[50], timing_sig[0], ~IR[5], ~IR[6], IR[0]);                                     // X11XXXXX 1 0 T0ADCSBC
    nor(pla[51], timing_sig[0], ~IR[5], ~IR[6], ~IR[7], IR[0]);                             // 111XXXXX 1 0 T0SBC
    nor(pla[52], ~IR[5], IR[6], IR[7], IR[1]);                                              // 001XXXXX 2 X ROLROLA
    nor(pla[53], timing_sig[3], ~IR[2], ~IR[3], IR[4], ~IR[6], IR[7], IR10);                // 01X011XX 3 3 T3JMP
    nor(pla[54], IR[5], IR[6], IR[7], IR[0]);                                               // 000XXXXX 1 0 T0ORA
    nor(pla[55], IR[6], IR[7], IR[1]);                                                      // 00XXXXXX 2 X NAME8:ROL_ROLA_ASL_ASLA
    nor(pla[56], timing_sig[0], IR[2], ~IR[3], ~IR[4], IR[5], IR[6], ~IR[7], IR10);         // 100110XX 3 0 T0TYAB
    nor(pla[57], timing_sig[0], IR[2], ~IR[3], IR[4], IR[5], IR[6], ~IR[7], IR[1]);         // 100010XX 2 0 T0TXAB
    nor(pla[58], timing_sig[1], ~IR[5], ~IR[6], IR[0]);                                     // X11XXXXX 1 1 T1ADCSBCA
    nor(pla[59], timing_sig[1], IR[7], IR[0]);                                              // 0XXXXXXX 1 1 NAME7:T1_AND_EOR_OR_ADC
    nor(pla[60], timing_sig[1], IR[2], ~IR[3], IR[4], IR[7], IR[1]);                        // 0XX010XX 2 1 NAME4:T1_ASLA_ROLA_LSRA
    nor(pla[61], timing_sig[0], IR[2], ~IR[3], IR[4], ~IR[5], ~IR[6], IR[7], IR10);         // 011010XX 3 0 T0PULA
    nor(pla[62], timing_sig[4], ~IR[3], ~IR[4]);                                            // XXX11XXX X 4 T4ABSXYA
    nor(pla[63], timing_sig[5], IR[2], IR[3], ~IR[4], IR[0]);                               // XXX100XX 1 5 T5INDY
    nor(pla[64], timing_sig[0], ~IR[5], IR[6], ~IR[7], IR[0]);                              // 101XXXXX 1 0 T0LDA
    nor(pla[65], timing_sig[0], IR[0]);                                                     // XXXXXXXX 1 0 T0G1
    nor(pla[66], timing_sig[0], ~IR[5], IR[6], IR[7], IR[0]);                               // 001XXXXX 1 0 T0AND
    nor(pla[67], timing_sig[0], ~IR[2], IR[4], ~IR[5], IR[6], IR[7], IR10);                 // 0010X1XX 3 0 T0BITA
    nor(pla[68], timing_sig[0], ~IR[2], IR[3], ~IR[4], IR[7], IR[1]);                       // 0XX010XX 2 0 NAME6:T0_ASLA_ROLA_LSRA
    nor(pla[69], timing_sig[0], IR[2], ~IR[3], IR[4], ~IR[5], IR[6], ~IR[7], IR[1]);        // 101010XX 2 0 T0TAX
    nor(pla[70], timing_sig[0], IR[2], ~IR[3], IR[4], ~IR[5], IR[6], ~IR[7], IR10);         // 101010XX 3 0 T0TAY
    nor(pla[71], timing_sig[0], IR[2], ~IR[3], IR[4], ~IR[6], IR[7], IR[1]);                // 01X010XX 2 0 T0LSRA
    nor(pla[72], ~IR[6], IR[7], IR[1]);                                                     // 01XXXXXX 2 X LSRLSRA
    nor(pla[73], timing_sig[5], IR[2], IR[3], IR[4], ~IR[5], IR[6], IR[7], IR10);           // 001000XX 3 5 T5JSRA
    nor(pla[74], timing_sig[2], IR[2], IR[3], ~IR[4], IR10);                                // XXX100XX 3 2 T2BR
    nor(pla[75], timing_sig[2], IR[2], IR[3], IR[4], IR[5], IR[6], IR[7], IR10);            // 000000XX 3 2 T2INT
    nor(pla[76], timing_sig[3], IR[2], IR[3], IR[4], ~IR[5], IR[6], IR[7], IR10);           // 001000XX 3 3 T3JSR
    nor(pla[77], timing_sig[2], ~IR[2], IR[3]);                                             // XXXX01XX X 2 T2ANYZP
    nor(pla[78], timing_sig[2], IR[2], IR[3], IR[0]);                                       // XXXX00XX 1 2 T2ANYIND
    nor(pla[79], timing_sig[4]);                                                            // XXXXXXXX X 4 T4
    nor(pla[80], timing_sig[3]);                                                            // XXXXXXXX X 3 T3
    nor(pla[81], timing_sig[0], IR[2], IR[3], IR[4], IR[5], IR[7], IR10);                   // 0X0000XX 3 0 T0RTIINT
    nor(pla[82], timing_sig[0], ~IR[2], ~IR[3], IR[4], ~IR[6], IR[7]);                      // 01X011XX 3 0 T0JMP
    nor(pla[83], timing_sig[2], IR[2], IR[4], IR[7]);                                       // 0XX0X0XX 3 2 NAME3:T2_RTI_RTS_JSR_INT_PULA_PUPLP_PSHA_PSHP
    nor(pla[84], timing_sig[5], IR[2], IR[3], IR[4], ~IR[5], ~IR[6], IR[7], IR10);          // 011000XX 3 5 T5RTS
    nor(pla[85], timing_sig[2], ~IR[3]);                                                    // XXXX1XXX X 2 T2ANYABS
    nor(pla[86], IR[5], IR[6], ~IR[7], IR[0]);                                              // 100XXXXX 1 X STA
    nor(pla[87], timing_sig[2], IR[2], ~IR[3], IR[4], IR[5], ~IR[6], ~IR[7], IR10);         // 010010XX 3 2 T2PSHA
    nor(pla[88], timing_sig[0], IR[2], IR[3], ~IR[4], IR10);                                // XXX100XX 3 0 T0BR
    nor(pla[89], IR[2], ~IR[3], IR[4], IR[7], IR10);                                        // 0XX010XX 3 X PSHPULA
    nor(pla[90], timing_sig[5], IR[2], IR[3], IR[4], IR[0]);                                // XXX000XX 1 5 T5XIND
    nor(pla[91], timing_sig[3], ~IR[3]);                                                    // XXXX1XXX X 3 T3ANYABS
    nor(pla[92], timing_sig[4], IR[2], IR[3], ~IR[4], IR[0]);                               // XXX100XX 1 4 T4INDYB
    nor(pla[93], timing_sig[3], ~IR[3], ~IR[4]);                                            // XXX11XXX X 3 T3ABSXYB
    nor(pla[94], IR[2], IR[3], IR[4], IR[5], IR[7], IR10);                                  // 0X0000XX 3 X RTIINT
    nor(pla[95], IR[2], IR[3], IR[4], ~IR[5], IR[6], IR[7], IR10);                          // 001000XX 3 X JSR
    nor(pla[96], ~IR[2], ~IR[3], IR[4], ~IR[6], IR[7], IR10);                               // 01X011XX 3 X JMPB
    nor(pla[97], timing_sig[1], IR[3], IR[4], ~IR[6], ~IR[7], IR10);                        // 11X00XXX 3 1 T1CPX2CY2
    nor(pla[98], timing_sig[1], IR[2], ~IR[3], IR[4], IR[6], IR[7], IR[1]);                 // 00X010XX 2 1 T1ASLARLA
    nor(pla[99], timing_sig[1], ~IR[2], ~IR[3], IR[4], ~IR[6], ~IR[7], IR10);               // 11X011XX 3 1 T1CPX1CY1
    nor(pla[100], timing_sig[1], IR[5], ~IR[6], ~IR[7], IR[0]);                             // 110XXXXX 1 1 T1CMP
    nor(pla[101], timing_sig[1], ~IR[5], ~IR[6], IR[0]);                                    // X11XXXXX 1 1 T1ADCSBCB
    nor(pla[102], IR[6], IR[7], IR[1]);                                                     // 00XXXXXX 2 X NAME5:ROL_ROLA_ASL_ASLA
    nor(pla[103], ~IR[6], IR[1]);                                                           // X1XXXXXX 2 X LSRRADCIC
    nor(pla[104], timing_sig[1], ~IR[2], IR[4], ~IR[5], IR[6], IR[7], IR10);                // 0010X1XX 3 1 T1BIT
    nor(pla[105], timing_sig[2], IR[2], ~IR[3], IR[4], IR[5], IR[6], IR[7], IR10);          // 000010XX 3 2 T2PSHP
    nor(pla[106], timing_sig[4], IR[2], IR[3], IR[4], IR[5], IR[6], IR[7], IR10);           // 000000XX 3 4 T4INT
    nor(pla[107], IR[5], IR[6], IR[7]);                                                     // 100XXXXX X X STASTYSTX
    nor(pla[108], timing_sig[4], ~IR[3], ~IR[4]);                                           // XXX11XXX X 4 T4ABSXYB
    nor(pla[109], timing_sig[5], IR[2], IR[3], IR[0]);                                      // XXXX00XX 1 5 T5ANYIND
    nor(pla[110], timing_sig[2], ~IR[2], IR[3], IR[4]);                                     // XXX001XX X 2 T2ZP
    nor(pla[111], timing_sig[3], ~IR[2], ~IR[3], IR[4]);                                    // XXX011XX X 3 T3ABS
    nor(pla[112], timing_sig[3], ~IR[2], IR[3], ~IR[4]);                                    // XXX101XX X 3 T3ZPX
    nor(pla[113], timing_sig[2], IR[2], ~IR[3], IR[4], IR[5], IR[7], IR10);                 // 0X0010XX 3 2 T2PSHASHP
    nor(pla[114], timing_sig[5], IR[2], IR[3], IR[4], ~IR[6], IR[7], IR10);                 // 01X000XX 3 5 T5RTIRTS
    nor(pla[115], timing_sig[5], IR[2], IR[3], IR[4], ~IR[5], IR[6], IR[7], IR10);          // 001000XX 3 5 T5JSRB
    nor(pla[116], timing_sig[5], ~IR[2], ~IR[3], IR[4], ~IR[6], IR[7], IR10);               // 01X011XX 3 5 T4JMP
    nor(pla[117], timing_sig[2], ~IR[2], ~IR[3], IR[4], IR[5], ~IR[6], IR[7], IR10);        // 010011XX 3 2 T2JMPABS
    nor(pla[118], timing_sig[3], IR[2], ~IR[3], IR[4], ~IR[5], IR[7], IR10);                // 0X1010XX 3 3 T3PLAPLPB
    nor(pla[119], timing_sig[3], IR[2], IR[3], ~IR[4], IR10);                               // XXX100XX 3 3 T3BR
    nor(pla[120], timing_sig[0], ~IR[2], IR[4], ~IR[5], IR[6], IR[7], IR10);                // 0010X1XX 3 0 T0BITB
    nor(pla[121], timing_sig[4], IR[2], IR[3], IR[4], IR[5], ~IR[6], IR[7], IR10);          // 010000XX 3 4 T4RTIB
    nor(pla[122], timing_sig[0], IR[2], ~IR[3], IR[4], ~IR[5], IR[6], IR[7], IR10);         // 001010XX 3 0 T0PULP
    nor(pla[123], IR[2], ~IR[3], IR[4], IR[7], IR10);                                       // 0XX010XX 3 X PSHPULB
    nor(pla[124], IR[2], ~IR[3], ~IR[4], ~IR[5], IR[6], ~IR[7], IR10);                      // 101110XX 3 X CLV
    nor(pla[125], timing_sig[0], IR[2], ~IR[3], ~IR[4], IR[6], IR[7], IR10);                // 00X110XX 3 0 T0CLCSEC
    nor(pla[126], timing_sig[0], IR[2], ~IR[3], ~IR[4], ~IR[6], IR[7], IR10);               // 01X110XX 3 0 T0CLISEI
    nor(pla[127], timing_sig[0],IR[2], ~IR[3], ~IR[4], ~IR[6], ~IR[7], IR10);               // 11X110XX 3 0 T0CLDSED
    nor(pla[128], IR[7]);                                                                   // 0XXXXXXX X X NI7P
    nor(pla[129], ~IR[6]);                                                                  // X0XXXXXX X X NI6P


endmodule   
