
`default_nettype none

`define SHA_KEY            256'h4c4e49536c6e69734c4e49536c6e69734c4e49536c6e69734c4e49536c6e6973 //3 //LNISlnis x4
`define DIGEST             256'he42c30a65a37f031fe920210a999325f84dc75c7ee90d4d2543cef1936d3fb36

// Custom memory interface for a light weight SHA user authentication for PMU
(* blackbox *)
module sha256(
              inout vpp,	// User area 1 1.8V supply
              inout gnd,	// User area 1 digital ground
              // Clock and reset.
              input wire                   clk,
              input wire                reset_n,

              // Control.
              input wire                     cs,
              input wire                     we,
              input wire                     wc, // write control (digest or block)

              // Data ports.
              input wire  [02 : 0]      address,
              input wire  [31 : 0]   write_data,
              output wire          digest_valid
             );

endmodule // sha256


