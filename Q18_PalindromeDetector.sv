module model #(parameter
  DATA_WIDTH=32
) (
  input [DATA_WIDTH-1:0] din,
  output logic dout
);

  always_comb begin
    dout = 1;
    for(int i = 0; i < DATA_WIDTH / 2; i++) begin
      if(din[i] != din[DATA_WIDTH - 1 - i])
        dout = 0;
    end
  end
endmodule
