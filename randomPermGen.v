module randomWiring1(A, B)
    input [3:0] A[16];
    output [3:0] B[16];
    assign B[0] = A[8];
    assign B[1] = A[13];
    assign B[2] = A[12];
    assign B[3] = A[9];
    assign B[4] = A[10];
    assign B[5] = A[15];
    assign B[6] = A[1];
    assign B[7] = A[0];
    assign B[8] = A[7];
    assign B[9] = A[3];
    assign B[10] = A[11];
    assign B[11] = A[6];
    assign B[12] = A[14];
    assign B[13] = A[4];
    assign B[14] = A[5];
    assign B[15] = A[2];
endmodule

module randomWiring2(A, B)
    input [3:0] A[16];
    output [3:0] B[16];
    assign B[0] = A[1];
    assign B[1] = A[8];
    assign B[2] = A[7];
    assign B[3] = A[11];
    assign B[4] = A[9];
    assign B[5] = A[4];
    assign B[6] = A[13];
    assign B[7] = A[3];
    assign B[8] = A[6];
    assign B[9] = A[5];
    assign B[10] = A[15];
    assign B[11] = A[2];
    assign B[12] = A[0];
    assign B[13] = A[12];
    assign B[14] = A[14];
    assign B[15] = A[10];
endmodule

module randomWiring3(A, B)
    input [3:0] A[16];
    output [3:0] B[16];
    assign B[0] = A[4];
    assign B[1] = A[0];
    assign B[2] = A[2];
    assign B[3] = A[5];
    assign B[4] = A[11];
    assign B[5] = A[10];
    assign B[6] = A[14];
    assign B[7] = A[3];
    assign B[8] = A[6];
    assign B[9] = A[12];
    assign B[10] = A[1];
    assign B[11] = A[13];
    assign B[12] = A[9];
    assign B[13] = A[8];
    assign B[14] = A[7];
    assign B[15] = A[15];
endmodule
