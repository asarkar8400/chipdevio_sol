module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);

logic [DATA_WIDTH-1:0] temp;
logic [$clog2(DATA_WIDTH):0] cnt; 

always_comb begin
  cnt = 0; 
  temp = din;
  for(int i = 0; i < DATA_WIDTH; i++) begin
    if(temp[i] == 0) begin
      cnt = cnt + 1;
    end else if(temp[i] == 1) begin
      break;
    end
  end
end

assign dout = cnt; 

endmodule
