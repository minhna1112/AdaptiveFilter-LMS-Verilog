module T_FW;

reg clk;
reg rst;
reg signed [7:0] in_x_last;

reg signed [7:0] y_0;

wire signed [7:0] out_y_last;
wire signed [7:0] out_y_current;
wire signed [7:0] out_y_hat_current;

reg signed [7:0] a_hat_current;
reg signed [7:0] b_hat_current;

initial begin
    clk = 0;
    forever #50 clk <= ~clk;
end

initial begin
    rst <=1;
    #75 rst <= 0;
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
    #100 a_hat_current <= 8'd0;
    #100 a_hat_current <= 8'd1;
    #100 a_hat_current <= 8'd2;
    #100 a_hat_current <= 8'd1;
    #100 a_hat_current <= 8'd2;
    #100 a_hat_current <= 8'd1;
    #100 a_hat_current <= 8'd2;
end

initial begin
    #100 b_hat_current <= 8'd0;
    #100 b_hat_current <= 8'd2;
    #100 b_hat_current <= 8'd1;
    #100 b_hat_current <= 8'd2;
    #100 b_hat_current <= 8'd1;
    #100 b_hat_current <= 8'd2;
    #100 b_hat_current <= 8'd1;
end

initial begin
    y_0 <= 0;
end

FIR F1(clk, rst, in_x_last, y_0, out_y_last, out_y_current);
feedForward fw1(clk, rst, in_x_last, out_y_last, a_hat_current, b_hat_current, out_y_hat_current);

endmodule