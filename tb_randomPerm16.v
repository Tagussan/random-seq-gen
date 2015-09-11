`timescale 1ns/1ns
module tb_randomPermGen();
    parameter STEP = 20;
    reg clk, rst;
    wire [63:0] seq_all;
    wire [31:0] rotaryPos;
    xorshift32 rnd(.clk(clk), .rst(rst), .res(rotaryPos));
    randomPermGen pg(.rotaryPos(rotaryPos), .seq_all(seq_all));
    initial begin
        $dumpfile("randomPermGen.vcd");
        $dumpvars(0, tb_randomPermGen);
        clk = 0;
#STEP   rst = 0;
#STEP   rst = 1;
#STEP   rst = 0;
#STEP   clk = 1;
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
                $display("%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d", seq_all[63:60], seq_all[59:56], seq_all[55:52], seq_all[51:48], seq_all[47:44], seq_all[43:40], seq_all[39:36], seq_all[35:32], seq_all[31:28], seq_all[27:24], seq_all[23:20], seq_all[19:16], seq_all[15:12], seq_all[11:8], seq_all[7:4], seq_all[3:0]);
            end
        end
    endtask
endmodule