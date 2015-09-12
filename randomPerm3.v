module randomPerm3Map(X_all, Y_all, random);
    input [5:0] X_all;
    input [6:0] random;
    output reg [5:0] Y_all;
    always @* begin
        if (0 <= random && random < 21) begin
            Y_all[1:0] <= X_all[1:0];
            Y_all[3:2] <= X_all[3:2];
            Y_all[5:4] <= X_all[5:4];
        end else if (21 <= random && random < 42) begin
            Y_all[1:0] <= X_all[1:0];
            Y_all[5:4] <= X_all[3:2];
            Y_all[3:2] <= X_all[5:4];
        end else if (42 <= random && random < 64) begin
            Y_all[3:2] <= X_all[1:0];
            Y_all[1:0] <= X_all[3:2];
            Y_all[5:4] <= X_all[5:4];
        end else if (64 <= random && random < 85) begin
            Y_all[3:2] <= X_all[1:0];
            Y_all[5:4] <= X_all[3:2];
            Y_all[1:0] <= X_all[5:4];
        end else if (85 <= random && random < 106) begin
            Y_all[5:4] <= X_all[1:0];
            Y_all[1:0] <= X_all[3:2];
            Y_all[3:2] <= X_all[5:4];
        end else if (106 <= random && random < 128) begin
            Y_all[5:4] <= X_all[1:0];
            Y_all[3:2] <= X_all[3:2];
            Y_all[1:0] <= X_all[5:4];
        end
    end
endmodule
