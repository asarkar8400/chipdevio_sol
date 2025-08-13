module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  input din_en,
  output logic dout
);

logic [DATA_WIDTH-1:0] shifter;

  always @(posedge clk) begin
    if(!resetn) begin
      shifter <= 0;
    end else if(din_en) begin
      shifter <= din;
    end else begin
      shifter <= shifter >> 1;
    end
  end

  assign dout = shifter[0];


endmodule
