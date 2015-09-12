`timescale 1ns/1ns
module tb_restrectedMovSeq();
    parameter STEP = 20;
    reg [1:0] restrected;
    reg [2:0] prob;
    wire [12:0] random;
    wire [31:0] res;
    wire [7:0] outSeq;
    wire [1:0] seq1, seq2, seq3, seq4;
    assign {seq1, seq2, seq3, seq4} = outSeq;
    assign random = res[12:0];
    reg clk, rst;
    restrectedMovSeq movgen(.restrected(restrected), .prob(prob), .random(random), .outSeq(outSeq));
    xorshift32 rndgen(.clk(clk), .rst(rst), .res(res));
    initial begin
        $dumpfile("restrectedMovSeq.vcd");
        $dumpvars(0, tb_restrectedMovSeq);
        clk = 0;
        rst = 1;
        prob = 7;
        restrected = 0;
        toggleclk;
        rst = 0;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        $dumpflush;
        $finish;
    end
    task toggleclk;
        begin
#STEP       clk <= ~clk;
            if(clk) begin
            end
        end
    endtask
endmodule