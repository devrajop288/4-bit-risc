module ALU (
    input [3:0] A, B,
    input [2:0] ALU_Sel,   // Select signal
    output reg [3:0] ALU_Out
);
    always @(*) begin
        case (ALU_Sel)
            3'b000: ALU_Out = A + B;    // ADD
            3'b001: ALU_Out = A - B;    // SUB
            3'b010: ALU_Out = A & B;    // AND
            3'b011: ALU_Out = A | B;    // OR
            3'b100: ALU_Out = ~A;       // NOT A
            default: ALU_Out = 4'b0000;
        endcase
    end
endmodule
