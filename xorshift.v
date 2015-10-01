module xorshift32(clk, rst, res, seed);
    input clk,rst;
    input [31:0] seed;
    output [31:0] res;
    reg [31:0] res;
    always @(posedge clk or posedge rst) begin
        if(rst == 1) begin
            res <= seed;
        end else begin
            res = res ^ (res << 13);
            res = res ^ (res >> 17);
            res = res ^ (res << 5);
        end
    end
endmodule
