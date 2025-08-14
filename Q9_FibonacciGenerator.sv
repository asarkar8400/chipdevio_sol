module model #(parameter
  DATA_WIDTH=32
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);

logic [DATA_WIDTH-1:0] f0, f1, f2;

always @(posedge clk) begin
  if(~resetn) begin
    f0 = 0;
    f1 = 1;
    f2 = 1;
  end else begin
    f2 = f0 + f1; 
    f0 = f1;
    f1 = f2;
  end
end

assign out = f2;

endmodule
