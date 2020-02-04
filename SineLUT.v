/* Verilog netlist generated by SCUBA Diamond (64-bit) 3.11.1.441 */
/* Module Version: 5.4 */
/* C:\lscc\diamond\3.11_x64\ispfpga\bin\nt64\scuba.exe -w -n SineLUT -lang verilog -synth lse -bus_exp 7 -bb -arch xo3c00f -type bram -wp 00 -rp 1100 -addr_width 11 -data_width 16 -num_rows 1375 -cascade -1 -memfile d:/docs/fpga/oscillator/sin_lut1375.mem -memformat hex  */
/* Mon Jan 27 16:12:19 2020 */


`timescale 1 ns / 1 ps
module SineLUT (Address, OutClock, OutClockEn, Reset, Q)/* synthesis NGD_DRC_MASK=1 */;
    input wire [10:0] Address;
    input wire OutClock;
    input wire OutClockEn;
    input wire Reset;
    output wire [15:0] Q;

    wire scuba_vhi;
    wire scuba_vlo;
    wire mdout0_1_0;
    wire mdout0_0_0;
    wire mdout0_1_1;
    wire mdout0_0_1;
    wire mdout0_1_2;
    wire mdout0_0_2;
    wire mdout0_1_3;
    wire mdout0_0_3;
    wire mdout0_1_4;
    wire mdout0_0_4;
    wire mdout0_1_5;
    wire mdout0_0_5;
    wire mdout0_1_6;
    wire mdout0_0_6;
    wire mdout0_1_7;
    wire mdout0_0_7;
    wire mdout0_1_8;
    wire mdout0_0_8;
    wire mdout0_1_9;
    wire mdout0_0_9;
    wire mdout0_1_10;
    wire mdout0_0_10;
    wire mdout0_1_11;
    wire mdout0_0_11;
    wire mdout0_1_12;
    wire mdout0_0_12;
    wire mdout0_1_13;
    wire mdout0_0_13;
    wire mdout0_1_14;
    wire mdout0_0_14;
    wire raddr10_ff;
    wire mdout0_1_15;
    wire mdout0_0_15;

    defparam SineLUT_0_0_2.INIT_DATA = "STATIC" ;
    defparam SineLUT_0_0_2.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam SineLUT_0_0_2.INITVAL_1F = "0x0301E04A2C0683D08C510B6670E68011A9B154BA194DB1D8FF225252754F2C97A323A9385DB3E80F" ;
    defparam SineLUT_0_0_2.INITVAL_1E = "0x054450C47F13ABB1B4FA2353B2BB7F347C63D61006A5C106AB1A6FC24D502F7A73A60005C5C116BA" ;
    defparam SineLUT_0_0_2.INITVAL_1D = "0x1D71C29B7F365E50344E108BA1E1282BF983A20B08A81178F926B73363F006070160F226776373FD" ;
    defparam SineLUT_0_0_2.INITVAL_1C = "0x08286199122B3A03D0310F4C421D5934BF107A8B1B3272EDC602C671710A2BBB00085815B022B1AE" ;
    defparam SineLUT_0_0_2.INITVAL_1B = "0x00A5D16B0E2CFC1036761A52D315E708AA32036138021102E3289A70126D1A335335FF0CACC2659A" ;
    defparam SineLUT_0_0_2.INITVAL_1A = "0x0046A1A73C34C100F6E62A5BE0569820D743C4511833134212106F52CFDA09AC0269A803A922117E" ;
    defparam SineLUT_0_0_2.INITVAL_19 = "0x3EA6B1C75A3A64B1893D36E31159273441E135163261011D0C314091110730E07111093140B11B0F" ;
    defparam SineLUT_0_0_2.INITVAL_18 = "0x324151311C33E241512D3643817B43394501AF5F3CC6E1ED7F00E90233A305AB7283CC0AEE22DBF9" ;
    defparam SineLUT_0_0_2.INITVAL_17 = "0x1091133A2916D433A05E1D97A0109624BB3084D22C3F01011034031183523C67420B96050B9297DD" ;
    defparam SineLUT_0_0_2.INITVAL_16 = "0x0DF02328271734C3BE7220D99058C02A9E80F91034838199613EA8A23DB3090DD2E4071393138C5C" ;
    defparam SineLUT_0_0_2.INITVAL_15 = "0x1E386038B128FDC0E50833A331935E3E88A23FB5096E12EC0C1453739A631F18E048B929FE40F50F" ;
    defparam SineLUT_0_0_2.INITVAL_14 = "0x3483A19F643F28E247B809AE22EC0B13F343905C1E184030AC281D40CEFA31C21169473B26C1FD91" ;
    defparam SineLUT_0_0_2.INITVAL_13 = "0x046B528FD80D4FB3181D15D3F39E601E1800209F25DBE09ADB2D5F810D143443017B4A3AE631DF7C" ;
    defparam SineLUT_0_0_2.INITVAL_12 = "0x00E9323DA9068BF293D30BAE72E1F91030A3241A143293603617B433904E1A7583B8611C9683D66E" ;
    defparam SineLUT_0_0_2.INITVAL_11 = "0x1E3733EA761EF783F2791F3783EE761E9723E06D1D5663C45E1B35439E491873C36A2D14D1D32A0B" ;
    defparam SineLUT_0_0_2.INITVAL_10 = "0x104F82DDE30B0CC281B304C992177D3DC5F19F3F35E1E118FA2D1D5084AE235853E05A1892D32DFE" ;
    defparam SineLUT_0_0_2.INITVAL_0F = "0x0CCCE2699B002661972F327F70B2BC23B7F3BE4013EFF2BBBB032761A72E315E507E991E54B347FB" ;
    defparam SineLUT_0_0_2.INITVAL_0E = "0x0A4A81FD53351FC0A0A31ED48333EA0748A1B3272EBC301E5B14EF22798639E180C0A71DD342F5BF" ;
    defparam SineLUT_0_0_2.INITVAL_0D = "0x00647114CD21D50321D00204F11ACB20F442FFBB3EA2F0D0A11B11028D7C365E60364E102B31C915" ;
    defparam SineLUT_0_0_2.INITVAL_0C = "0x28D75349D20002D0B285160DA2092D2AB7D349CB3E0150745D102A318AE620D2628B633039E377D6" ;
    defparam SineLUT_0_0_2.INITVAL_0B = "0x3E20C04A3E0AE6F10C9C162C61B6EE2031424B3628D562CB733018D333A535FBA387CC3A9DB3C5E8" ;
    defparam SineLUT_0_0_2.INITVAL_0A = "0x3DBF23EDF93F7FD3FDFF3FFFE3F9FA3EFF43DFEA3CBDE3AFD038FBE36BAA33F9330F7A2D95D29D3E" ;
    defparam SineLUT_0_0_2.INITVAL_09 = "0x25D1C216F81CAD1178A71227A0C64B064193FFE4393AC321722A93622CF61AAB41246F09828007DD" ;
    defparam SineLUT_0_0_2.INITVAL_08 = "0x36F912D341232EF18A9A0DE4302FE93778D2BB2E1FACC1346706801399972C32B1E8BD1084B025D8" ;
    defparam SineLUT_0_0_2.INITVAL_07 = "0x33B6224CE91586E05FF03637025EEE1566904BE133957222CB1083C3E9AB2C31719A8106BE93394E" ;
    defparam SineLUT_0_0_2.INITVAL_06 = "0x200B10C4123857023ECD0F4263A57E252D30FA2639F7723EC60D81236F5C202A4091EA3192E19E70" ;
    defparam SineLUT_0_0_2.INITVAL_05 = "0x021AF29CED1162838B611FA99067CE2D10113432395621F28F04BBA29EE40F00B33F31186553CD77" ;
    defparam SineLUT_0_0_2.INITVAL_04 = "0x20E9704FB6288D20C1ED2F5061241D3513317A473A1591C26A3E3781FE860199222E9C041A4250AB" ;
    defparam SineLUT_0_0_2.INITVAL_03 = "0x05DB1266B506FB8270B9073B9270B706DB4264AF05BAA24CA303F9A22C9101786200793E76C1CA5E" ;
    defparam SineLUT_0_0_2.INITVAL_02 = "0x3AD4E18C3D3692B1441831D040F5EF2C8D909BC226CA903B90206763D35B19A3F36323128052ECE7" ;
    defparam SineLUT_0_0_2.INITVAL_01 = "0x0AFC8270A8031871EE663AB441642131EFE0D9DA28EB5047901FA6A3AF441621D314F60C5CE274A6" ;
    defparam SineLUT_0_0_2.INITVAL_00 = "0x0257E1D4553832C12E022DAD9089AE232843DF5A1882F333040DDD9286AE031821DA573832B12C00" ;
    defparam SineLUT_0_0_2.CSDECODE_B = "0b111" ;
    defparam SineLUT_0_0_2.CSDECODE_A = "0b000" ;
    defparam SineLUT_0_0_2.WRITEMODE_B = "NORMAL" ;
    defparam SineLUT_0_0_2.WRITEMODE_A = "NORMAL" ;
    defparam SineLUT_0_0_2.GSR = "ENABLED" ;
    defparam SineLUT_0_0_2.RESETMODE = "ASYNC" ;
    defparam SineLUT_0_0_2.REGMODE_B = "NOREG" ;
    defparam SineLUT_0_0_2.REGMODE_A = "NOREG" ;
    defparam SineLUT_0_0_2.DATA_WIDTH_B = 9 ;
    defparam SineLUT_0_0_2.DATA_WIDTH_A = 9 ;
    DP8KC SineLUT_0_0_2 (.DIA8(scuba_vlo), .DIA7(scuba_vlo), .DIA6(scuba_vlo), 
        .DIA5(scuba_vlo), .DIA4(scuba_vlo), .DIA3(scuba_vlo), .DIA2(scuba_vlo), 
        .DIA1(scuba_vlo), .DIA0(scuba_vlo), .ADA12(Address[9]), .ADA11(Address[8]), 
        .ADA10(Address[7]), .ADA9(Address[6]), .ADA8(Address[5]), .ADA7(Address[4]), 
        .ADA6(Address[3]), .ADA5(Address[2]), .ADA4(Address[1]), .ADA3(Address[0]), 
        .ADA2(scuba_vlo), .ADA1(scuba_vlo), .ADA0(scuba_vhi), .CEA(OutClockEn), 
        .OCEA(OutClockEn), .CLKA(OutClock), .WEA(scuba_vlo), .CSA2(scuba_vlo), 
        .CSA1(scuba_vlo), .CSA0(Address[10]), .RSTA(Reset), .DIB8(scuba_vlo), 
        .DIB7(scuba_vlo), .DIB6(scuba_vlo), .DIB5(scuba_vlo), .DIB4(scuba_vlo), 
        .DIB3(scuba_vlo), .DIB2(scuba_vlo), .DIB1(scuba_vlo), .DIB0(scuba_vlo), 
        .ADB12(scuba_vlo), .ADB11(scuba_vlo), .ADB10(scuba_vlo), .ADB9(scuba_vlo), 
        .ADB8(scuba_vlo), .ADB7(scuba_vlo), .ADB6(scuba_vlo), .ADB5(scuba_vlo), 
        .ADB4(scuba_vlo), .ADB3(scuba_vlo), .ADB2(scuba_vlo), .ADB1(scuba_vlo), 
        .ADB0(scuba_vlo), .CEB(scuba_vhi), .OCEB(scuba_vhi), .CLKB(scuba_vlo), 
        .WEB(scuba_vlo), .CSB2(scuba_vlo), .CSB1(scuba_vlo), .CSB0(scuba_vlo), 
        .RSTB(scuba_vlo), .DOA8(mdout0_0_8), .DOA7(mdout0_0_7), .DOA6(mdout0_0_6), 
        .DOA5(mdout0_0_5), .DOA4(mdout0_0_4), .DOA3(mdout0_0_3), .DOA2(mdout0_0_2), 
        .DOA1(mdout0_0_1), .DOA0(mdout0_0_0), .DOB8(), .DOB7(), .DOB6(), 
        .DOB5(), .DOB4(), .DOB3(), .DOB2(), .DOB1(), .DOB0())
             /* synthesis MEM_LPC_FILE="SineLUT.lpc" */
             /* synthesis MEM_INIT_FILE="sin_lut1375.mem" */;

    defparam SineLUT_0_1_1.INIT_DATA = "STATIC" ;
    defparam SineLUT_0_1_1.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam SineLUT_0_1_1.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000001" ;
    defparam SineLUT_0_1_1.INITVAL_1E = "0x00201002010020100201002010020100201002020040200402004020040200402004030060300603" ;
    defparam SineLUT_0_1_1.INITVAL_1D = "0x006030060300603008040080400804008040080500A0500A0500A0500A0500C0600C0600C0600C06" ;
    defparam SineLUT_0_1_1.INITVAL_1C = "0x00E0700E0700E0700E080100801008010080120901209012090140A0140A0140A0160B0160B0160B" ;
    defparam SineLUT_0_1_1.INITVAL_1B = "0x0180C0180C0180C01A0D01A0D01A0D01C0E01C0E01C0F01E0F01E0F0201002010020100221102211" ;
    defparam SineLUT_0_1_1.INITVAL_1A = "0x024120241202413026130261302814028140281502A1502A1602C1602C1602E1702E170301803018" ;
    defparam SineLUT_0_1_1.INITVAL_19 = "0x03019032190321A0341A0341B0361B0361C0381C0381D03A1D03A1E03C1E03C1F03E1F03E2004020" ;
    defparam SineLUT_0_1_1.INITVAL_18 = "0x04021042210422204422044230462304624048240482504A2504C2604C2604E2704E270502805028" ;
    defparam SineLUT_0_1_1.INITVAL_17 = "0x052290522A0542A0542B0562B0582C0582C05A2D05A2D05C2E05C2F05E2F05E30060300623106231" ;
    defparam SineLUT_0_1_1.INITVAL_16 = "0x064320643306633066340683406A3506A3506C3606C3706E3706E3807038072390723A0743A0743B" ;
    defparam SineLUT_0_1_1.INITVAL_15 = "0x0763B0783C0783C07A3D07A3E07C3E07C3F07E3F0804008041082410824208442086430864308844" ;
    defparam SineLUT_0_1_1.INITVAL_14 = "0x0884508A4508A4608C4608E4708E480904809049092490944A0944A0964B0964C0984C0984D09A4D" ;
    defparam SineLUT_0_1_1.INITVAL_13 = "0x09C4E09C4E09E4F09E500A0500A0510A2510A4520A4520A6530A6530A8540A8550AA550AA560AC56" ;
    defparam SineLUT_0_1_1.INITVAL_12 = "0x0AE570AE570B0580B0580B2590B2590B45A0B45B0B65B0B65C0B85C0B85D0BA5D0BA5E0BC5E0BC5F" ;
    defparam SineLUT_0_1_1.INITVAL_11 = "0x0BE5F0BE600C0600C0610C2610C2620C4620C4630C6630C6640C8640C8650CA650CA660CC660CC67" ;
    defparam SineLUT_0_1_1.INITVAL_10 = "0x0CE670CE670D0680D0680D2690D2690D26A0D46A0D46B0D66B0D66B0D86C0D86C0D86D0DA6D0DA6D" ;
    defparam SineLUT_0_1_1.INITVAL_0F = "0x0DC6E0DC6E0DE6F0DE6F0DE6F0E0700E0700E0710E2710E2710E4720E4720E4720E6730E6730E673" ;
    defparam SineLUT_0_1_1.INITVAL_0E = "0x0E8740E8740E8740EA750EA750EA750EC760EC760EC760EE770EE770EE770EE780F0780F0780F078" ;
    defparam SineLUT_0_1_1.INITVAL_0D = "0x0F2790F2790F2790F2790F47A0F47A0F47A0F47A0F47B0F67B0F67B0F67B0F67B0F87C0F87C0F87C" ;
    defparam SineLUT_0_1_1.INITVAL_0C = "0x0F87C0F87C0FA7D0FA7D0FA7D0FA7D0FA7D0FA7D0FA7E0FC7E0FC7E0FC7E0FC7E0FC7E0FC7E0FC7E" ;
    defparam SineLUT_0_1_1.INITVAL_0B = "0x0FC7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F" ;
    defparam SineLUT_0_1_1.INITVAL_0A = "0x0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F" ;
    defparam SineLUT_0_1_1.INITVAL_09 = "0x0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FE7F0FC7E0FC7E0FC7E0FC7E0FC7E0FC7E0FC7E0FC7E0FC7D" ;
    defparam SineLUT_0_1_1.INITVAL_08 = "0x0FA7D0FA7D0FA7D0FA7D0FA7D0FA7C0F87C0F87C0F87C0F87C0F87C0F67B0F67B0F67B0F67B0F67A" ;
    defparam SineLUT_0_1_1.INITVAL_07 = "0x0F47A0F47A0F47A0F4790F2790F2790F2790F2780F0780F0780F0780EE770EE770EE770EE760EC76" ;
    defparam SineLUT_0_1_1.INITVAL_06 = "0x0EC760EC760EA750EA750EA750E8740E8740E8740E6730E6730E6730E4720E4720E4710E2710E271" ;
    defparam SineLUT_0_1_1.INITVAL_05 = "0x0E2700E0700E0700DE6F0DE6F0DE6E0DC6E0DC6E0DA6D0DA6D0DA6C0D86C0D86C0D66B0D66B0D46A" ;
    defparam SineLUT_0_1_1.INITVAL_04 = "0x0D46A0D4690D2690D2680D0680D0680CE670CE670CC660CC660CA650CA650CA640C8640C8630C663" ;
    defparam SineLUT_0_1_1.INITVAL_03 = "0x0C6620C4620C4610C2610C2600C0600C05F0BE5F0BE5E0BC5E0BC5D0BA5D0BA5C0B85C0B65B0B65B" ;
    defparam SineLUT_0_1_1.INITVAL_02 = "0x0B45A0B45A0B2590B2590B0580B0570AE570AE560AC560AC550AA550A8540A8540A6530A6530A452" ;
    defparam SineLUT_0_1_1.INITVAL_01 = "0x0A4510A2510A2500A05009E4F09E4F09C4E09C4D09A4D09A4C0984C0964B0964B0944A0944909249" ;
    defparam SineLUT_0_1_1.INITVAL_00 = "0x092480904808E4708E4708C4608C4508A45088440884408643086420844208441082410804008040" ;
    defparam SineLUT_0_1_1.CSDECODE_B = "0b111" ;
    defparam SineLUT_0_1_1.CSDECODE_A = "0b000" ;
    defparam SineLUT_0_1_1.WRITEMODE_B = "NORMAL" ;
    defparam SineLUT_0_1_1.WRITEMODE_A = "NORMAL" ;
    defparam SineLUT_0_1_1.GSR = "ENABLED" ;
    defparam SineLUT_0_1_1.RESETMODE = "ASYNC" ;
    defparam SineLUT_0_1_1.REGMODE_B = "NOREG" ;
    defparam SineLUT_0_1_1.REGMODE_A = "NOREG" ;
    defparam SineLUT_0_1_1.DATA_WIDTH_B = 9 ;
    defparam SineLUT_0_1_1.DATA_WIDTH_A = 9 ;
    DP8KC SineLUT_0_1_1 (.DIA8(scuba_vlo), .DIA7(scuba_vlo), .DIA6(scuba_vlo), 
        .DIA5(scuba_vlo), .DIA4(scuba_vlo), .DIA3(scuba_vlo), .DIA2(scuba_vlo), 
        .DIA1(scuba_vlo), .DIA0(scuba_vlo), .ADA12(Address[9]), .ADA11(Address[8]), 
        .ADA10(Address[7]), .ADA9(Address[6]), .ADA8(Address[5]), .ADA7(Address[4]), 
        .ADA6(Address[3]), .ADA5(Address[2]), .ADA4(Address[1]), .ADA3(Address[0]), 
        .ADA2(scuba_vlo), .ADA1(scuba_vlo), .ADA0(scuba_vhi), .CEA(OutClockEn), 
        .OCEA(OutClockEn), .CLKA(OutClock), .WEA(scuba_vlo), .CSA2(scuba_vlo), 
        .CSA1(scuba_vlo), .CSA0(Address[10]), .RSTA(Reset), .DIB8(scuba_vlo), 
        .DIB7(scuba_vlo), .DIB6(scuba_vlo), .DIB5(scuba_vlo), .DIB4(scuba_vlo), 
        .DIB3(scuba_vlo), .DIB2(scuba_vlo), .DIB1(scuba_vlo), .DIB0(scuba_vlo), 
        .ADB12(scuba_vlo), .ADB11(scuba_vlo), .ADB10(scuba_vlo), .ADB9(scuba_vlo), 
        .ADB8(scuba_vlo), .ADB7(scuba_vlo), .ADB6(scuba_vlo), .ADB5(scuba_vlo), 
        .ADB4(scuba_vlo), .ADB3(scuba_vlo), .ADB2(scuba_vlo), .ADB1(scuba_vlo), 
        .ADB0(scuba_vlo), .CEB(scuba_vhi), .OCEB(scuba_vhi), .CLKB(scuba_vlo), 
        .WEB(scuba_vlo), .CSB2(scuba_vlo), .CSB1(scuba_vlo), .CSB0(scuba_vlo), 
        .RSTB(scuba_vlo), .DOA8(), .DOA7(), .DOA6(mdout0_0_15), .DOA5(mdout0_0_14), 
        .DOA4(mdout0_0_13), .DOA3(mdout0_0_12), .DOA2(mdout0_0_11), .DOA1(mdout0_0_10), 
        .DOA0(mdout0_0_9), .DOB8(), .DOB7(), .DOB6(), .DOB5(), .DOB4(), 
        .DOB3(), .DOB2(), .DOB1(), .DOB0())
             /* synthesis MEM_LPC_FILE="SineLUT.lpc" */
             /* synthesis MEM_INIT_FILE="sin_lut1375.mem" */;

    VHI scuba_vhi_inst (.Z(scuba_vhi));

    defparam SineLUT_1_0_0.INIT_DATA = "STATIC" ;
    defparam SineLUT_1_0_0.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam SineLUT_1_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam SineLUT_1_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam SineLUT_1_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam SineLUT_1_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam SineLUT_1_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam SineLUT_1_0_0.INITVAL_1A = "0x0003F07E3F07C3E07C3D07A3D07A3C0783C0763B0763B0743A0743907239070380703806E3706E36" ;
    defparam SineLUT_1_0_0.INITVAL_19 = "0x06C3606C3506A3506834068340663306632064320643106231060300603005E2F05E2E05C2E05C2D" ;
    defparam SineLUT_1_0_0.INITVAL_18 = "0x05A2D0582C0582C0562B0562B0542A054290522905228050280502704E2704C2604C2604A2504A25" ;
    defparam SineLUT_1_0_0.INITVAL_17 = "0x0482404824046230462204422044210422104220040200401F03E1F03E1E03C1E03C1D03A1D03A1C" ;
    defparam SineLUT_1_0_0.INITVAL_16 = "0x0381C0381B0361B0361A0341A0341A0321903219030180301802E1702E1702E1602C1602C1502A15" ;
    defparam SineLUT_1_0_0.INITVAL_15 = "0x02A1502814028140261302613026120241202412022110221102210020100201001E0F01E0F01E0E" ;
    defparam SineLUT_1_0_0.INITVAL_14 = "0x01C0E01C0E01C0D01A0D01A0D0180C0180C0180C0160B0160B0160B0140A0140A0140A0120901209" ;
    defparam SineLUT_1_0_0.INITVAL_13 = "0x012090120801008010080100800E0700E0700E0700E0600C0600C0600C0600C0500A0500A0500A05" ;
    defparam SineLUT_1_0_0.INITVAL_12 = "0x00A04008040080400804008040060300603006030060300603006020040200402004020040200402" ;
    defparam SineLUT_1_0_0.INITVAL_11 = "0x00401002010020100201002010020100201002010020100000000000000000000000000000000000" ;
    defparam SineLUT_1_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam SineLUT_1_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam SineLUT_1_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam SineLUT_1_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam SineLUT_1_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam SineLUT_1_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam SineLUT_1_0_0.INITVAL_0A = "0x0016A1AA3F353130FDE82A4BD04F921F8673A33C14C112F8E70A5BC24E933FD691A83F35716105EE" ;
    defparam SineLUT_1_0_0.INITVAL_09 = "0x2B4C60659E214763C74F1782932D030E1DD296B904D94204713BF4E1782B335090F3E82B0C8071A9" ;
    defparam SineLUT_1_0_0.INITVAL_08 = "0x2328A3F76C1BA4F3833314A17314FD0E1E32AECA07DB324E9C023861F8723D15E1AA4C3873A1642A" ;
    defparam SineLUT_1_0_0.INITVAL_07 = "0x3451B1280D30F000F5F52DEEA0CDE12BADA0ADD32A2CE099CA292C808FC728EC8091C9296CD09FD2" ;
    defparam SineLUT_1_0_0.INITVAL_06 = "0x2AAD80B9E02C8E90DDF42F5011100F32D1F14E303734319A583C76E1F486027A025CBC095D92D2F9" ;
    defparam SineLUT_1_0_0.INITVAL_05 = "0x1121A3573D19E613EB88238B108DDB2E30713C3639D661FE98065CD2CF0313E3B3B175226B20A3F0" ;
    defparam SineLUT_1_0_0.INITVAL_04 = "0x321311A47402DB82B8FF148493DD94274E1112313B58325AD71042E3B586266E11203E3DD9E29F00" ;
    defparam SineLUT_1_0_0.INITVAL_03 = "0x1646402FCB2FF331D29F0AA0C3897C26AEF1526403FDB32F55224D11204F021D13255422EDA13C63" ;
    defparam SineLUT_1_0_0.INITVAL_02 = "0x051EE36B7C2870C1AA9F0D2343FFCC33366269031A4A30E64502FE937B912CD3B222E717E970DE49" ;
    defparam SineLUT_1_0_0.INITVAL_01 = "0x047FD3B1B43236E2992B214EA194AC11C700A837038013CFCE36B9D30D6F2B34425F1B210F51C8D2" ;
    defparam SineLUT_1_0_0.INITVAL_00 = "0x184B21469410C790DA610AC4B08439060290441B02C110180900C0400401002020060500E0A01C13" ;
    defparam SineLUT_1_0_0.CSDECODE_B = "0b010" ;
    defparam SineLUT_1_0_0.CSDECODE_A = "0b010" ;
    defparam SineLUT_1_0_0.WRITEMODE_B = "NORMAL" ;
    defparam SineLUT_1_0_0.WRITEMODE_A = "NORMAL" ;
    defparam SineLUT_1_0_0.GSR = "ENABLED" ;
    defparam SineLUT_1_0_0.RESETMODE = "ASYNC" ;
    defparam SineLUT_1_0_0.REGMODE_B = "NOREG" ;
    defparam SineLUT_1_0_0.REGMODE_A = "NOREG" ;
    defparam SineLUT_1_0_0.DATA_WIDTH_B = 9 ;
    defparam SineLUT_1_0_0.DATA_WIDTH_A = 9 ;
    DP8KC SineLUT_1_0_0 (.DIA8(scuba_vlo), .DIA7(scuba_vlo), .DIA6(scuba_vlo), 
        .DIA5(scuba_vlo), .DIA4(scuba_vlo), .DIA3(scuba_vlo), .DIA2(scuba_vlo), 
        .DIA1(scuba_vlo), .DIA0(scuba_vlo), .ADA12(scuba_vlo), .ADA11(Address[8]), 
        .ADA10(Address[7]), .ADA9(Address[6]), .ADA8(Address[5]), .ADA7(Address[4]), 
        .ADA6(Address[3]), .ADA5(Address[2]), .ADA4(Address[1]), .ADA3(Address[0]), 
        .ADA2(scuba_vlo), .ADA1(scuba_vlo), .ADA0(scuba_vlo), .CEA(OutClockEn), 
        .OCEA(OutClockEn), .CLKA(OutClock), .WEA(scuba_vlo), .CSA2(scuba_vlo), 
        .CSA1(Address[10]), .CSA0(Address[9]), .RSTA(Reset), .DIB8(scuba_vlo), 
        .DIB7(scuba_vlo), .DIB6(scuba_vlo), .DIB5(scuba_vlo), .DIB4(scuba_vlo), 
        .DIB3(scuba_vlo), .DIB2(scuba_vlo), .DIB1(scuba_vlo), .DIB0(scuba_vlo), 
        .ADB12(scuba_vhi), .ADB11(Address[8]), .ADB10(Address[7]), .ADB9(Address[6]), 
        .ADB8(Address[5]), .ADB7(Address[4]), .ADB6(Address[3]), .ADB5(Address[2]), 
        .ADB4(Address[1]), .ADB3(Address[0]), .ADB2(scuba_vlo), .ADB1(scuba_vlo), 
        .ADB0(scuba_vlo), .CEB(OutClockEn), .OCEB(OutClockEn), .CLKB(OutClock), 
        .WEB(scuba_vlo), .CSB2(scuba_vlo), .CSB1(Address[10]), .CSB0(Address[9]), 
        .RSTB(Reset), .DOA8(mdout0_1_8), .DOA7(mdout0_1_7), .DOA6(mdout0_1_6), 
        .DOA5(mdout0_1_5), .DOA4(mdout0_1_4), .DOA3(mdout0_1_3), .DOA2(mdout0_1_2), 
        .DOA1(mdout0_1_1), .DOA0(mdout0_1_0), .DOB8(), .DOB7(), .DOB6(mdout0_1_15), 
        .DOB5(mdout0_1_14), .DOB4(mdout0_1_13), .DOB3(mdout0_1_12), .DOB2(mdout0_1_11), 
        .DOB1(mdout0_1_10), .DOB0(mdout0_1_9))
             /* synthesis MEM_LPC_FILE="SineLUT.lpc" */
             /* synthesis MEM_INIT_FILE="sin_lut1375.mem" */;

    VLO scuba_vlo_inst (.Z(scuba_vlo));

    FD1P3DX FF_0 (.D(Address[10]), .SP(OutClockEn), .CK(OutClock), .CD(scuba_vlo), 
        .Q(raddr10_ff))
             /* synthesis GSR="ENABLED" */;

    MUX21 mux_15 (.D0(mdout0_0_0), .D1(mdout0_1_0), .SD(raddr10_ff), .Z(Q[0]));

    MUX21 mux_14 (.D0(mdout0_0_1), .D1(mdout0_1_1), .SD(raddr10_ff), .Z(Q[1]));

    MUX21 mux_13 (.D0(mdout0_0_2), .D1(mdout0_1_2), .SD(raddr10_ff), .Z(Q[2]));

    MUX21 mux_12 (.D0(mdout0_0_3), .D1(mdout0_1_3), .SD(raddr10_ff), .Z(Q[3]));

    MUX21 mux_11 (.D0(mdout0_0_4), .D1(mdout0_1_4), .SD(raddr10_ff), .Z(Q[4]));

    MUX21 mux_10 (.D0(mdout0_0_5), .D1(mdout0_1_5), .SD(raddr10_ff), .Z(Q[5]));

    MUX21 mux_9 (.D0(mdout0_0_6), .D1(mdout0_1_6), .SD(raddr10_ff), .Z(Q[6]));

    MUX21 mux_8 (.D0(mdout0_0_7), .D1(mdout0_1_7), .SD(raddr10_ff), .Z(Q[7]));

    MUX21 mux_7 (.D0(mdout0_0_8), .D1(mdout0_1_8), .SD(raddr10_ff), .Z(Q[8]));

    MUX21 mux_6 (.D0(mdout0_0_9), .D1(mdout0_1_9), .SD(raddr10_ff), .Z(Q[9]));

    MUX21 mux_5 (.D0(mdout0_0_10), .D1(mdout0_1_10), .SD(raddr10_ff), .Z(Q[10]));

    MUX21 mux_4 (.D0(mdout0_0_11), .D1(mdout0_1_11), .SD(raddr10_ff), .Z(Q[11]));

    MUX21 mux_3 (.D0(mdout0_0_12), .D1(mdout0_1_12), .SD(raddr10_ff), .Z(Q[12]));

    MUX21 mux_2 (.D0(mdout0_0_13), .D1(mdout0_1_13), .SD(raddr10_ff), .Z(Q[13]));

    MUX21 mux_1 (.D0(mdout0_0_14), .D1(mdout0_1_14), .SD(raddr10_ff), .Z(Q[14]));

    MUX21 mux_0 (.D0(mdout0_0_15), .D1(mdout0_1_15), .SD(raddr10_ff), .Z(Q[15]));



    // exemplar begin
    // exemplar attribute SineLUT_0_0_2 MEM_LPC_FILE SineLUT.lpc
    // exemplar attribute SineLUT_0_0_2 MEM_INIT_FILE sin_lut1375.mem
    // exemplar attribute SineLUT_0_1_1 MEM_LPC_FILE SineLUT.lpc
    // exemplar attribute SineLUT_0_1_1 MEM_INIT_FILE sin_lut1375.mem
    // exemplar attribute SineLUT_1_0_0 MEM_LPC_FILE SineLUT.lpc
    // exemplar attribute SineLUT_1_0_0 MEM_INIT_FILE sin_lut1375.mem
    // exemplar attribute FF_0 GSR ENABLED
    // exemplar end

endmodule