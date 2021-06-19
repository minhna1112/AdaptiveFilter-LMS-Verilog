module CALC_ERR (
    input wire clk,
    input wire rst,
    input wire signed [7:0] y_current,
    input wire signed [7:0] y_hat_current,

    output wire signed [7:0] e_current
);

assign e_current = y_current - y_hat_current;

    
endmodule