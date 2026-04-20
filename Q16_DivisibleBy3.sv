module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);

  enum logic [2:0] {init, MOD0, MOD1, MOD2} state; 

  always_ff @(posedge clk) begin
    if(!resetn) begin
      dout <= 0;
      state <= init;
    end else begin
      case(state)
        init: state <= (din) ? MOD1 : MOD0;
        MOD0: state <= (din) ? MOD1 : MOD0;
        MOD1: state <= (din) ? MOD0 : MOD2;
        MOD2: state <= (din) ? MOD2 : MOD1;
      endcase
    end
  end

  assign dout = (state == MOD0); 

endmodule
