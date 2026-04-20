module model #(parameter
  DATA_WIDTH = 16,
  MAX = 99
) (
    input clk,
    input reset, start, stop,
    output logic [DATA_WIDTH-1:0] count
);
  logic count_flag;

  always_ff @(posedge clk) begin
    if(reset) begin
      count <= 0;
      count_flag <= 0;
    end else if(stop) begin
      count_flag <= 0;
    end else if(start || count_flag) begin
      count_flag <= 1;
      if(count == MAX) begin
        count <= 0;
      end else begin
        count <= count + 1; 
      end
    end
  end
endmodule
