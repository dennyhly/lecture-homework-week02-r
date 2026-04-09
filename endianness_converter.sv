module endianness_converter(
    input wire clk,
    input wire [31:0] word,
    input wire endianness_in,
    input wire endianness_out,
    output logic [31:0] converted_word
);

always@ (posedge clk) begin
    if (endianness_in) begin
        if (word[31:24] > word[7:0]) begin
            converted_word <= word;
        end else begin
            converted_word <= {word[7:0], word[15:8], word[23:16], word[31:24]};
        end
    end else begin
        if (word[31:24] < word[7:0]) begin
            converted_word <= word;
        end else begin
            converted_word <= {word[7:0], word[15:8], word[23:16], word[31:24]};
        end
    end
end
endmodule