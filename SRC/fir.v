module FIR #(
    parameter a = 8'b00000010,
    parameter b = 8'b00000001
) (
    input wire clk,
    input wire rst,
    input wire signed [7:0] x_last,
    input wire signed [7:0] y_intial,
    
    output reg signed [7:0] y_last,
    output reg signed [7:0] y_current
);




always @(posedge clk) begin
    if (rst)
     y_current <= y_intial;
    else
     y_current <= a*x_last + b*y_last;
end

always @(negedge clk) begin
    y_last <= y_current;
end


    
endmodule