`timescale 1 ns / 1 ps
`define UNIT_DELAY #10

module functional_pmu;

    /* localparam period     = 20; */
    /* localparam halfperiod = 10; */

    /*                                                           //instr */  
    /* reg [127:0]  header0      = 128'b00000000000000000000010110000100000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000; */
    /* reg [427:0]  bitstream0   = 428'h0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789a; */

    /* reg [127:0]  header1      = 128'b00000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; */
    /* reg [127:0]  key0         = 128'h0123456789abcdef0123456789abcdef; */

    /* reg [135:0]  header2      = 136'b0100111100000000000000000000001011000011000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000; */
    /* reg [135:0]  key1         = 136'h720123456789abcdef0123456789abcdef; */
    /* reg [135:0]  key2         = 136'h710123456789abcdef0123456789abcdef; */

    /* reg [135:0]  header3      = 136'b1100000100000000000000000000010000000101000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000; */
    /* reg [407:0]  bitstream1   = 408'h720123456789abcdef0123456789abcdef720123456789abcdef0123456789abcdef720123456789abcdef0123456789abcdef; */
    /* reg [407:0]  bitstream2   = 408'h720123456789abcdef0123456789accdef720123456789abcdef0123456789abcdef720123456789abcdef0123456789abadef; */



    /* reg [135:0] header4      = 136'b1101101000000000000000000000100000000110000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000; */
    /* reg [127:0] key3         = 128'h2b7e151628aed2a6abf7158809cf4f3c; */

    /* reg [383:0] plaintext    = 384'h6bc1bee22e409f96e93d7e117393172a6bc1bee22e409f96e93d7e117393172a6bc1bee22e409f96e93d7e117393172a; */
    
    /* reg [383:0] encipher     = 384'h3ad77bb40d7a3660a89ecaf32466ef973ad77bb41d7a3660a89ecaf32466ef973ad77bb40d7a3660a89ecaf32466ef97; */
    /*                                                                 //      ^     // */
    
    
    
    /* reg [135:0] header5      = 136'b1111001000000000000000000000100000000111000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000; */
    /* reg [407:0] encipher1    = 408'hea3ad77bb40d7a3660a89ecaf32466ef97ea3ad77bb40d7a3660a89ecaf32466ef97ea3ad77bb40d7a3660a89ecaf32466ef97; // crc encoded */
    /*                                                                                //6 */         


    /* reg [127:0]  header6    = 128'b00000000000000000000101011001000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000; */
    
    /* reg [127:0]  header7    = 128'b00000000000000000001101011001001000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000; */

    /* reg [255:0] sha_key     = 256'h5448495349535448455055424c49434b4559464f52504d554245434155534521; */

    /* reg clk = 1'b0; */
    /* reg pmu_en = 1'b0; */
    /* reg pmu_rst_i = 1'b0; */
    /* reg pmu_data_i = 1'b0; */
    /* reg capture_i = 1'b0; */

    /* reg data_ccff_i = 1'b0; */
        

    /* wire [31:0] mem_data_in; */
    /* wire [31:0] mem_data_out; */
    /* wire [7:0]  mem_address_o; */
    /* wire mem_we; */
    /* wire mem_clk; */
    
    /* pmu pmu0 */
    /* ( */
    /* .data_i(pmu_data_i), */
    /* .en_i(pmu_en), */
    /* .rst_i(pmu_rst_i), */
    /* .tck_i(clk), */
    /* .progclk_o(), */
    /* .flag_o_jtag(), */
    /* .flag_o_fpga(), */
    /* .data_o(), */
    /* .data_ccff_i(), */
    /* .data_ccff_o(), */
    /* .mem_data_in(mem_data_in), */
    /* .mem_address_o(mem_address_o), */
    /* .mem_data_o(mem_data_out), */
    /* .mem_we(mem_we), */
    /* .mem_clk(mem_clk) */
    /* ); */

    /* mem mem0 */
    /* ( */
    /* .clk(mem_clk), */
    /* .we(mem_we), */
    /* .data_i(mem_data_out), */
    /* .address(mem_address_o), */
    /* .data_o(mem_data_in) */
    /* ); */

    /* integer i; */

    /* initial begin */
    /*     clk = 0; */
    /*     forever */
    /*     #halfperiod clk = ~clk; */
    /* end */

    /* initial begin */ 
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* pmu_rst_i = 1'b1; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* //pmu_en = 1'b1; */



    /* // Load Bitstream */
    /* for(i = 0; i < 129; i = i + 1) */
    /* begin */
    /*     if(i < 128) begin */ 
    /*         pmu_data_i = header0[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* for(i = 0; i < 429; i = i + 1) */
    /* begin */
    /*     if(i < 428) begin */ 
    /*         pmu_data_i = bitstream0[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* pmu_en = 1'b0; */

    /* #period; //1 */
    /* #period; //2 */
    /* #period; //3 */
    /* #period; //4 */
    /* #period; //5 */
    /* #period; //6 */
    /* // ------------- */

    /* // Load Key */
    /* pmu_en = 1'b1; */
    /* for(i = 0; i < 129; i = i + 1) */
    /* begin */
    /*     if(i < 128) begin */ 
    /*         pmu_data_i = header1[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* for(i = 0; i < 129; i = i + 1) */
    /* begin */
    /*     if(i < 128) begin */ 
    /*         pmu_data_i = key0[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* //pmu_en = 1'b0; */
    /* #period; //1 */
    /* #period; //2 */
    /* #period; //3 */
    /* #period; //4 */
    /* #period; //5 */
    /* #period; //6 */
    /* #period; //7 */
    /* #period; //8 */
    /* #period; //9 */
    /* #period; //10 */
    /* #period; //11 */ 
    /* #period; //12 */
    /* #period; //13 */
    /* #period; //14 */
    /* #period; //15 */ 
    /* #period; //16 */
    /* #period; //17 */ 
    /* #period; //18 */ 
    /* #period; //19 */
    /* #period; //20 */
    /* #period; //21 */
    /* #period; //22 */
    /* #period; //23 */
    /* // ------------- */

    /* // Load Key CRC - Passing */
    /* pmu_en = 1'b1; */
    /* for(i = 0; i < 137; i = i + 1) */
    /* begin */
    /*     if(i < 136) begin */ 
    /*         pmu_data_i = header2[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* for(i = 0; i < 137; i = i + 1) */
    /* begin */
    /*     if(i < 136) begin */ 
    /*         pmu_data_i = key1[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* #period; */

    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* pmu_en = 1'b0; */
    /* #period; */

    /* // Load key CRC - Failing */
    /* pmu_en = 1'b1; */
    /* for(i = 0; i < 137; i = i + 1) */
    /* begin */
    /*     if(i < 136) begin */ 
    /*         pmu_data_i = header2[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* for(i = 0; i < 137; i = i + 1) */
    /* begin */
    /*     if(i < 136) begin */ 
    /*         pmu_data_i = key2[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */

    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* #period; */
    /* // ------------- */
        

    /* // Load Bitstream CRC - Passing */
    /* for(i = 0; i < 137; i = i + 1) */
    /* begin */
    /*     if(i < 136) begin */ 
    /*         pmu_data_i = header3[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* for(i = 0; i < 409; i = i + 1) */
    /* begin */
    /*     if(i < 408) begin */ 
    /*         pmu_data_i = bitstream1[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* pmu_en = 1'b0; */


    

    /* #period; //1 */
    /* #period; //2 */
    /* #period; //3 */
    /* #period; //4 */
    /* #period; //5 */
    /* #period; //6 */
    /* pmu_en = 1'b1; */

    /* // Load Bitstream CRC - Failing */
    /* for(i = 0; i < 137; i = i + 1) */
    /* begin */
    /*     if(i < 136) begin */ 
    /*         pmu_data_i = header3[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* for(i = 0; i < 409; i = i + 1) */
    /* begin */
    /*     if(i < 408) begin */ 
    /*         pmu_data_i = bitstream2[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */


    /* pmu_en = 1'b0; */

    /* #period; //1 */
    /* #period; //2 */
    /* #period; //3 */
    /* #period; //4 */
    /* #period; //5 */
    /* #period; //6 */
    /* // ------------- */


    /* // Load Key and AES Bitstream */
    /* // Load Key */
    /* pmu_en = 1'b1; */
    /* for(i = 0; i < 129; i = i + 1) */
    /* begin */
    /*     if(i < 128) begin */ 
    /*         pmu_data_i = header1[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* for(i = 0; i < 129; i = i + 1) */
    /* begin */
    /*     if(i < 128) begin */ 
    /*         pmu_data_i = key3[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* pmu_en = 1'b0; */
    /* #period; //1 */
    /* #period; //2 */
    /* #period; //3 */
    /* #period; //4 */
    /* #period; //5 */
    /* #period; //6 */
    /* #period; //7 */
    /* #period; //8 */
    /* #period; //9 */
    /* #period; //10 */
    /* #period; //11 */ 
    /* #period; //12 */
    /* #period; //13 */
    /* #period; //14 */
    /* #period; //15 */ 
    /* #period; //16 */
    /* #period; //17 */ 
    /* #period; //18 */ 
    /* #period; //19 */
    /* #period; //20 */
    /* #period; //21 */
    /* #period; //22 */
    /* #period; //23 */        
    /* pmu_en = 1'b1; */
    /* for(i = 0; i < 129; i = i + 1) */
    /* begin */
    /*     if(i < 128) begin */ 
    /*         pmu_data_i = header4[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */

    /* for(i = 0; i < 385; i = i + 1) */
    /* begin */
    /*     if(i < 384) begin */ 
    /*         pmu_data_i = encipher[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */

    /* pmu_en = 1'b0; */
    
    /* for(i = 0; i < 300; i = i + 1) */
    /* begin */
    /*     #period; */
    /* end */
    /* // ------------- */



    /* // Load Bitstream CA */
    /*     // Load Key */
    /* pmu_en = 1'b1; */
    /* for(i = 0; i < 129; i = i + 1) */
    /* begin */
    /*     if(i < 128) begin */ 
    /*         pmu_data_i = header1[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* for(i = 0; i < 129; i = i + 1) */
    /* begin */
    /*     if(i < 128) begin */ 
    /*         pmu_data_i = key3[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* pmu_en = 1'b0; */
    /* #period; //1 */
    /* #period; //2 */
    /* #period; //3 */
    /* #period; //4 */
    /* #period; //5 */
    /* #period; //6 */
    /* #period; //7 */
    /* #period; //8 */
    /* #period; //9 */
    /* #period; //10 */
    /* #period; //11 */ 
    /* #period; //12 */
    /* #period; //13 */
    /* #period; //14 */
    /* #period; //15 */ 
    /* #period; //16 */
    /* #period; //17 */ 
    /* #period; //18 */ 
    /* #period; //19 */
    /* #period; //20 */
    /* #period; //21 */
    /* #period; //22 */
    /* #period; //23 */        
    /* pmu_en = 1'b1; */
    /* for(i = 0; i < 137; i = i + 1) */
    /* begin */
    /*     if(i < 136) begin */ 
    /*         pmu_data_i = header5[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */

    /* for(i = 0; i < 409; i = i + 1) */
    /* begin */
    /*     if(i < 408) begin */ 
    /*         pmu_data_i = encipher1[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* pmu_en = 1'b0; */

    /* for(i = 0; i < 300; i = i + 1) */
    /* begin */
    /*     #period; */
    /* end */




    /* // Write NVM */

    /* // Load Key */
    /* pmu_en = 1'b1; */
    /* for(i = 0; i < 129; i = i + 1) */
    /* begin */
    /*     if(i < 128) begin */ 
    /*         pmu_data_i = header1[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* for(i = 0; i < 129; i = i + 1) */
    /* begin */
    /*     if(i < 128) begin */ 
    /*         pmu_data_i = key3[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* #period; */
    /* pmu_en = 1'b0; */
    /* #period; //1 */
    /* #period; //2 */
    /* #period; //3 */
    /* #period; //4 */
    /* #period; //5 */
    /* #period; //6 */
    /* #period; //7 */
    /* #period; //8 */
    /* #period; //9 */
    /* #period; //10 */
    /* #period; //11 */ 
    /* #period; //12 */
    /* #period; //13 */
    /* #period; //14 */
    /* #period; //15 */ 
    /* #period; //16 */
    /* #period; //17 */ 
    /* #period; //18 */ 
    /* #period; //19 */
    /* #period; //20 */
    /* #period; //21 */
    /* #period; //22 */
    /* #period; //23 */        
    /* pmu_en = 1'b1; */

    /* pmu_en = 1'b1; */
    /* for(i = 0; i < 129; i = i + 1) */
    /* begin */
    /*     if(i < 128) begin */ 
    /*         pmu_data_i = header6[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* for(i = 0; i < 385; i = i + 1) */
    /* begin */
    /*     if(i < 384) begin */ 
    /*         pmu_data_i = encipher[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* pmu_en = 1'b0; */
    /* #period; //1 */
    /* #period; //2 */
    /* #period; //3 */
    /* #period; //4 */
    /* #period; //5 */

        
    /* //Read NVM */
    /* pmu_en = 1'b1; */
    /* for(i = 0; i < 129; i = i + 1) */
    /* begin */
    /*     if(i < 128) begin */ 
    /*         pmu_data_i = header7[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */

    /* for(i = 0; i < 500; i = i + 1) */
    /* begin */
    /*     #period; */
    /* end */

    /* for(i = 0; i < 200; i = i + 1) */
    /* begin */
    /*     #period; */
    /* end */ 
    /* pmu_en = 1; */
    /* for(i = 0; i < 257; i = i + 1) */
    /* begin */
    /*     if(i < 256) begin */ 
    /*         pmu_data_i = sha_key[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* pmu_en = 0; */
    /* for(i = 0; i < 200; i = i + 1) */
    /* begin */
    /*     #period; */
    /* end */ 
    /* pmu_en = 1; */


    localparam period     = 1000;
    localparam halfperiod = 500;
    reg clk = 1'b0;

    // MEM Wires
    wire mem_clk, mem_we;
    wire [31:0] mem_data_i, mem_data_o;
    wire [7:0]  mem_address;
    
    
    // FPGA Wires
    wire prog_clk;
    //wire pReset;
    //wire data_o;
    wire ccff_w;

    // TEST REGISTERS
    //
    //PMU
    reg tms_i    = 0;
    reg rst_i    = 1;
    reg tdi_i    = 0;
    //FPGA
    reg fpga_rst   = 1;
    reg pReset     = 1;
    reg test_en    = 0;
    reg  [23:0] IN  = 0;
    wire [23:0] DIR = 0;
    wire [23:0] OUT;
    assign OUT = {23 {1'b0}};
    reg IO         = 0;
    reg p_clk = 0;
    reg o_clk = 0;
    reg data_o = 0;
    
        /* pmu pmu_ */
        /* ( */
        /* .tms_i(tms_i), */
        /* .tck_i(clk), */
        /* .rst_i(rst_i), */
        /* .tdi_i(tdi_i), */
        /* .td_o(), */
        /* .mem_data_i(mem_data_i), */
        /* .mem_data_o(mem_data_o), */
        /* .mem_address_o(mem_address), */
        /* .mem_we_o(mem_we), */
        /* .mem_clk_o(mem_clk), */
        /* .progclk_o(prog_clk), */
        /* .pReset_o(pReset), */
        /* .data_o(data_o), */
        /* .ccff_tail_i(ccff_wire) */    
        /* ); */

        /* mem mem_ */
        /* ( */
        /* .clk(mem_clk), */
        /* .we(mem_we), */
        /* .data_i(mem_data_i), */
        /* .address(mem_addres), */
        /* .data_o(mem_data_o) */
        /* ); */

/*         fpga_top fpga_top_ */
/*         ( */
/*         .clk(o_clk), */
/*         .reset(fpga_rst), */
/*         .pReset(pReset), */
/*         .prog_clk(p_clk),  ///prog_clk */
/*         .Test_en(test_en), */
/*         .IO_ISOL_N(IO), */
/*         .gfpga_pad_EMBEDDED_IO_HD_SOC_IN(IN), */
/*         .gfpga_pad_EMBEDDED_IO_HD_SOC_OUT(), */
/*         .gfpga_pad_EMBEDDED_IO_HD_SOC_DIR(OUT), */
/*         .ccff_head(data_o), */
/*         .ccff_tail(ccff_wire) */
/*         ); */


        
    integer i;

    initial begin
        clk = 0;
        forever
        #halfperiod clk = ~clk;
    end


    // JTAG HEADER/FOOTER
    reg [10:0] tdi_header = 11'b01101100000;
    reg [4:0] tdi_footer  =  5'b00000;
    reg [10:0] tms_header = 11'b11000000110;
    reg [4:0] tms_footer  =  5'b11111;
    // =================
    
        
    //FPGA Test    
    initial begin 
    pReset = 0;
    #period;
    pReset = 1;

    #halfperiod;
    data_o = 0;
    #period;
    data_o = 1;
    #period;
    data_o = 0;
    #period;
    data_o = 1;
    #period;
    data_o = 0;
    #period;
    data_o = 1;
    #period;
    data_o = 0;
    #period;
    data_o = 1;
    #period;
    data_o = 0;
    #period;
    data_o = 1;


    pReset     = 0;

        #period;
    data_o = 0;
    #period;
    data_o = 1;
    #period;
    data_o = 0;
    #period;
    data_o = 1;
    #period;
    data_o = 0;
    #period;
    data_o = 1;
    #period;
    data_o = 0;
    #period;
    data_o = 1;
    #period;
    data_o = 0;
    #period;
    data_o = 1;





  


        
    /* for(i = 0; i < 3000; i = i + 1) */
    /* begin */
    /*     p_clk = 1; */
    /*     #halfperiod; */

    /*     p_clk = 0; */
    /*     #halfperiod; */
        
    /*     if(i == 1) */
    /*         data_o = 0; */
    /* end */ 


    /* //LOAD JTAG HEADER */
    /* for(i = 0; i < 11; i = i + 1) */
    /* begin */
    /*     tms_i = tms_header[i]; */
    /*     tdi_i = tdi_header[i]; */
    /*     #period; */

    /* end */
    /* // ================= */

    /* for(i = 0; i < 64; i = i + 1) */
    /* begin */
    /*     tms_i = 0; */
    /*     tdi_i = 1; */
    /*     #period; */

    /* end */
    /* // Load Key */
    /* pmu_en = 1'b1; */
    /* for(i = 0; i < 129; i = i + 1) */
    /* begin */
    /*     if(i < 128) begin */ 
    /*         pmu_data_i = header1[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* for(i = 0; i < 129; i = i + 1) */
    /* begin */
    /*     if(i < 128) begin */ 
    /*         pmu_data_i = key0[i]; */
    /*         #period; */
    /*     end else */
    /*         pmu_data_i = 1'b0; */
    /* end */
    /* //pmu_en = 1'b0; */
    /* #period; //1 */
    /* #period; //2 */
    /* #period; //3 */
    /* #period; //4 */
    /* #period; //5 */
    /* #period; //6 */
    /* #period; //7 */
    /* #period; //8 */
    /* #period; //9 */
    /* #period; //10 */
    /* #period; //11 */ 
    /* #period; //12 */
    /* #period; //13 */
    /* #period; //14 */
    /* #period; //15 */ 
    /* #period; //16 */
    /* #period; //17 */ 
    /* #period; //18 */ 
    /* #period; //19 */
    /* #period; //20 */
    /* #period; //21 */
    /* #period; //22 */
    /* #period; //23 */
    /* // ------------- */


    /* //LOAD JTAG FOOTER */
    /* for(i = 0; i < 5; i = i + 1) */
    /* begin */
    /*     tms_i = tms_footer[i]; */
    /*     tdi_i = tdi_footer[i]; */
    /*     #period; */
    /* end */
    /* // ================= */


    /* #period; */





    
    $stop;
    
    end
    
endmodule
