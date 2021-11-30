




module PMU(
    input  clk,
    input  data_i,
    input  en,
    output tdo
);
     
reg [2:0] state_counter = 3'b000;
reg [31:0]      counter = 32'b0;
reg [3:0] instruction   = 4'b0000;
    

//import modules

//    address_generator address_generator(
//    .data_i             (       ),
//    .addr_o             (       ),
//    .data_o             (       )
//    );

    inv_aes_128 AES(
    .clk                (    clk),
    .clr                (       ),
    .dat_in             (       ),
    .dat_out            (       ),
    .inv_key            (       )
    );

    key_storage key_storage(
    .key_write           (       ),
    .key_data_in         (       ),
    .key_data_out        (       )
    );
    
    piso piso(
    .clk                 (    clk),
    .rst                 (       ),
    .load                (       ),
    .en                  (       ),
    .data_i              (       ),
    .data_o              (       )
     );

    sipo sipo(
    .clk                (    clk),
    .rst                (       ),
    .en                 (       ),
    .send               (       ),
    .instruction        (       ),
    .data_i             (       ),
    .mem_data_i         (       ),
    .aes_data_o         (       ),
    .key_data_o         (       ),
    .mem_data_o         (       )
     );

//     bootloader bootloader(
//    .clk                (       ),
//    .addr_i             (       ),
//    .len_i              (       ),
//    .rw                 (       ),
//    .clr                (       ),
//    .addr_o             (       ),
//    .len_o              (       )
//     );
     
//    nv_memory vm_memory(
//    .clk                (       ), 
//    .mem_w              (       ),
//    .mem_addr_in        (       ),
//    .mem_data_in        (       ),
//    .mem_data_out       (       )
//    );

    scan_chain scan_chain(
    .clk                (    clk),
    .en                 (       ),
    .clear              (       ),
    .data_i             (       ),
    .data_o             (       )
    );
    
    
always @(posedge clk)
begin 
    case(state_counter)
        0: 
        1: 
        2:
        3:
        4:
        5:
        default: state_counter <= 0;
    endcase
end

    
always @(state_counter)
begin
    case(state_counter)
        0:
        1:
        2:
        3:
        4:
        5:
        default:
    endcase
end

        
endmodule
