module rotateMapper16(A_all, B_all, clk, rst);
    input clk, rst;
    input [63:0] A_all;
    output [63:0] B_all;
    reg [3:0] shift;
    wire [63:0] A_all;
    always @(posedge clk or posedge rst) begin
        if(rst == 1)
            shift <= 0;
        else
            shift <= shift + 1;
    end
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
        startbit = {2'b00, shift}; 
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
