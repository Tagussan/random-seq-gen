module randomPerm16(rst, random, seq_all); //shuffle 0, 1, .. 15 integers based on rotaryPos
    input rst;
    input [1:0] random;
    output [63:0] seq_all;
    reg [63:0] seq_all;
    wire [63:0] map0, map1, map2, map3;
    randomPermSeed0 rps0(.A_all(seq_all), .B_all(map0));
    randomPermSeed1 rps1(.A_all(seq_all), .B_all(map1));
    randomPermSeed2 rps2(.A_all(seq_all), .B_all(map2));
    randomPermSeed3 rps3(.A_all(seq_all), .B_all(map3));
    always @(random or rst) begin
        if (rst) begin
            seq_all <= {4'b0000, 4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111, 4'b1000, 4'b1001, 4'b1010, 4'b1011, 4'b1100, 4'b1101, 4'b1110, 4'b1111};
        end else begin
            if (random == 2'd0)
                seq_all <= map0;
            else if (random == 2'd1)
                seq_all <= map1;
            else if (random == 2'd2)
                seq_all <= map2;
            else if (random == 2'd3)
                seq_all <= map3;
        end
    end
endmodule
//cycle: 16
//cycle: 5
//cycle: 8
//cycle: 8
//0th: [6, 2, 0, 1, 12, 11, 14, 9, 5, 10, 8, 15, 13, 7, 4, 3]
module randomPermSeed0(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[27:24];
    assign B_all[7:4] = A_all[11:8];
    assign B_all[11:8] = A_all[3:0];
    assign B_all[15:12] = A_all[7:4];
    assign B_all[19:16] = A_all[51:48];
    assign B_all[23:20] = A_all[47:44];
    assign B_all[27:24] = A_all[59:56];
    assign B_all[31:28] = A_all[39:36];
    assign B_all[35:32] = A_all[23:20];
    assign B_all[39:36] = A_all[43:40];
    assign B_all[43:40] = A_all[35:32];
    assign B_all[47:44] = A_all[63:60];
    assign B_all[51:48] = A_all[55:52];
    assign B_all[55:52] = A_all[31:28];
    assign B_all[59:56] = A_all[19:16];
    assign B_all[63:60] = A_all[15:12];
endmodule
//1th: [7, 3, 1, 2, 13, 12, 15, 10, 6, 11, 9, 0, 14, 8, 5, 4]
module randomPermSeed1(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[31:28];
    assign B_all[7:4] = A_all[15:12];
    assign B_all[11:8] = A_all[7:4];
    assign B_all[15:12] = A_all[11:8];
    assign B_all[19:16] = A_all[55:52];
    assign B_all[23:20] = A_all[51:48];
    assign B_all[27:24] = A_all[63:60];
    assign B_all[31:28] = A_all[43:40];
    assign B_all[35:32] = A_all[27:24];
    assign B_all[39:36] = A_all[47:44];
    assign B_all[43:40] = A_all[39:36];
    assign B_all[47:44] = A_all[3:0];
    assign B_all[51:48] = A_all[59:56];
    assign B_all[55:52] = A_all[35:32];
    assign B_all[59:56] = A_all[23:20];
    assign B_all[63:60] = A_all[19:16];
endmodule
//2th: [2, 0, 14, 12, 11, 1, 9, 5, 10, 8, 15, 13, 7, 4, 3, 6]
module randomPermSeed2(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[11:8];
    assign B_all[7:4] = A_all[3:0];
    assign B_all[11:8] = A_all[59:56];
    assign B_all[15:12] = A_all[51:48];
    assign B_all[19:16] = A_all[47:44];
    assign B_all[23:20] = A_all[7:4];
    assign B_all[27:24] = A_all[39:36];
    assign B_all[31:28] = A_all[23:20];
    assign B_all[35:32] = A_all[43:40];
    assign B_all[39:36] = A_all[35:32];
    assign B_all[43:40] = A_all[63:60];
    assign B_all[47:44] = A_all[55:52];
    assign B_all[51:48] = A_all[31:28];
    assign B_all[55:52] = A_all[19:16];
    assign B_all[59:56] = A_all[15:12];
    assign B_all[63:60] = A_all[27:24];
endmodule
//3th: [1, 3, 5, 10, 2, 15, 4, 14, 0, 6, 13, 12, 8, 11, 9, 7]
module randomPermSeed3(A_all, B_all);
    input [63:0] A_all;
    output [63:0] B_all;
    assign B_all[3:0] = A_all[7:4];
    assign B_all[7:4] = A_all[15:12];
    assign B_all[11:8] = A_all[23:20];
    assign B_all[15:12] = A_all[43:40];
    assign B_all[19:16] = A_all[11:8];
    assign B_all[23:20] = A_all[63:60];
    assign B_all[27:24] = A_all[19:16];
    assign B_all[31:28] = A_all[59:56];
    assign B_all[35:32] = A_all[3:0];
    assign B_all[39:36] = A_all[27:24];
    assign B_all[43:40] = A_all[55:52];
    assign B_all[47:44] = A_all[51:48];
    assign B_all[51:48] = A_all[35:32];
    assign B_all[55:52] = A_all[47:44];
    assign B_all[59:56] = A_all[39:36];
    assign B_all[63:60] = A_all[31:28];
endmodule
