module feedForward (
    input wire clk,
    input wire reset,
    input wire signed [7:0] x_last,
    input wire signed [7:0] y_last,
    input wire signed [7:0] a_hat_current,
    input wire signed [7:0] b_hat_current,

    output reg signed [7:0] y_hat_current
);

always @(posedge clk ) begin
    if (!reset)
        y_hat_current <= a_hat_current*x_last + b_hat_current*y_last;
end


    
endmodule