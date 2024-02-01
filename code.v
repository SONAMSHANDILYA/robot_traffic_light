`timescale 1ns / 1ps

module robot_traffic_light (
  input wire clk,
  output reg forward,
  output reg stop,
  output reg reverse
);

  reg [1:0] state = 2'b00;  // Initialize state

  // State encoding
  localparam FORWARD_STATE = 2'b00;
  localparam STOP_STATE = 2'b01;
  localparam REVERSE_STATE = 2'b10;

  always @(posedge clk) begin
    // State transition logic
    case (state)
      FORWARD_STATE: begin
        forward = 1;
        stop = 0;
        reverse = 0;
        state <= STOP_STATE;
      end

      STOP_STATE: begin
        forward = 0;
        stop = 1;
        reverse = 0;
        state <= REVERSE_STATE;
      end

      REVERSE_STATE: begin
        forward = 0;
        stop = 0;
        reverse = 1;
        state <= FORWARD_STATE;
      end
    endcase
  end

endmodule
