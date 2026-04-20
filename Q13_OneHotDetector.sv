module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic onehot
);

logic [$clog2(DATA_WIDTH) - 1 : 0] cnt; 
logic [DATA_WIDTH-1:0] temp;

  always_comb begin
    cnt = 0;
    temp = din;
    for(int i = 0; i < DATA_WIDTH; i++) begin
      if(temp[i] == 1) begin
        cnt = cnt + 1; 
      end
    end
  end

  always_comb begin
    if(cnt == 1) begin
      onehot = 1;
    end else begin
      onehot = 0; 
    end
  end
endmodule
