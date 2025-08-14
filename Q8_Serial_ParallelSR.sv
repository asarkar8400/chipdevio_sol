module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input din,
  output logic [DATA_WIDTH-1:0] dout
);

logic [DATA_WIDTH-1:0] shifter;

  always @(posedge clk) begin
    if(!resetn) begin
      shifter = 0;
    end else begin         
      shifter = shifter << 1;
      shifter[0] = din;
    end
  end

assign dout = shifter;
 
endmodule
