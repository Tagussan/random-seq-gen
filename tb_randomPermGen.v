`timescale 1ns/1ns
module tb_randomPermGen();
    parameter STEP = 20;
    reg clk, rst;
    wire [63:0] seq_all;
    randomPermGen pg(.clk(clk), .rst(rst), .seq_all(seq_all));
    initial begin
        clk = 0;
#STEP   rst = 0;
#STEP   rst = 1;
#STEP   rst = 0;
#STEP   clk = 1;
        //$dumpfile("randomPermGem.vcd");
        //$dumpvars(0, tb_randomPermGen);
        //$dumpflush;
        //$finish;
    end
    always #20 begin
        clk <= ~clk;
        if(clk) begin
            $display("%b", seq_all);
        end
    end
endmodule
