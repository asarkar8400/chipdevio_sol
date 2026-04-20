module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] gray,
  output logic [DATA_WIDTH-1:0] bin
);

logic [DATA_WIDTH-1:0] temp;

always_comb begin
  temp = gray;
  bin[DATA_WIDTH - 1] = temp[DATA_WIDTH - 1];
  for(int i = DATA_WIDTH - 2; i >= 0; i--) begin
    bin[i] = bin[i+1] ^ temp[i];
  end
end
endmodule
