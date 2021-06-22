module UPDATE_COEFF#(
    parameter a_hat_intial = 8'b00000000,
    parameter b_hat_intial = 8'b00000000,
    parameter mu = 8'b00000001
) (
    input wire clk,
    input wire rst,
    input wire flag_e_out,
    input wire signed [7:0] x_last,
    input wire signed [7:0] y_last,
    input wire signed [7:0] e_current,
    
    output reg signed [7:0] a_hat_current,
    output reg signed [7:0] b_hat_current


);

reg signed [7:0] a_hat_next;
reg signed [7:0] b_hat_next;

always @(e_current) begin
    a_hat_next <= a_hat_current + mu*x_last*e_current;
end

always @(e_current) begin
    b_hat_next <= b_hat_current + mu*y_last*e_current;
end

always @(negedge clk ) begin
    if (rst)
    a_hat_current <= a_hat_intial;
    else
    a_hat_current <= a_hat_next;
end

always @(negedge clk ) begin
    if (rst)
    b_hat_current <= b_hat_intial;
    else
    b_hat_current <= b_hat_next;
end

endmodule