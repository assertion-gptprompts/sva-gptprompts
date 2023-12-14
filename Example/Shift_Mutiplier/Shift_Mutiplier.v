module unsigned_mul_1 #( 
            parameter DATAWIDTH=8 
)(clk, x, y, result); 
    parameter s0 = 0, s1 = 1, s2 = 2; 
    input clk; 
    input    [DATAWIDTH-1:0] x, y; 
    output   [DATAWIDTH*2-1:0] result; 
    reg      [DATAWIDTH*2-1:0] result; 
    reg  [DATAWIDTH-1:0] count = 0; 
    reg  [1:0] state = 0; 
    reg  [DATAWIDTH*2-1:0] P, T; 
    reg  [DATAWIDTH-1:0] y_reg; 
    always @(posedge clk) begin 
        case (state) 
            s0: begin 
                count <= 0; 
                P <= 0; 
                y_reg <= y; 
                T <= {{DATAWIDTH{1'b0}}, x}; 
                state <= s1; 
            end 
            s1: begin 
                if(count == DATAWIDTH) 
                    state <= s2; 
                else begin 
                    if(y_reg[0] == 1'b1) 
                        P <= P + T; 
                    else 
                        P <= P; 
                    y_reg <= y_reg >> 1; 
                    T <= T << 1; 
                    count <= count + 1; 
                    state <= s1; 
                end 
            end 
            s2: begin 
                result <= P; 
                state <= s0; 
            end 
            default: ; 
        endcase 
    end 
endmodule 
