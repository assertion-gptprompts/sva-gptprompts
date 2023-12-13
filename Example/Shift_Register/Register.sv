* 8-bit Shift Register Shift register with enable
  sva
  assert property (
      @(posedge clk)
      (rst | en) |-> (q == (en ? d : q))
  );
