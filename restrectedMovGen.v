module restrectedMovSeq(restrected, prob, random, outSeq);//from low bit to high sequence
    input [12:0] random;
    input [1:0] restrected;
    input [2:0] prob;
    output [7:0] outSeq;
    wire [5:0] block, shuffledBlock;
    biasedMixGen bmix(.block(shuffledBlock), .special(restrected), .outSeq(outSeq), .prob(prob), .random(random[5:0]));
    numberPicker npick(.sel(restrected), .remain(block));
    randomPerm3Map map(.X_all(block), .Y_all(shuffledBlock), .random(random[12:6]));
endmodule


module biasedMixGen(block, special, outSeq, prob, random); //special comes head of block with probablity prob/128
    input [5:0] block;
    input [1:0] special;
    input [2:0] prob;
    input [5:0] random;
    output reg [7:0] outSeq;
    always @* begin
        if (random < prob) begin
            outSeq <= {block, special};
        end else begin
            outSeq <= {special, block};
        end
    end
endmodule

module numberPicker(sel, remain);
    input [1:0] sel;
    output reg [5:0] remain;
    always @* begin
        if (sel == 0) begin
            remain <= {2'd1, 2'd2, 2'd3};
        end else if (sel == 1) begin
            remain <= {2'd0, 2'd2, 2'd3};
        end else if (sel == 2) begin
            remain <= {2'd0, 2'd1, 2'd3};
        end else if (sel == 3) begin
            remain <= {2'd0, 2'd1, 2'd2};
        end
    end
endmodule
