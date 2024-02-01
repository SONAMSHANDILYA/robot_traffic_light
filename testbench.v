module tb_robot_light;
  reg clk;
  wire forward, stop, reverse;

  robot_traffic_light uut (
    .clk(clk),
    .forward(forward),
    .stop(stop),
    .reverse(reverse)
  );

  initial begin
    // Initialize test
    clk = 0;

    // Test the robot traffic light sequence for 20 clock cycles
    repeat (20) begin
      #5 clk = ~clk;
    end

    $finish;
  end
endmodule
