module Traffic_Monitoring (
    input  wire [3:0] traffic_sensor,
    output wire red_led,
    output wire yellow_led,
    output wire green_led,
    output wire heavy_traffic
);

    // Heavy traffic when 2 or more lanes detect vehicles
    assign heavy_traffic =
        (traffic_sensor[0] & traffic_sensor[1]) |
        (traffic_sensor[0] & traffic_sensor[2]) |
        (traffic_sensor[0] & traffic_sensor[3]) |
        (traffic_sensor[1] & traffic_sensor[2]) |
        (traffic_sensor[1] & traffic_sensor[3]) |
        (traffic_sensor[2] & traffic_sensor[3]);

    // Traffic signal control
    assign red_led    = heavy_traffic;
    assign yellow_led = ~heavy_traffic & (|traffic_sensor);
    assign green_led  = ~(|traffic_sensor);

endmodule