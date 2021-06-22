module T_UPDATE;

reg clk;
reg rst;
reg signed [7:0] in_x_last;

reg signed [7:0] y_0;

wire signed [7:0] out_y_last;
wire signed [7:0] out_y_current;
wire signed [7:0] out_y_hat_current;

wire signed [7:0] a_hat_current;
wire signed [7:0] b_hat_current;

wire signed [7:0] e_current;
wire flag_e_out;



initial begin
    clk = 0;
    forever #50 clk <= ~clk;
end

initial begin
    rst <=1;
    #125 rst <= 0;
end

initial begin
    #55 in_x_last <= 8'd2;
    #100 in_x_last <= 8'd1;
    #100 in_x_last <= 8'd2;
    #100 in_x_last <= 8'd1;
    #100 in_x_last <= 8'd2;
    #100 in_x_last <= 8'd1;
    #100 in_x_last <= 8'd2;
end


initial begin
    y_0 <= 0;
end

FIR F1(clk, rst, in_x_last, y_0, out_y_last, out_y_current);
feedForward fw1(clk, rst, in_x_last, out_y_last, a_hat_current, b_hat_current, out_y_hat_current);
CALC_ERR err1(clk, rst, out_y_current, out_y_hat_current, e_current, flag_e_out);
UPDATE_COEFF up1(clk, rst, flag_e_out, in_x_last, out_y_last, e_current, a_hat_current, b_hat_current);

endmodule