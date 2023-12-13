* 8-bit Shift Register Shift register with enable
  module shift_register(input clk, rst, en, input [7:0] d, output [7:0] q);
      reg [7:0] q;
      always @(posedge clk) begin
          if (rst) begin
              q <= 8'b0;
          end else if (en) begin
              q <= {q[6:0], d};
          end
      end
  endmodule
