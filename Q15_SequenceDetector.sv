module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);

enum [2:0] {Sinit, S1, S10, S101, S1010} current_state;

  always_comb begin
    current_state = Sinit;
    case(current_state) 
      Sinit: current_state = din ? S1 : Sinit;
      S1: current_state = !din ? S10 : S1;
      S10: current_state = din ? S101 : Sinit;
      S101: current_state = !din ? S1010 : S1;
      S1010: current_state = din ? S101 : Sinit;
      default: current_state = Sinit;
    endcase
  end

  always_ff @(posedge clk) begin
    if(!resetn) begin
      current_state <= Sinit;
      dout <= 0;
    end else begin
      dout <= (current_state == S1010);
    end
  end
endmodule
