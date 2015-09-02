module rotateWiring(,A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15, B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15, clk, rst);
    input clk, rst;
    input [3:0] A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15;
    output [3:0] B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15;
    reg [3:0] shift;
    wire [63:0] A_all;
    assign A_all = {A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15};
    always @(posedge clk or posedge rst) begin
        if(rst == 1)
            shift <= 0;
        else
            shift <= shift + 1;
    end
    rotateSelect16 rot0(.A_all(A_all), .shift(4'd0 + shift), .res(B_0));
    rotateSelect16 rot1(.A_all(A_all), .shift(4'd1 + shift), .res(B_1));
    rotateSelect16 rot2(.A_all(A_all), .shift(4'd2 + shift), .res(B_2));
    rotateSelect16 rot3(.A_all(A_all), .shift(4'd3 + shift), .res(B_3));
    rotateSelect16 rot4(.A_all(A_all), .shift(4'd4 + shift), .res(B_4));
    rotateSelect16 rot5(.A_all(A_all), .shift(4'd5 + shift), .res(B_5));
    rotateSelect16 rot6(.A_all(A_all), .shift(4'd6 + shift), .res(B_6));
    rotateSelect16 rot7(.A_all(A_all), .shift(4'd7 + shift), .res(B_7));
    rotateSelect16 rot8(.A_all(A_all), .shift(4'd8 + shift), .res(B_8));
    rotateSelect16 rot9(.A_all(A_all), .shift(4'd9 + shift), .res(B_9));
    rotateSelect16 rot10(.A_all(A_all), .shift(4'd10 + shift), .res(B_10));
    rotateSelect16 rot11(.A_all(A_all), .shift(4'd11 + shift), .res(B_11));
    rotateSelect16 rot12(.A_all(A_all), .shift(4'd12 + shift), .res(B_12));
    rotateSelect16 rot13(.A_all(A_all), .shift(4'd13 + shift), .res(B_13));
    rotateSelect16 rot14(.A_all(A_all), .shift(4'd14 + shift), .res(B_14));
    rotateSelect16 rot15(.A_all(A_all), .shift(4'd15 + shift), .res(B_15));
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

module randomPerm0(A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15, B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15);
    input [3:0] A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15;
    output [3:0] B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15;
    assign B_0 = A_10;
    assign B_1 = A_7;
    assign B_2 = A_12;
    assign B_3 = A_6;
    assign B_4 = A_11;
    assign B_5 = A_4;
    assign B_6 = A_13;
    assign B_7 = A_3;
    assign B_8 = A_1;
    assign B_9 = A_15;
    assign B_10 = A_14;
    assign B_11 = A_2;
    assign B_12 = A_9;
    assign B_13 = A_0;
    assign B_14 = A_8;
    assign B_15 = A_5;
endmodule

module randomPerm1(A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15, B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15);
    input [3:0] A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15;
    output [3:0] B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15;
    assign B_0 = A_8;
    assign B_1 = A_9;
    assign B_2 = A_3;
    assign B_3 = A_1;
    assign B_4 = A_13;
    assign B_5 = A_12;
    assign B_6 = A_5;
    assign B_7 = A_14;
    assign B_8 = A_2;
    assign B_9 = A_4;
    assign B_10 = A_7;
    assign B_11 = A_6;
    assign B_12 = A_0;
    assign B_13 = A_15;
    assign B_14 = A_11;
    assign B_15 = A_10;
endmodule

module randomPerm2(A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15, B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15);
    input [3:0] A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15;
    output [3:0] B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15;
    assign B_0 = A_3;
    assign B_1 = A_0;
    assign B_2 = A_14;
    assign B_3 = A_2;
    assign B_4 = A_1;
    assign B_5 = A_15;
    assign B_6 = A_5;
    assign B_7 = A_6;
    assign B_8 = A_13;
    assign B_9 = A_7;
    assign B_10 = A_11;
    assign B_11 = A_9;
    assign B_12 = A_8;
    assign B_13 = A_4;
    assign B_14 = A_12;
    assign B_15 = A_10;
endmodule

module randomPerm3(A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15, B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15);
    input [3:0] A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15;
    output [3:0] B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15;
    assign B_0 = A_7;
    assign B_1 = A_6;
    assign B_2 = A_13;
    assign B_3 = A_4;
    assign B_4 = A_5;
    assign B_5 = A_11;
    assign B_6 = A_8;
    assign B_7 = A_10;
    assign B_8 = A_9;
    assign B_9 = A_1;
    assign B_10 = A_12;
    assign B_11 = A_14;
    assign B_12 = A_15;
    assign B_13 = A_0;
    assign B_14 = A_3;
    assign B_15 = A_2;
endmodule

module randomPerm4(A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15, B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15);
    input [3:0] A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15;
    output [3:0] B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15;
    assign B_0 = A_6;
    assign B_1 = A_14;
    assign B_2 = A_12;
    assign B_3 = A_5;
    assign B_4 = A_8;
    assign B_5 = A_9;
    assign B_6 = A_1;
    assign B_7 = A_4;
    assign B_8 = A_10;
    assign B_9 = A_11;
    assign B_10 = A_7;
    assign B_11 = A_0;
    assign B_12 = A_15;
    assign B_13 = A_2;
    assign B_14 = A_13;
    assign B_15 = A_3;
endmodule
module randomPerm5(A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15, B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15);
    input [3:0] A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15;
    output [3:0] B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15;
    assign B_0 = A_13;
    assign B_1 = A_3;
    assign B_2 = A_12;
    assign B_3 = A_10;
    assign B_4 = A_5;
    assign B_5 = A_2;
    assign B_6 = A_4;
    assign B_7 = A_7;
    assign B_8 = A_15;
    assign B_9 = A_6;
    assign B_10 = A_1;
    assign B_11 = A_8;
    assign B_12 = A_0;
    assign B_13 = A_9;
    assign B_14 = A_11;
    assign B_15 = A_14;
endmodule
module randomPerm6(A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15, B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15);
    input [3:0] A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15;
    output [3:0] B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15;
    assign B_0 = A_12;
    assign B_1 = A_13;
    assign B_2 = A_5;
    assign B_3 = A_0;
    assign B_4 = A_15;
    assign B_5 = A_4;
    assign B_6 = A_1;
    assign B_7 = A_11;
    assign B_8 = A_7;
    assign B_9 = A_6;
    assign B_10 = A_2;
    assign B_11 = A_10;
    assign B_12 = A_14;
    assign B_13 = A_9;
    assign B_14 = A_8;
    assign B_15 = A_3;
endmodule
module randomPerm7(A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15, B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15);
    input [3:0] A_0, A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15;
    output [3:0] B_0, B_1, B_2, B_3, B_4, B_5, B_6, B_7, B_8, B_9, B_10, B_11, B_12, B_13, B_14, B_15;
    assign B_0 = A_5;
    assign B_1 = A_10;
    assign B_2 = A_12;
    assign B_3 = A_11;
    assign B_4 = A_7;
    assign B_5 = A_14;
    assign B_6 = A_6;
    assign B_7 = A_2;
    assign B_8 = A_0;
    assign B_9 = A_4;
    assign B_10 = A_9;
    assign B_11 = A_8;
    assign B_12 = A_15;
    assign B_13 = A_1;
    assign B_14 = A_13;
    assign B_15 = A_3;
endmodule
