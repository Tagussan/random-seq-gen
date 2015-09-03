module randomPermGen(clk, rst, seq_all);
    input clk, rst;
    output [63:0] seq_all;
    reg [31:0] rotaryPos;
    always @(posedge clk or posedge rst) begin
        if (rst)
            rotaryPos <= 0;
        else begin
            rotaryPos <= rotaryPos + 1;
        end
    end
    wire [63:0] rmapin0, rmapin1, rmapin2, rmapin3, rmapin4, rmapin5, rmapin6, rmapin7;
    wire [63:0] randwirein0, randwirein1, randwirein2, randwirein3, randwirein4, randwirein5, randwirein6, randwirein7;
    rotateMapper16 rmap0(.A_all({4'b0000, 4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111, 4'b1000, 4'b1001, 4'b1010, 4'b1011, 4'b1100, 4'b1101, 4'b1110, 4'b1111}), .B_all(randwirein0), .shift(rotaryPos[3:0]));
    randomPerm0 rperm0(.A_all(randwirein0), .B_all(rmapin1));
    rotateMapper16 rmap1(.A_all(rmapin1), .B_all(randwirein1), .shift(rotaryPos[7:4]));
    randomPerm1 rperm1(.A_all(randwirein1), .B_all(rmapin2));
    rotateMapper16 rmap2(.A_all(rmapin2), .B_all(randwirein2), .shift(rotaryPos[11:8]));
    randomPerm2 rperm2(.A_all(randwirein2), .B_all(rmapin3));
    rotateMapper16 rmap3(.A_all(rmapin3), .B_all(randwirein3), .shift(rotaryPos[15:12]));
    randomPerm3 rperm3(.A_all(randwirein3), .B_all(rmapin4));
    rotateMapper16 rmap4(.A_all(rmapin4), .B_all(randwirein4), .shift(rotaryPos[19:16]));
    randomPerm4 rperm4(.A_all(randwirein4), .B_all(rmapin5));
    rotateMapper16 rmap5(.A_all(rmapin5), .B_all(randwirein5), .shift(rotaryPos[23:20]));
    randomPerm5 rperm5(.A_all(randwirein5), .B_all(rmapin6));
    rotateMapper16 rmap6(.A_all(rmapin6), .B_all(randwirein6), .shift(rotaryPos[27:24]));
    randomPerm6 rperm6(.A_all(randwirein6), .B_all(rmapin7));
    rotateMapper16 rmap7(.A_all(rmapin7), .B_all(randwirein7), .shift(rotaryPos[31:28]));
    randomPerm7 rperm7(.A_all(randwirein7), .B_all(seq_all));
endmodule

module rotateMapper16(A_all, B_all, shift);
    input clk, rst;
    input [63:0] A_all;
    input [3:0] shift;
    output [63:0] B_all;
    rotateSelect16 rot0(.A_all(A_all), .shift(4'd0 + shift), .res(B_all[3:0]));
    rotateSelect16 rot1(.A_all(A_all), .shift(4'd1 + shift), .res(B_all[7:4]));
    rotateSelect16 rot2(.A_all(A_all), .shift(4'd2 + shift), .res(B_all[11:8]));
    rotateSelect16 rot3(.A_all(A_all), .shift(4'd3 + shift), .res(B_all[15:12]));
    rotateSelect16 rot4(.A_all(A_all), .shift(4'd4 + shift), .res(B_all[19:16]));
    rotateSelect16 rot5(.A_all(A_all), .shift(4'd5 + shift), .res(B_all[23:20]));
    rotateSelect16 rot6(.A_all(A_all), .shift(4'd6 + shift), .res(B_all[27:24]));
    rotateSelect16 rot7(.A_all(A_all), .shift(4'd7 + shift), .res(B_all[31:28]));
    rotateSelect16 rot8(.A_all(A_all), .shift(4'd8 + shift), .res(B_all[35:32]));
    rotateSelect16 rot9(.A_all(A_all), .shift(4'd9 + shift), .res(B_all[39:36]));
    rotateSelect16 rot10(.A_all(A_all), .shift(4'd10 + shift), .res(B_all[43:40]));
    rotateSelect16 rot11(.A_all(A_all), .shift(4'd11 + shift), .res(B_all[47:44]));
    rotateSelect16 rot12(.A_all(A_all), .shift(4'd12 + shift), .res(B_all[51:48]));
    rotateSelect16 rot13(.A_all(A_all), .shift(4'd13 + shift), .res(B_all[55:52]));
    rotateSelect16 rot14(.A_all(A_all), .shift(4'd14 + shift), .res(B_all[59:56]));
    rotateSelect16 rot15(.A_all(A_all), .shift(4'd15 + shift), .res(B_all[63:60]));
endmodule

module rotateSelect16(A_all, shift, res);
    input [3:0] shift;
    output [3:0] res;
    input [63:0] A_all;
    function [5:0] startbit;
        input [3:0] shift;
        startbit = {shift, 2'b00}; 
    endfunction
    assign res = {A_all[5'd3 + startbit(shift)], A_all[5'd2 + startbit(shift)], A_all[5'd1 + startbit(shift)], A_all[5'd0 + startbit(shift)]};
endmodule

//0th: [11, 1, 8, 5, 14, 13, 7, 4, 15, 0, 6, 12, 10, 3, 9, 2]
module randomPerm0(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[47:44];
    assign B_all[7:4] = A_all[7:4];
    assign B_all[11:8] = A_all[35:32];
    assign B_all[15:12] = A_all[23:20];
    assign B_all[19:16] = A_all[59:56];
    assign B_all[23:20] = A_all[55:52];
    assign B_all[27:24] = A_all[31:28];
    assign B_all[31:28] = A_all[19:16];
    assign B_all[35:32] = A_all[63:60];
    assign B_all[39:36] = A_all[3:0];
    assign B_all[43:40] = A_all[27:24];
    assign B_all[47:44] = A_all[51:48];
    assign B_all[51:48] = A_all[43:40];
    assign B_all[55:52] = A_all[15:12];
    assign B_all[59:56] = A_all[39:36];
    assign B_all[63:60] = A_all[11:8];
endmodule
//1th: [9, 4, 15, 1, 2, 7, 14, 5, 10, 0, 11, 13, 6, 3, 12, 8]
module randomPerm1(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[39:36];
    assign B_all[7:4] = A_all[19:16];
    assign B_all[11:8] = A_all[63:60];
    assign B_all[15:12] = A_all[7:4];
    assign B_all[19:16] = A_all[11:8];
    assign B_all[23:20] = A_all[31:28];
    assign B_all[27:24] = A_all[59:56];
    assign B_all[31:28] = A_all[23:20];
    assign B_all[35:32] = A_all[43:40];
    assign B_all[39:36] = A_all[3:0];
    assign B_all[43:40] = A_all[47:44];
    assign B_all[47:44] = A_all[55:52];
    assign B_all[51:48] = A_all[27:24];
    assign B_all[55:52] = A_all[15:12];
    assign B_all[59:56] = A_all[51:48];
    assign B_all[63:60] = A_all[35:32];
endmodule
//2th: [4, 5, 0, 11, 12, 9, 7, 2, 3, 8, 14, 15, 13, 1, 6, 10]
module randomPerm2(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[19:16];
    assign B_all[7:4] = A_all[23:20];
    assign B_all[11:8] = A_all[3:0];
    assign B_all[15:12] = A_all[47:44];
    assign B_all[19:16] = A_all[51:48];
    assign B_all[23:20] = A_all[39:36];
    assign B_all[27:24] = A_all[31:28];
    assign B_all[31:28] = A_all[11:8];
    assign B_all[35:32] = A_all[15:12];
    assign B_all[39:36] = A_all[35:32];
    assign B_all[43:40] = A_all[59:56];
    assign B_all[47:44] = A_all[63:60];
    assign B_all[51:48] = A_all[55:52];
    assign B_all[55:52] = A_all[7:4];
    assign B_all[59:56] = A_all[27:24];
    assign B_all[63:60] = A_all[43:40];
endmodule
//3th: [6, 5, 1, 15, 8, 11, 10, 12, 4, 0, 2, 9, 3, 14, 13, 7]
module randomPerm3(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[27:24];
    assign B_all[7:4] = A_all[23:20];
    assign B_all[11:8] = A_all[7:4];
    assign B_all[15:12] = A_all[63:60];
    assign B_all[19:16] = A_all[35:32];
    assign B_all[23:20] = A_all[47:44];
    assign B_all[27:24] = A_all[43:40];
    assign B_all[31:28] = A_all[51:48];
    assign B_all[35:32] = A_all[19:16];
    assign B_all[39:36] = A_all[3:0];
    assign B_all[43:40] = A_all[11:8];
    assign B_all[47:44] = A_all[39:36];
    assign B_all[51:48] = A_all[15:12];
    assign B_all[55:52] = A_all[59:56];
    assign B_all[59:56] = A_all[55:52];
    assign B_all[63:60] = A_all[31:28];
endmodule
//4th: [13, 8, 4, 14, 3, 7, 11, 15, 10, 6, 1, 5, 12, 0, 2, 9]
module randomPerm4(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[55:52];
    assign B_all[7:4] = A_all[35:32];
    assign B_all[11:8] = A_all[19:16];
    assign B_all[15:12] = A_all[59:56];
    assign B_all[19:16] = A_all[15:12];
    assign B_all[23:20] = A_all[31:28];
    assign B_all[27:24] = A_all[47:44];
    assign B_all[31:28] = A_all[63:60];
    assign B_all[35:32] = A_all[43:40];
    assign B_all[39:36] = A_all[27:24];
    assign B_all[43:40] = A_all[7:4];
    assign B_all[47:44] = A_all[23:20];
    assign B_all[51:48] = A_all[51:48];
    assign B_all[55:52] = A_all[3:0];
    assign B_all[59:56] = A_all[11:8];
    assign B_all[63:60] = A_all[39:36];
endmodule
//5th: [8, 13, 2, 5, 4, 9, 15, 7, 11, 6, 12, 0, 10, 3, 1, 14]
module randomPerm5(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[35:32];
    assign B_all[7:4] = A_all[55:52];
    assign B_all[11:8] = A_all[11:8];
    assign B_all[15:12] = A_all[23:20];
    assign B_all[19:16] = A_all[19:16];
    assign B_all[23:20] = A_all[39:36];
    assign B_all[27:24] = A_all[63:60];
    assign B_all[31:28] = A_all[31:28];
    assign B_all[35:32] = A_all[47:44];
    assign B_all[39:36] = A_all[27:24];
    assign B_all[43:40] = A_all[51:48];
    assign B_all[47:44] = A_all[3:0];
    assign B_all[51:48] = A_all[43:40];
    assign B_all[55:52] = A_all[15:12];
    assign B_all[59:56] = A_all[7:4];
    assign B_all[63:60] = A_all[59:56];
endmodule
//6th: [5, 2, 6, 0, 11, 1, 8, 15, 7, 3, 13, 9, 12, 14, 4, 10]
module randomPerm6(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[23:20];
    assign B_all[7:4] = A_all[11:8];
    assign B_all[11:8] = A_all[27:24];
    assign B_all[15:12] = A_all[3:0];
    assign B_all[19:16] = A_all[47:44];
    assign B_all[23:20] = A_all[7:4];
    assign B_all[27:24] = A_all[35:32];
    assign B_all[31:28] = A_all[63:60];
    assign B_all[35:32] = A_all[31:28];
    assign B_all[39:36] = A_all[15:12];
    assign B_all[43:40] = A_all[55:52];
    assign B_all[47:44] = A_all[39:36];
    assign B_all[51:48] = A_all[51:48];
    assign B_all[55:52] = A_all[59:56];
    assign B_all[59:56] = A_all[19:16];
    assign B_all[63:60] = A_all[43:40];
endmodule
//7th: [6, 1, 8, 4, 0, 11, 2, 3, 7, 15, 13, 9, 12, 10, 5, 14]
module randomPerm7(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[27:24];
    assign B_all[7:4] = A_all[7:4];
    assign B_all[11:8] = A_all[35:32];
    assign B_all[15:12] = A_all[19:16];
    assign B_all[19:16] = A_all[3:0];
    assign B_all[23:20] = A_all[47:44];
    assign B_all[27:24] = A_all[11:8];
    assign B_all[31:28] = A_all[15:12];
    assign B_all[35:32] = A_all[31:28];
    assign B_all[39:36] = A_all[63:60];
    assign B_all[43:40] = A_all[55:52];
    assign B_all[47:44] = A_all[39:36];
    assign B_all[51:48] = A_all[51:48];
    assign B_all[55:52] = A_all[43:40];
    assign B_all[59:56] = A_all[23:20];
    assign B_all[63:60] = A_all[59:56];
endmodule
