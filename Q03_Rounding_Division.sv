module model #(parameter
  DIV_LOG2=3,
  OUT_WIDTH=32,
  IN_WIDTH=OUT_WIDTH+DIV_LOG2
) (
  input [IN_WIDTH-1:0] din,
  output logic [OUT_WIDTH-1:0] dout
);

logic[OUT_WIDTH:0] temp;
 
assign temp = din[IN_WIDTH-1:DIV_LOG2] + din[DIV_LOG2-1];

always @(*) begin
  if (temp[OUT_WIDTH] == 1'b1) begin
    temp = (1 << (OUT_WIDTH + 1)) - 1;
  end 
end

assign dout = temp[OUT_WIDTH-1:0];

endmodule
