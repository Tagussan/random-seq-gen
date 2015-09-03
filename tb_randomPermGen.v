`timescale 1ns/1ns
module tb_randomPermGen();
    parameter STEP = 20;
    reg clk, rst;
    wire [63:0] seq_all;
    randomPermGen pg(.clk(clk), .rst(rst), .seq_all(seq_all));
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
        $dumpflush;
        $finish;
    end
    task toggleclk;
        begin
#STEP       clk <= ~clk;
            if(clk) begin
                $display("%b", seq_all);
            end
        end
    endtask
endmodule
