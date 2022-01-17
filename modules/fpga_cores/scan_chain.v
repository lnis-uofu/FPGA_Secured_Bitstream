
// ┌───────────────────────────────────────────────────┐
// │  File Name :  scan_chain.v                        │
// │                                                   │
// │  Author    :  Allen Boston                        │
// │                                                   │
// │  Date      :  December 28, 2021                   │
// │                                                   │
// ├───────────────────────────────────────────────────┤
// │  Breif     :  Shift Register to model the         │
// │               configuration chain in a FPGA       │
// │               core.                               │
// │                                                   │
// │                                                   │
// │                                                   │
// └───────────────────────────────────────────────────┘


module scan_chain_128 #(
    parameter integer SC_LENGTH   = 128
)(
    input clk,
    input en,
    input clear,
    input data_i
    //output data_o
);


reg [SC_LENGTH-1:0] data = 0;
    
always @ (posedge clk or negedge clear)
    begin
        if (en == 1'b1)
            begin
                data = {data_i, data[SC_LENGTH-1:1]};
            end
        else if(clear == 1'b0)
            data = 0;
    end


    assign data_o = data[0];
    
endmodule

module scan_chain_1024 #(
    parameter integer SC_LENGTH   = 1024
)(
    input clk,
    input en,
    input clear,
    input data_i
    //output data_o
);


reg [SC_LENGTH-1:0] data = 0;
    
always @ (posedge clk or negedge clear)
    begin
        if (en == 1'b1)
            begin
                data = {data_i, data[SC_LENGTH-1:1]};
            end
        else if(clear == 1'b0)
            data = 0;
    end


    assign data_o = data[0];
    
endmodule

module scan_chain_1Kb #(
    parameter integer SC_LENGTH   = 8192
)(
    input clk,
    input en,
    input clear,
    input data_i
    //output data_o
);


reg [SC_LENGTH-1:0] data = 0;
    
always @ (posedge clk or negedge clear)
    begin
        if (en == 1'b1)
            begin
                data = {data_i, data[SC_LENGTH-1:1]};
            end
        else if(clear == 1'b0)
            data = 0;
    end


    assign data_o = data[0];
    
endmodule

module scan_chain_10Kb #(
    parameter integer SC_LENGTH   = 8192
)(
    input clk,
    input en,
    input clear,
    input data_i
    //output data_o
);


reg [SC_LENGTH-1:0] data = 0;
    
always @ (posedge clk or negedge clear)
    begin
        if (en == 1'b1)
            begin
                data = {data_i, data[SC_LENGTH-1:1]};
            end
        else if(clear == 1'b0)
            data = 0;
    end


    assign data_o = data[0];
    
endmodule

module scan_chain_10Kb #(
    parameter integer SC_LENGTH   = 8388608
)(
    input clk,
    input en,
    input clear,
    input data_i
    //output data_o
);


reg [SC_LENGTH-1:0] data = 0;
    
always @ (posedge clk or negedge clear)
    begin
        if (en == 1'b1)
            begin
                data = {data_i, data[SC_LENGTH-1:1]};
            end
        else if(clear == 1'b0)
            data = 0;
    end


    assign data_o = data[0];
    
endmodule

module scan_chain_100Kb #(
    parameter integer SC_LENGTH   = 819200
)(
    input clk,
    input en,
    input clear,
    input data_i
    //output data_o
);


reg [SC_LENGTH-1:0] data = 0;
    
always @ (posedge clk or negedge clear)
    begin
        if (en == 1'b1)
            begin
                data = {data_i, data[SC_LENGTH-1:1]};
            end
        else if(clear == 1'b0)
            data = 0;
    end


    assign data_o = data[0];
    
endmodule

module scan_chain_1Mb #(
    parameter integer SC_LENGTH   = 1024
)(
    input clk,
    input en,
    input clear,
    input data_i
    //output data_o
);


reg [SC_LENGTH-1:0] data = 0;
    
always @ (posedge clk or negedge clear)
    begin
        if (en == 1'b1)
            begin
                data = {data_i, data[SC_LENGTH-1:1]};
            end
        else if(clear == 1'b0)
            data = 0;
    end


    assign data_o = data[0];
    
endmodule
