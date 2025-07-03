module ControlUnit (
    input [3:0] opcode,
    output reg [2:0] ALU_Sel,
    output reg load, store, halt
);
    always @(*) begin
        {load, store, halt} = 3'b000;
        case (opcode)
            4'b0001: load  = 1;
            4'b0010: store = 1;
            4'b0011: ALU_Sel = 3'b000; // ADD
            4'b0100: ALU_Sel = 3'b001; // SUB
            4'b0101: ALU_Sel = 3'b010; // AND
            4'b0110: ALU_Sel = 3'b011; // OR
            4'b0111: ALU_Sel = 3'b100; // NOT
            4'b1111: halt = 1;
            default: ALU_Sel = 3'b000;
        endcase
    end
endmodule
