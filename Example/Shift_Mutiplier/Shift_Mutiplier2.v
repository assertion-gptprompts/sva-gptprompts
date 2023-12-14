module unsigned_mul_2(
            mul_a,
            mul_b,
            mul_out,
            clk,
            rst_n
            );

parameter   MUL_WIDTH  = 8;
parameter   MUL_RESULT = 16;

input [MUL_WIDTH-1:0]   mul_a;
input [MUL_WIDTH-1:0]   mul_b;
input                   clk;
input                   rst_n;

output [MUL_RESULT-1:0]   mul_out;

reg [MUL_RESULT-1:0]   mul_out;

reg [MUL_RESULT-1:0]   stored0;
reg [MUL_RESULT-1:0]   stored1;
reg [MUL_RESULT-1:0]   stored2;
reg [MUL_RESULT-1:0]   stored3;
reg [MUL_RESULT-1:0]   stored4;
reg [MUL_RESULT-1:0]   stored5;
reg [MUL_RESULT-1:0]   stored6;
reg [MUL_RESULT-1:0]   stored7;
reg [MUL_RESULT-1:0]   out1,out2;
reg [MUL_RESULT-1:0]   add1,add2,add3,add4;

always @ ( posedge clk or negedge rst_n )
begin
    if ( !rst_n )
    begin

        stored0 <= 14'b0;
        stored1 <= 14'b0;
        stored2 <= 14'b0;
        stored3 <= 14'b0;
        stored4 <= 14'b0;
        stored5 <= 14'b0;
        stored6 <= 14'b0;
        out1<= 14'b0;
        out2<= 14'b0;

        add1 <= 14'b0;
        add2 <= 14'b0;
        add3 <= 14'b0;
        add4 <= 14'b0;


    end
    else
    begin           
        //注意，下面两句是没有延迟的，因为他们的右侧的mul_a，mul_b是输入信号

        stored0 <= mul_b[0] ? {8'b0,mul_a}       : 16'b0;
        stored1 <= mul_b[1] ? {7'b0,mul_a,1'b0}  : 16'b0;
        stored2 <= mul_b[2] ? {6'b0,mul_a,2'b0}  : 16'b0;
        stored3 <= mul_b[3] ? {5'b0,mul_a,3'b0}  : 16'b0;
        stored4 <= mul_b[4] ? {4'b0,mul_a,4'b0}  : 16'b0;
        stored5 <= mul_b[5] ? {3'b0,mul_a,5'b0}  : 16'b0;
        stored6 <= mul_b[6] ? {2'b0,mul_a,6'b0}  : 16'b0;
        stored7 <= mul_b[7] ? {1'b0,mul_a,7'b0}  : 16'b0;
        add1 <= stored1 + stored0;
        add2 <= stored3 + stored2;
        add3 <= stored5 + stored4;
        add4 <= stored6 + stored7;
        out1 <= add1 + add2;
        out2 <= add3 + add4;
        mul_out <= out1 + out2;

    end

end

endmodule
