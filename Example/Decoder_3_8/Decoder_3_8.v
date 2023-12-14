module decoder 3-8(
                    A,B,C,OUT
                    );
input A;
input B;
input C;
output reg [7:0] OUT;
always @(A,B,C)
    begin
    case({A,B,C})
    3'b000:OUT=8'b0000_0001;
    3'b001:OUT=8'b0000_0010;
    3'b010:OUT=8'b0000_0100;
    3'b011:OUT=8'b0000_1000;
    3'b100:OUT=8'b0001_0000;
    3'b101:OUT=8'b0010_0000;
    3'b110:OUT=8'b0100_0000;
    3'b111:OUT=8'b1000_0000;
    end
endmodule
