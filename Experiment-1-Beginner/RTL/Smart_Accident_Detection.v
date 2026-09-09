module Smart_Accident_Detection (
    input  wire motion,
    input  wire impact,
    input  wire tilt,
    output wire motion_led,
    output wire impact_led,
    output wire accident_led
);

    assign motion_led   = motion;
    assign impact_led   = impact;
    assign accident_led = impact & tilt;

endmodule
