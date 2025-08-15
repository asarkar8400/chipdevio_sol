module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);

logic [$clog2(DATA_WIDTH):0] counter;
logic [DATA_WIDTH:0] temp;

  always @(*) begin
    temp = din;
    counter = 0;
    for(int i = 0; i < DATA_WIDTH; i = i + 1) begin
      if(din[i] == 1) begin
        counter = counter + 1;
        temp = temp >> 1;
      end else begin
        temp = temp >> 1;
      end
    end
  end

  assign dout = counter;

endmodule
