module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);

  logic [2:0] state;
  logic [2:0] next_state;
  logic [3:0] temp;
  logic seen; 

  always_ff @(posedge clk) begin
    if(!resetn) begin
      seen <= 0;
      dout <= 0;
      state <= 0;
    end
    else begin
      state <= next_state;
      seen <= 1; 
    end
  end

  always_comb begin
    temp = (state << 1) + din; 
    if(temp >= 5) begin
      temp = temp - 5; //calculates remainder
    end

    next_state = temp[2:0]; //holds new value
  end

  assign dout = seen && (state == 0);

endmodule
