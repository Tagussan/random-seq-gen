module xorshift32(clk, rst, res);
    input clk,rst;
    output [31:0] res;
    reg [31:0] res;
    always @(posedge clk or posedge rst) begin
        if(rst == 1) begin
            res <= 32'd2463534242;
        end else begin
            res = res ^ (res << 13);
            res = res ^ (res >> 17);
            res = res ^ (res << 5);
        end
    end
endmodule
