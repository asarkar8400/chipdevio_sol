module model #(parameter
  DATA_WIDTH = 32
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);

logic[DATA_WIDTH-1:0] largest, second_largest;

always @(posedge clk) begin
  if(~resetn) begin
    second_largest = 1'b0;
    largest = 1'b0;
  end else if(din > largest) begin 
    second_largest = largest;
    largest = din;
  end else if(largest >= din &&  din >= second_largest) begin
    second_largest = din; 
  end
  dout = second_largest;
end
endmodule
