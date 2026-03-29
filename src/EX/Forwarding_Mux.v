module Forwarding_Mux(
    input [31:0] rd1, rd2,
    input [31:0] ex_mem_data, mem_wb_data,
    input [1:0] forwardA, forwardB,
    output reg [31:0] A_out, B_out);

always @(*) begin
    case(forwardA)
        2'b00: A_out = rd1;
        2'b10: A_out = ex_mem_data;
        2'b01: A_out = mem_wb_data;
        default: A_out = rd1;
    endcase

    case(forwardB)
        2'b00: B_out = rd2;
        2'b10: B_out = ex_mem_data;
        2'b01: B_out = mem_wb_data;
        default: B_out = rd2;
    endcase
end
endmodule
