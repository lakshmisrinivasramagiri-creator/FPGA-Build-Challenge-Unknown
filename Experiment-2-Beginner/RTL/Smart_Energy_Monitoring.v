module Smart_Energy_Monitoring (
    input  wire [7:0] voltage,
    input  wire [7:0] current,
    output wire [15:0] power,
    output wire overload
);

    assign power = voltage * current;
    assign overload = (power > 16'd1000);

endmodule