module InstructionMemory (
    input [3:0] address,
    output [7:0] instruction
);
    reg [7:0] memory [0:15];
    initial begin
        memory[0] = 8'b00010001; // LOAD R1
        memory[1] = 8'b00110010; // ADD R2
        memory[2] = 8'b00100011; // STORE R3
        memory[3] = 8'b11110000; // HALT
    end
    assign instruction = memory[address];
endmodule
