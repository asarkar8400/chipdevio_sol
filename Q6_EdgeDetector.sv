module model (
  input clk,
  input resetn,
  input din,
  output dout
);

logic mem, temp;

always @(posedge clk) begin
  if(~resetn) begin
    mem <= 0;
    temp <= 0;
  end else begin
    if(mem == 0 && din == 1) begin
      temp <= 1;
    end else begin
      temp <= 0;
    end
    mem <= din;
  end
end

assign dout = temp;


endmodule
