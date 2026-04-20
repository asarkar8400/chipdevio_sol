module model (
  input clk,
  input resetn,
  output logic div2,
  output logic div4,
  output logic div6
);
    logic [1:0] cnt4;        
    logic [2:0] cnt6;

    always_ff @(posedge clk) 
    begin 
      if(!resetn) begin 
        div2 <= 0; 
        div4 <= 0; 
        div6 <= 0; 
        cnt4 <= 0;
        cnt6 <= 0;
      end 
      else begin 
        div2 <= !div2; // clk / 2

        div4 <= (cnt4 < 2); // clk / 4
        cnt4 <= cnt4 + 1; //since 3 is max value for 2 bit number, 
                          //it just loops back so we dont have to reset it as 0 when it becomes 3

        div6 <= (cnt6 < 3); // clk / 6
        cnt6 <= (cnt6 == 5) ? 0 : cnt6 + 1;
      end 
    end
endmodule
