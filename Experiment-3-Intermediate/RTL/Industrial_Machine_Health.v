module Industrial_Machine_Health (
    input  wire [3:0] sensor_value,
    output wire normal_led,
    output wire warning_led,
    output wire critical_led,
    output wire alarm
);

    assign normal_led   = (sensor_value <= 4'd7);
    assign warning_led  = (sensor_value >= 4'd8) && (sensor_value <= 4'd11);
    assign critical_led = (sensor_value >= 4'd12);
    assign alarm        = (sensor_value >= 4'd12);

endmodule