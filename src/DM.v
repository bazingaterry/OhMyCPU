`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    02:00:36 03/03/2016
// Design Name:
// Module Name:    DM
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

`include "define.v"

module DM (
    input wire [15:0] addr,
    output wire [15:0] dout,
    input wire [15:0] din,
    input wire we,
    input wire clk,
    input wire reset
    );

reg [15:0] mem [`MEM_SIZE - 1:0];

always @ (posedge clk or posedge reset) begin
    if (reset) begin
mem [0] <= 1024;
mem [1] <= 103;
mem [2] <= 884;
mem [3] <= 522;
mem [4] <= 974;
mem [5] <= 756;
mem [6] <= 723;
mem [7] <= 3;
mem [8] <= 206;
mem [9] <= 260;
mem [10] <= 80;
mem [11] <= 735;
mem [12] <= 823;
mem [13] <= 343;
mem [14] <= 136;
mem [15] <= 666;
mem [16] <= 830;
mem [17] <= 674;
mem [18] <= 139;
mem [19] <= 379;
mem [20] <= 678;
mem [21] <= 516;
mem [22] <= 978;
mem [23] <= 268;
mem [24] <= 867;
mem [25] <= 374;
mem [26] <= 137;
mem [27] <= 83;
mem [28] <= 739;
mem [29] <= 372;
mem [30] <= 381;
mem [31] <= 302;
mem [32] <= 295;
mem [33] <= 260;
mem [34] <= 463;
mem [35] <= 988;
mem [36] <= 385;
mem [37] <= 943;
mem [38] <= 167;
mem [39] <= 925;
mem [40] <= 754;
mem [41] <= 857;
mem [42] <= 602;
mem [43] <= 107;
mem [44] <= 455;
mem [45] <= 655;
mem [46] <= 58;
mem [47] <= 21;
mem [48] <= 290;
mem [49] <= 931;
mem [50] <= 514;
mem [51] <= 875;
mem [52] <= 378;
mem [53] <= 885;
mem [54] <= 535;
mem [55] <= 893;
mem [56] <= 103;
mem [57] <= 212;
mem [58] <= 702;
mem [59] <= 361;
mem [60] <= 1;
mem [61] <= 384;
mem [62] <= 320;
mem [63] <= 393;
mem [64] <= 181;
mem [65] <= 209;
mem [66] <= 594;
mem [67] <= 594;
mem [68] <= 172;
mem [69] <= 933;
mem [70] <= 56;
mem [71] <= 202;
mem [72] <= 508;
mem [73] <= 759;
mem [74] <= 146;
mem [75] <= 931;
mem [76] <= 422;
mem [77] <= 56;
mem [78] <= 674;
mem [79] <= 280;
mem [80] <= 780;
mem [81] <= 963;
mem [82] <= 688;
mem [83] <= 498;
mem [84] <= 99;
mem [85] <= 288;
mem [86] <= 538;
mem [87] <= 11;
mem [88] <= 283;
mem [89] <= 590;
mem [90] <= 172;
mem [91] <= 170;
mem [92] <= 676;
mem [93] <= 570;
mem [94] <= 552;
mem [95] <= 967;
mem [96] <= 628;
mem [97] <= 325;
mem [98] <= 521;
mem [99] <= 865;
mem [100] <= 994;
mem [101] <= 838;
mem [102] <= 347;
mem [103] <= 749;
mem [104] <= 939;
mem [105] <= 668;
mem [106] <= 481;
mem [107] <= 286;
mem [108] <= 595;
mem [109] <= 336;
mem [110] <= 960;
mem [111] <= 442;
mem [112] <= 962;
mem [113] <= 676;
mem [114] <= 706;
mem [115] <= 958;
mem [116] <= 940;
mem [117] <= 834;
mem [118] <= 155;
mem [119] <= 830;
mem [120] <= 464;
mem [121] <= 299;
mem [122] <= 523;
mem [123] <= 832;
mem [124] <= 539;
mem [125] <= 260;
mem [126] <= 354;
mem [127] <= 187;
mem [128] <= 351;
mem [129] <= 190;
mem [130] <= 836;
mem [131] <= 384;
mem [132] <= 9;
mem [133] <= 309;
mem [134] <= 837;
mem [135] <= 281;
mem [136] <= 781;
mem [137] <= 532;
mem [138] <= 154;
mem [139] <= 525;
mem [140] <= 283;
mem [141] <= 715;
mem [142] <= 734;
mem [143] <= 450;
mem [144] <= 182;
mem [145] <= 136;
mem [146] <= 273;
mem [147] <= 636;
mem [148] <= 806;
mem [149] <= 668;
mem [150] <= 287;
mem [151] <= 142;
mem [152] <= 246;
mem [153] <= 692;
mem [154] <= 72;
mem [155] <= 499;
mem [156] <= 986;
mem [157] <= 905;
mem [158] <= 575;
mem [159] <= 767;
mem [160] <= 747;
mem [161] <= 695;
mem [162] <= 677;
mem [163] <= 282;
mem [164] <= 582;
mem [165] <= 619;
mem [166] <= 814;
mem [167] <= 16;
mem [168] <= 214;
mem [169] <= 988;
mem [170] <= 817;
mem [171] <= 632;
mem [172] <= 682;
mem [173] <= 808;
mem [174] <= 280;
mem [175] <= 665;
mem [176] <= 29;
mem [177] <= 544;
mem [178] <= 529;
mem [179] <= 873;
mem [180] <= 188;
mem [181] <= 931;
mem [182] <= 976;
mem [183] <= 331;
mem [184] <= 624;
mem [185] <= 527;
mem [186] <= 459;
mem [187] <= 359;
mem [188] <= 334;
mem [189] <= 83;
mem [190] <= 390;
mem [191] <= 239;
mem [192] <= 486;
mem [193] <= 700;
mem [194] <= 137;
mem [195] <= 826;
mem [196] <= 930;
mem [197] <= 829;
mem [198] <= 485;
mem [199] <= 660;
mem [200] <= 456;
mem [201] <= 418;
mem [202] <= 34;
mem [203] <= 927;
mem [204] <= 43;
mem [205] <= 476;
mem [206] <= 386;
mem [207] <= 534;
mem [208] <= 998;
mem [209] <= 902;
mem [210] <= 15;
mem [211] <= 781;
mem [212] <= 485;
mem [213] <= 390;
mem [214] <= 823;
mem [215] <= 874;
mem [216] <= 998;
mem [217] <= 196;
mem [218] <= 870;
mem [219] <= 307;
mem [220] <= 411;
mem [221] <= 816;
mem [222] <= 368;
mem [223] <= 426;
mem [224] <= 91;
mem [225] <= 667;
mem [226] <= 731;
mem [227] <= 301;
mem [228] <= 338;
mem [229] <= 734;
mem [230] <= 985;
mem [231] <= 699;
mem [232] <= 90;
mem [233] <= 471;
mem [234] <= 635;
mem [235] <= 525;
mem [236] <= 141;
mem [237] <= 276;
mem [238] <= 987;
mem [239] <= 795;
mem [240] <= 933;
mem [241] <= 348;
mem [242] <= 209;
mem [243] <= 680;
mem [244] <= 355;
mem [245] <= 438;
mem [246] <= 909;
mem [247] <= 834;
mem [248] <= 391;
mem [249] <= 734;
mem [250] <= 291;
mem [251] <= 292;
mem [252] <= 297;
mem [253] <= 25;
mem [254] <= 918;
mem [255] <= 686;
mem [256] <= 234;
mem [257] <= 497;
mem [258] <= 791;
mem [259] <= 380;
mem [260] <= 219;
mem [261] <= 723;
mem [262] <= 773;
mem [263] <= 693;
mem [264] <= 620;
mem [265] <= 762;
mem [266] <= 511;
mem [267] <= 329;
mem [268] <= 1;
mem [269] <= 581;
mem [270] <= 172;
mem [271] <= 195;
mem [272] <= 150;
mem [273] <= 505;
mem [274] <= 17;
mem [275] <= 471;
mem [276] <= 46;
mem [277] <= 442;
mem [278] <= 164;
mem [279] <= 572;
mem [280] <= 818;
mem [281] <= 85;
mem [282] <= 233;
mem [283] <= 246;
mem [284] <= 352;
mem [285] <= 409;
mem [286] <= 114;
mem [287] <= 407;
mem [288] <= 676;
mem [289] <= 543;
mem [290] <= 357;
mem [291] <= 662;
mem [292] <= 679;
mem [293] <= 132;
mem [294] <= 440;
mem [295] <= 937;
mem [296] <= 570;
mem [297] <= 578;
mem [298] <= 765;
mem [299] <= 247;
mem [300] <= 694;
mem [301] <= 295;
mem [302] <= 571;
mem [303] <= 635;
mem [304] <= 399;
mem [305] <= 249;
mem [306] <= 935;
mem [307] <= 449;
mem [308] <= 532;
mem [309] <= 635;
mem [310] <= 668;
mem [311] <= 439;
mem [312] <= 173;
mem [313] <= 694;
mem [314] <= 925;
mem [315] <= 371;
mem [316] <= 639;
mem [317] <= 890;
mem [318] <= 483;
mem [319] <= 630;
mem [320] <= 465;
mem [321] <= 109;
mem [322] <= 113;
mem [323] <= 108;
mem [324] <= 446;
mem [325] <= 939;
mem [326] <= 634;
mem [327] <= 930;
mem [328] <= 63;
mem [329] <= 307;
mem [330] <= 950;
mem [331] <= 10;
mem [332] <= 168;
mem [333] <= 755;
mem [334] <= 834;
mem [335] <= 606;
mem [336] <= 518;
mem [337] <= 943;
mem [338] <= 741;
mem [339] <= 701;
mem [340] <= 745;
mem [341] <= 874;
mem [342] <= 964;
mem [343] <= 982;
mem [344] <= 919;
mem [345] <= 283;
mem [346] <= 59;
mem [347] <= 821;
mem [348] <= 180;
mem [349] <= 35;
mem [350] <= 771;
mem [351] <= 541;
mem [352] <= 332;
mem [353] <= 578;
mem [354] <= 855;
mem [355] <= 642;
mem [356] <= 420;
mem [357] <= 546;
mem [358] <= 182;
mem [359] <= 236;
mem [360] <= 205;
mem [361] <= 260;
mem [362] <= 943;
mem [363] <= 642;
mem [364] <= 829;
mem [365] <= 389;
mem [366] <= 168;
mem [367] <= 740;
mem [368] <= 873;
mem [369] <= 356;
mem [370] <= 179;
mem [371] <= 996;
mem [372] <= 959;
mem [373] <= 156;
mem [374] <= 929;
mem [375] <= 425;
mem [376] <= 223;
mem [377] <= 136;
mem [378] <= 260;
mem [379] <= 544;
mem [380] <= 82;
mem [381] <= 598;
mem [382] <= 29;
mem [383] <= 455;
mem [384] <= 332;
mem [385] <= 944;
mem [386] <= 303;
mem [387] <= 428;
mem [388] <= 661;
mem [389] <= 381;
mem [390] <= 136;
mem [391] <= 97;
mem [392] <= 305;
mem [393] <= 824;
mem [394] <= 627;
mem [395] <= 206;
mem [396] <= 980;
mem [397] <= 438;
mem [398] <= 835;
mem [399] <= 539;
mem [400] <= 25;
mem [401] <= 7;
mem [402] <= 786;
mem [403] <= 447;
mem [404] <= 289;
mem [405] <= 863;
mem [406] <= 656;
mem [407] <= 285;
mem [408] <= 645;
mem [409] <= 264;
mem [410] <= 175;
mem [411] <= 369;
mem [412] <= 538;
mem [413] <= 926;
mem [414] <= 749;
mem [415] <= 148;
mem [416] <= 3;
mem [417] <= 127;
mem [418] <= 917;
mem [419] <= 672;
mem [420] <= 114;
mem [421] <= 960;
mem [422] <= 119;
mem [423] <= 492;
mem [424] <= 361;
mem [425] <= 470;
mem [426] <= 59;
mem [427] <= 330;
mem [428] <= 265;
mem [429] <= 246;
mem [430] <= 948;
mem [431] <= 32;
mem [432] <= 906;
mem [433] <= 368;
mem [434] <= 663;
mem [435] <= 954;
mem [436] <= 94;
mem [437] <= 685;
mem [438] <= 412;
mem [439] <= 112;
mem [440] <= 492;
mem [441] <= 462;
mem [442] <= 877;
mem [443] <= 660;
mem [444] <= 278;
mem [445] <= 657;
mem [446] <= 645;
mem [447] <= 897;
mem [448] <= 882;
mem [449] <= 335;
mem [450] <= 427;
mem [451] <= 804;
mem [452] <= 923;
mem [453] <= 867;
mem [454] <= 500;
mem [455] <= 584;
mem [456] <= 925;
mem [457] <= 166;
mem [458] <= 374;
mem [459] <= 259;
mem [460] <= 830;
mem [461] <= 70;
mem [462] <= 281;
mem [463] <= 555;
mem [464] <= 619;
mem [465] <= 410;
mem [466] <= 258;
mem [467] <= 417;
mem [468] <= 382;
mem [469] <= 96;
mem [470] <= 131;
mem [471] <= 610;
mem [472] <= 656;
mem [473] <= 841;
mem [474] <= 500;
mem [475] <= 307;
mem [476] <= 170;
mem [477] <= 49;
mem [478] <= 226;
mem [479] <= 367;
mem [480] <= 568;
mem [481] <= 570;
mem [482] <= 779;
mem [483] <= 590;
mem [484] <= 111;
mem [485] <= 641;
mem [486] <= 72;
mem [487] <= 366;
mem [488] <= 287;
mem [489] <= 741;
mem [490] <= 67;
mem [491] <= 757;
mem [492] <= 241;
mem [493] <= 231;
mem [494] <= 12;
mem [495] <= 132;
mem [496] <= 209;
mem [497] <= 214;
mem [498] <= 906;
mem [499] <= 278;
mem [500] <= 97;
mem [501] <= 783;
mem [502] <= 668;
mem [503] <= 613;
mem [504] <= 344;
mem [505] <= 690;
mem [506] <= 234;
mem [507] <= 308;
mem [508] <= 357;
mem [509] <= 217;
mem [510] <= 677;
mem [511] <= 736;
mem [512] <= 10;
mem [513] <= 356;
mem [514] <= 240;
mem [515] <= 928;
mem [516] <= 763;
mem [517] <= 379;
mem [518] <= 686;
mem [519] <= 699;
mem [520] <= 590;
mem [521] <= 962;
mem [522] <= 781;
mem [523] <= 538;
mem [524] <= 94;
mem [525] <= 886;
mem [526] <= 257;
mem [527] <= 464;
mem [528] <= 331;
mem [529] <= 757;
mem [530] <= 803;
mem [531] <= 803;
mem [532] <= 877;
mem [533] <= 87;
mem [534] <= 668;
mem [535] <= 502;
mem [536] <= 336;
mem [537] <= 589;
mem [538] <= 352;
mem [539] <= 207;
mem [540] <= 262;
mem [541] <= 99;
mem [542] <= 150;
mem [543] <= 321;
mem [544] <= 594;
mem [545] <= 154;
mem [546] <= 63;
mem [547] <= 8;
mem [548] <= 774;
mem [549] <= 682;
mem [550] <= 121;
mem [551] <= 719;
mem [552] <= 162;
mem [553] <= 120;
mem [554] <= 681;
mem [555] <= 145;
mem [556] <= 58;
mem [557] <= 135;
mem [558] <= 15;
mem [559] <= 189;
mem [560] <= 71;
mem [561] <= 38;
mem [562] <= 308;
mem [563] <= 516;
mem [564] <= 394;
mem [565] <= 995;
mem [566] <= 440;
mem [567] <= 151;
mem [568] <= 778;
mem [569] <= 741;
mem [570] <= 88;
mem [571] <= 470;
mem [572] <= 293;
mem [573] <= 407;
mem [574] <= 430;
mem [575] <= 871;
mem [576] <= 707;
mem [577] <= 14;
mem [578] <= 25;
mem [579] <= 237;
mem [580] <= 598;
mem [581] <= 926;
mem [582] <= 334;
mem [583] <= 443;
mem [584] <= 99;
mem [585] <= 715;
mem [586] <= 722;
mem [587] <= 782;
mem [588] <= 942;
mem [589] <= 48;
mem [590] <= 800;
mem [591] <= 467;
mem [592] <= 279;
mem [593] <= 45;
mem [594] <= 788;
mem [595] <= 899;
mem [596] <= 776;
mem [597] <= 837;
mem [598] <= 344;
mem [599] <= 191;
mem [600] <= 378;
mem [601] <= 256;
mem [602] <= 21;
mem [603] <= 293;
mem [604] <= 240;
mem [605] <= 203;
mem [606] <= 348;
mem [607] <= 537;
mem [608] <= 124;
mem [609] <= 193;
mem [610] <= 489;
mem [611] <= 407;
mem [612] <= 735;
mem [613] <= 300;
mem [614] <= 807;
mem [615] <= 914;
mem [616] <= 765;
mem [617] <= 334;
mem [618] <= 719;
mem [619] <= 34;
mem [620] <= 616;
mem [621] <= 112;
mem [622] <= 51;
mem [623] <= 55;
mem [624] <= 26;
mem [625] <= 955;
mem [626] <= 525;
mem [627] <= 756;
mem [628] <= 590;
mem [629] <= 739;
mem [630] <= 319;
mem [631] <= 848;
mem [632] <= 494;
mem [633] <= 115;
mem [634] <= 812;
mem [635] <= 667;
mem [636] <= 382;
mem [637] <= 719;
mem [638] <= 419;
mem [639] <= 56;
mem [640] <= 585;
mem [641] <= 299;
mem [642] <= 410;
mem [643] <= 586;
mem [644] <= 316;
mem [645] <= 147;
mem [646] <= 992;
mem [647] <= 107;
mem [648] <= 334;
mem [649] <= 38;
mem [650] <= 922;
mem [651] <= 373;
mem [652] <= 989;
mem [653] <= 543;
mem [654] <= 563;
mem [655] <= 188;
mem [656] <= 215;
mem [657] <= 485;
mem [658] <= 220;
mem [659] <= 937;
mem [660] <= 278;
mem [661] <= 953;
mem [662] <= 815;
mem [663] <= 350;
mem [664] <= 22;
mem [665] <= 341;
mem [666] <= 384;
mem [667] <= 93;
mem [668] <= 969;
mem [669] <= 190;
mem [670] <= 165;
mem [671] <= 507;
mem [672] <= 508;
mem [673] <= 51;
mem [674] <= 367;
mem [675] <= 585;
mem [676] <= 995;
mem [677] <= 435;
mem [678] <= 696;
mem [679] <= 16;
mem [680] <= 153;
mem [681] <= 900;
mem [682] <= 46;
mem [683] <= 29;
mem [684] <= 574;
mem [685] <= 340;
mem [686] <= 219;
mem [687] <= 904;
mem [688] <= 683;
mem [689] <= 372;
mem [690] <= 401;
mem [691] <= 205;
mem [692] <= 238;
mem [693] <= 884;
mem [694] <= 921;
mem [695] <= 782;
mem [696] <= 242;
mem [697] <= 584;
mem [698] <= 202;
mem [699] <= 127;
mem [700] <= 688;
mem [701] <= 911;
mem [702] <= 751;
mem [703] <= 823;
mem [704] <= 225;
mem [705] <= 387;
mem [706] <= 419;
mem [707] <= 936;
mem [708] <= 106;
mem [709] <= 531;
mem [710] <= 621;
mem [711] <= 280;
mem [712] <= 198;
mem [713] <= 408;
mem [714] <= 363;
mem [715] <= 162;
mem [716] <= 894;
mem [717] <= 440;
mem [718] <= 670;
mem [719] <= 210;
mem [720] <= 471;
mem [721] <= 50;
mem [722] <= 496;
mem [723] <= 270;
mem [724] <= 684;
mem [725] <= 748;
mem [726] <= 392;
mem [727] <= 559;
mem [728] <= 732;
mem [729] <= 612;
mem [730] <= 581;
mem [731] <= 71;
mem [732] <= 374;
mem [733] <= 34;
mem [734] <= 406;
mem [735] <= 658;
mem [736] <= 575;
mem [737] <= 976;
mem [738] <= 442;
mem [739] <= 778;
mem [740] <= 569;
mem [741] <= 21;
mem [742] <= 512;
mem [743] <= 408;
mem [744] <= 220;
mem [745] <= 230;
mem [746] <= 439;
mem [747] <= 920;
mem [748] <= 319;
mem [749] <= 284;
mem [750] <= 364;
mem [751] <= 499;
mem [752] <= 814;
mem [753] <= 235;
mem [754] <= 22;
mem [755] <= 301;
mem [756] <= 298;
mem [757] <= 826;
mem [758] <= 136;
mem [759] <= 815;
mem [760] <= 861;
mem [761] <= 553;
mem [762] <= 19;
mem [763] <= 508;
mem [764] <= 714;
mem [765] <= 698;
mem [766] <= 893;
mem [767] <= 701;
mem [768] <= 937;
mem [769] <= 11;
mem [770] <= 820;
mem [771] <= 34;
mem [772] <= 516;
mem [773] <= 653;
mem [774] <= 754;
mem [775] <= 280;
mem [776] <= 603;
mem [777] <= 889;
mem [778] <= 643;
mem [779] <= 786;
mem [780] <= 491;
mem [781] <= 403;
mem [782] <= 877;
mem [783] <= 708;
mem [784] <= 826;
mem [785] <= 11;
mem [786] <= 96;
mem [787] <= 543;
mem [788] <= 856;
mem [789] <= 264;
mem [790] <= 776;
mem [791] <= 638;
mem [792] <= 725;
mem [793] <= 895;
mem [794] <= 768;
mem [795] <= 207;
mem [796] <= 43;
mem [797] <= 154;
mem [798] <= 718;
mem [799] <= 129;
mem [800] <= 221;
mem [801] <= 454;
mem [802] <= 465;
mem [803] <= 90;
mem [804] <= 507;
mem [805] <= 77;
mem [806] <= 167;
mem [807] <= 748;
mem [808] <= 335;
mem [809] <= 305;
mem [810] <= 819;
mem [811] <= 982;
mem [812] <= 969;
mem [813] <= 577;
mem [814] <= 233;
mem [815] <= 292;
mem [816] <= 674;
mem [817] <= 574;
mem [818] <= 200;
mem [819] <= 958;
mem [820] <= 336;
mem [821] <= 150;
mem [822] <= 328;
mem [823] <= 113;
mem [824] <= 772;
mem [825] <= 793;
mem [826] <= 587;
mem [827] <= 79;
mem [828] <= 193;
mem [829] <= 775;
mem [830] <= 353;
mem [831] <= 839;
mem [832] <= 134;
mem [833] <= 698;
mem [834] <= 190;
mem [835] <= 397;
mem [836] <= 339;
mem [837] <= 923;
mem [838] <= 838;
mem [839] <= 630;
mem [840] <= 865;
mem [841] <= 216;
mem [842] <= 65;
mem [843] <= 678;
mem [844] <= 535;
mem [845] <= 517;
mem [846] <= 256;
mem [847] <= 853;
mem [848] <= 823;
mem [849] <= 17;
mem [850] <= 475;
mem [851] <= 944;
mem [852] <= 459;
mem [853] <= 850;
mem [854] <= 536;
mem [855] <= 434;
mem [856] <= 24;
mem [857] <= 504;
mem [858] <= 876;
mem [859] <= 908;
mem [860] <= 285;
mem [861] <= 133;
mem [862] <= 0;
mem [863] <= 318;
mem [864] <= 530;
mem [865] <= 829;
mem [866] <= 674;
mem [867] <= 913;
mem [868] <= 756;
mem [869] <= 169;
mem [870] <= 964;
mem [871] <= 348;
mem [872] <= 598;
mem [873] <= 731;
mem [874] <= 871;
mem [875] <= 333;
mem [876] <= 463;
mem [877] <= 167;
mem [878] <= 466;
mem [879] <= 456;
mem [880] <= 128;
mem [881] <= 640;
mem [882] <= 896;
mem [883] <= 427;
mem [884] <= 176;
mem [885] <= 295;
mem [886] <= 59;
mem [887] <= 60;
mem [888] <= 27;
mem [889] <= 550;
mem [890] <= 563;
mem [891] <= 305;
mem [892] <= 755;
mem [893] <= 671;
mem [894] <= 940;
mem [895] <= 485;
mem [896] <= 518;
mem [897] <= 789;
mem [898] <= 571;
mem [899] <= 766;
mem [900] <= 920;
mem [901] <= 210;
mem [902] <= 608;
mem [903] <= 466;
mem [904] <= 617;
mem [905] <= 203;
mem [906] <= 678;
mem [907] <= 17;
mem [908] <= 227;
mem [909] <= 914;
mem [910] <= 768;
mem [911] <= 533;
mem [912] <= 68;
mem [913] <= 200;
mem [914] <= 12;
mem [915] <= 967;
mem [916] <= 832;
mem [917] <= 445;
mem [918] <= 990;
mem [919] <= 794;
mem [920] <= 489;
mem [921] <= 131;
mem [922] <= 212;
mem [923] <= 831;
mem [924] <= 324;
mem [925] <= 739;
mem [926] <= 160;
mem [927] <= 731;
mem [928] <= 54;
mem [929] <= 714;
mem [930] <= 122;
mem [931] <= 984;
mem [932] <= 593;
mem [933] <= 270;
mem [934] <= 432;
mem [935] <= 931;
mem [936] <= 508;
mem [937] <= 64;
mem [938] <= 659;
mem [939] <= 449;
mem [940] <= 147;
mem [941] <= 775;
mem [942] <= 531;
mem [943] <= 88;
mem [944] <= 900;
mem [945] <= 868;
mem [946] <= 56;
mem [947] <= 640;
mem [948] <= 889;
mem [949] <= 348;
mem [950] <= 667;
mem [951] <= 454;
mem [952] <= 447;
mem [953] <= 17;
mem [954] <= 861;
mem [955] <= 938;
mem [956] <= 479;
mem [957] <= 570;
mem [958] <= 993;
mem [959] <= 404;
mem [960] <= 220;
mem [961] <= 866;
mem [962] <= 689;
mem [963] <= 171;
mem [964] <= 9;
mem [965] <= 169;
mem [966] <= 206;
mem [967] <= 902;
mem [968] <= 709;
mem [969] <= 132;
mem [970] <= 425;
mem [971] <= 661;
mem [972] <= 322;
mem [973] <= 597;
mem [974] <= 211;
mem [975] <= 190;
mem [976] <= 208;
mem [977] <= 713;
mem [978] <= 253;
mem [979] <= 270;
mem [980] <= 482;
mem [981] <= 221;
mem [982] <= 355;
mem [983] <= 638;
mem [984] <= 750;
mem [985] <= 492;
mem [986] <= 617;
mem [987] <= 319;
mem [988] <= 302;
mem [989] <= 142;
mem [990] <= 844;
mem [991] <= 288;
mem [992] <= 909;
mem [993] <= 113;
mem [994] <= 614;
mem [995] <= 284;
mem [996] <= 508;
mem [997] <= 539;
mem [998] <= 52;
mem [999] <= 437;
mem [1000] <= 219;
mem [1001] <= 918;
mem [1002] <= 691;
mem [1003] <= 116;
mem [1004] <= 360;
mem [1005] <= 306;
mem [1006] <= 302;
mem [1007] <= 561;
mem [1008] <= 796;
mem [1009] <= 470;
mem [1010] <= 791;
mem [1011] <= 419;
mem [1012] <= 740;
mem [1013] <= 358;
mem [1014] <= 950;
mem [1015] <= 750;
mem [1016] <= 20;
mem [1017] <= 755;
mem [1018] <= 912;
mem [1019] <= 348;
mem [1020] <= 71;
mem [1021] <= 855;
mem [1022] <= 94;
mem [1023] <= 550;
mem [1024] <= 123;
    end
    else if (we) begin
        mem[addr] <= din;
    end
end

assign dout = mem[addr];

endmodule
