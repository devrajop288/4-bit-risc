module RegisterFile (
    input clk, write_enable,
    input [1:0] write_addr, read_addr,
    input [3:0] write_data,
    output [3:0] read_data
);
    reg [3:0] registers [0:3];
    assign read_data = registers[read_addr];

    always @(posedge clk) begin
        if (write_enable)
            registers[write_addr] <= write_data;
    end
endmodule
