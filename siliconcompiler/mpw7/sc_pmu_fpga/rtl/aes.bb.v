

(* blackbox *)
module aes(
    inout       vpp,	// User area 1 1.8V supply
    inout       gnd,	// User area 1 digital ground
    
    input        clk,
    input        reset_n,
    input        reset_dec,

    input        init,
    input        next,
    input        wc,
    input        we,
    
    input   [1:0] address,
    input  [31:0] write_data,
    output [31:0] read_data,

    output      key_ready,

    output      result_valid
);


    
endmodule   
