module randomPerm16(rst, clk, random, seq_all); //shuffle 0, 1, .. 15 integers based on rotaryPos
    input rst, clk;
    input [2:0] random;
    output [63:0] seq_all;
    reg [63:0] seq_all;
    wire [63:0] map0, map1, map2, map3, map4, map5, map6, map7;
    randomPermSeed0 rps0(.A_all(seq_all), .B_all(map0));
    randomPermSeed1 rps1(.A_all(seq_all), .B_all(map1));
    randomPermSeed2 rps2(.A_all(seq_all), .B_all(map2));
    randomPermSeed3 rps3(.A_all(seq_all), .B_all(map3));
    randomPermSeed0 rps4(.A_all(seq_all), .B_all(map4));
    randomPermSeed1 rps5(.A_all(seq_all), .B_all(map5));
    randomPermSeed2 rps6(.A_all(seq_all), .B_all(map6));
    randomPermSeed3 rps7(.A_all(seq_all), .B_all(map7));
    always @(clk or rst) begin
        if (rst) begin
            seq_all <= {4'b0000, 4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111, 4'b1000, 4'b1001, 4'b1010, 4'b1011, 4'b1100, 4'b1101, 4'b1110, 4'b1111};
        end else begin
            if (random == 3'd0)
                seq_all <= map0;
            else if (random == 3'd1)
                seq_all <= map1;
            else if (random == 3'd2)
                seq_all <= map2;
            else if (random == 3'd3)
                seq_all <= map3;
            else if (random == 3'd4)
                seq_all <= map4;
            else if (random == 3'd5)
                seq_all <= map5;
            else if (random == 3'd6)
                seq_all <= map6;
            else if (random == 3'd7)
                seq_all <= map7;
        end
    end
endmodule

//cycle: 16
//cycle: 16
//cycle: 16
//cycle: 16
//cycle: 16
//cycle: 16
//cycle: 16
//cycle: 16
//0th: [6, 8, 9, 1, 13, 0, 12, 15, 5, 10, 7, 3, 14, 11, 2, 4]
module randomPermSeed0(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[27:24];
    assign B_all[7:4] = A_all[35:32];
    assign B_all[11:8] = A_all[39:36];
    assign B_all[15:12] = A_all[7:4];
    assign B_all[19:16] = A_all[55:52];
    assign B_all[23:20] = A_all[3:0];
    assign B_all[27:24] = A_all[51:48];
    assign B_all[31:28] = A_all[63:60];
    assign B_all[35:32] = A_all[23:20];
    assign B_all[39:36] = A_all[43:40];
    assign B_all[43:40] = A_all[31:28];
    assign B_all[47:44] = A_all[15:12];
    assign B_all[51:48] = A_all[59:56];
    assign B_all[55:52] = A_all[47:44];
    assign B_all[59:56] = A_all[11:8];
    assign B_all[63:60] = A_all[19:16];
endmodule
//1th: [4, 8, 14, 2, 7, 12, 13, 9, 10, 11, 3, 15, 1, 0, 6, 5]
module randomPermSeed1(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[19:16];
    assign B_all[7:4] = A_all[35:32];
    assign B_all[11:8] = A_all[59:56];
    assign B_all[15:12] = A_all[11:8];
    assign B_all[19:16] = A_all[31:28];
    assign B_all[23:20] = A_all[51:48];
    assign B_all[27:24] = A_all[55:52];
    assign B_all[31:28] = A_all[39:36];
    assign B_all[35:32] = A_all[43:40];
    assign B_all[39:36] = A_all[47:44];
    assign B_all[43:40] = A_all[15:12];
    assign B_all[47:44] = A_all[63:60];
    assign B_all[51:48] = A_all[7:4];
    assign B_all[55:52] = A_all[3:0];
    assign B_all[59:56] = A_all[27:24];
    assign B_all[63:60] = A_all[23:20];
endmodule
//2th: [14, 10, 1, 11, 0, 6, 2, 9, 4, 12, 3, 15, 5, 8, 7, 13]
module randomPermSeed2(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[59:56];
    assign B_all[7:4] = A_all[43:40];
    assign B_all[11:8] = A_all[7:4];
    assign B_all[15:12] = A_all[47:44];
    assign B_all[19:16] = A_all[3:0];
    assign B_all[23:20] = A_all[27:24];
    assign B_all[27:24] = A_all[11:8];
    assign B_all[31:28] = A_all[39:36];
    assign B_all[35:32] = A_all[19:16];
    assign B_all[39:36] = A_all[51:48];
    assign B_all[43:40] = A_all[15:12];
    assign B_all[47:44] = A_all[63:60];
    assign B_all[51:48] = A_all[23:20];
    assign B_all[55:52] = A_all[35:32];
    assign B_all[59:56] = A_all[31:28];
    assign B_all[63:60] = A_all[55:52];
endmodule
//3th: [3, 9, 12, 13, 10, 11, 7, 8, 1, 14, 2, 4, 6, 5, 15, 0]
module randomPermSeed3(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[15:12];
    assign B_all[7:4] = A_all[39:36];
    assign B_all[11:8] = A_all[51:48];
    assign B_all[15:12] = A_all[55:52];
    assign B_all[19:16] = A_all[43:40];
    assign B_all[23:20] = A_all[47:44];
    assign B_all[27:24] = A_all[31:28];
    assign B_all[31:28] = A_all[35:32];
    assign B_all[35:32] = A_all[7:4];
    assign B_all[39:36] = A_all[59:56];
    assign B_all[43:40] = A_all[11:8];
    assign B_all[47:44] = A_all[19:16];
    assign B_all[51:48] = A_all[27:24];
    assign B_all[55:52] = A_all[23:20];
    assign B_all[59:56] = A_all[63:60];
    assign B_all[63:60] = A_all[3:0];
endmodule
//4th: [10, 13, 4, 14, 0, 8, 11, 3, 15, 12, 7, 2, 5, 6, 9, 1]
module randomPermSeed4(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[43:40];
    assign B_all[7:4] = A_all[55:52];
    assign B_all[11:8] = A_all[19:16];
    assign B_all[15:12] = A_all[59:56];
    assign B_all[19:16] = A_all[3:0];
    assign B_all[23:20] = A_all[35:32];
    assign B_all[27:24] = A_all[47:44];
    assign B_all[31:28] = A_all[15:12];
    assign B_all[35:32] = A_all[63:60];
    assign B_all[39:36] = A_all[51:48];
    assign B_all[43:40] = A_all[31:28];
    assign B_all[47:44] = A_all[11:8];
    assign B_all[51:48] = A_all[23:20];
    assign B_all[55:52] = A_all[27:24];
    assign B_all[59:56] = A_all[39:36];
    assign B_all[63:60] = A_all[7:4];
endmodule
//5th: [11, 14, 1, 10, 0, 12, 2, 13, 15, 6, 7, 3, 4, 9, 8, 5]
module randomPermSeed5(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[47:44];
    assign B_all[7:4] = A_all[59:56];
    assign B_all[11:8] = A_all[7:4];
    assign B_all[15:12] = A_all[43:40];
    assign B_all[19:16] = A_all[3:0];
    assign B_all[23:20] = A_all[51:48];
    assign B_all[27:24] = A_all[11:8];
    assign B_all[31:28] = A_all[55:52];
    assign B_all[35:32] = A_all[63:60];
    assign B_all[39:36] = A_all[27:24];
    assign B_all[43:40] = A_all[31:28];
    assign B_all[47:44] = A_all[15:12];
    assign B_all[51:48] = A_all[19:16];
    assign B_all[55:52] = A_all[39:36];
    assign B_all[59:56] = A_all[35:32];
    assign B_all[63:60] = A_all[23:20];
endmodule
//6th: [10, 5, 8, 13, 15, 2, 14, 6, 3, 12, 9, 0, 4, 7, 11, 1]
module randomPermSeed6(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[43:40];
    assign B_all[7:4] = A_all[23:20];
    assign B_all[11:8] = A_all[35:32];
    assign B_all[15:12] = A_all[55:52];
    assign B_all[19:16] = A_all[63:60];
    assign B_all[23:20] = A_all[11:8];
    assign B_all[27:24] = A_all[59:56];
    assign B_all[31:28] = A_all[27:24];
    assign B_all[35:32] = A_all[15:12];
    assign B_all[39:36] = A_all[51:48];
    assign B_all[43:40] = A_all[39:36];
    assign B_all[47:44] = A_all[3:0];
    assign B_all[51:48] = A_all[19:16];
    assign B_all[55:52] = A_all[31:28];
    assign B_all[59:56] = A_all[47:44];
    assign B_all[63:60] = A_all[7:4];
endmodule
//7th: [8, 3, 7, 10, 11, 15, 13, 14, 9, 12, 0, 6, 5, 2, 1, 4]
module randomPermSeed7(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[35:32];
    assign B_all[7:4] = A_all[15:12];
    assign B_all[11:8] = A_all[31:28];
    assign B_all[15:12] = A_all[43:40];
    assign B_all[19:16] = A_all[47:44];
    assign B_all[23:20] = A_all[63:60];
    assign B_all[27:24] = A_all[55:52];
    assign B_all[31:28] = A_all[59:56];
    assign B_all[35:32] = A_all[39:36];
    assign B_all[39:36] = A_all[51:48];
    assign B_all[43:40] = A_all[3:0];
    assign B_all[47:44] = A_all[27:24];
    assign B_all[51:48] = A_all[23:20];
    assign B_all[55:52] = A_all[11:8];
    assign B_all[59:56] = A_all[7:4];
    assign B_all[63:60] = A_all[19:16];
endmodule
