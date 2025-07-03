module RISC_CPU (
    input clk
);
    reg [3:0] PC = 0;
    wire [7:0] instr;
    wire [3:0] opcode = instr[7:4];
    wire [3:0] operand = instr[3:0];

    wire [3:0] reg_data, alu_out;
    reg [3:0] A = 0;
    wire [2:0] ALU_Sel;
    wire load, store, halt;

    InstructionMemory imem (.address(PC), .instruction(instr));
    RegisterFile rf (
        .clk(clk),
        .write_enable(load),
        .write_addr(operand[1:0]),
        .read_addr(operand[1:0]),
        .write_data(alu_out),
        .read_data(reg_data)
    );
    ALU alu (.A(A), .B(reg_data), .ALU_Sel(ALU_Sel), .ALU_Out(alu_out));
    ControlUnit cu (.opcode(opcode), .ALU_Sel(ALU_Sel), .load(load), .store(store), .halt(halt));

    always @(posedge clk) begin
        if (!halt) begin
            A <= reg_data;
            PC <= PC + 1;
        end
    end
endmodule
