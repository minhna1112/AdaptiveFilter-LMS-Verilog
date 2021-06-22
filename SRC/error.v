module CALC_ERR (
    input wire clk,
    input wire rst,
    input wire signed [7:0] y_current,
    input wire signed [7:0] y_hat_current,


    output wire signed [7:0] e_current,
    output reg flag_e_out
);

assign e_current = y_current - y_hat_current;

always @(posedge clk ) begin
    if(rst)
        flag_e_out <=0;
    else
        flag_e_out <=1;
end

    
endmodule