
module mux2 #(parameter WIDTH = 8)
(
    input [WIDTH-1:0] data0,
    input [WIDTH-1:0] data1,
    input select,               //与选择的输入序号相同
    output [WIDTH-1:0] out
);
    assign out = ( select == 1'b1 ) ? data1:data0;
endmodule


module mux4 #(parameter WIDTH = 8)
(
    input  [WIDTH-1:0] d0,
    input  [WIDTH-1:0] d1,
    input  [WIDTH-1:0] d2,
    input  [WIDTH-1:0] d3,
    input  [1:0] select,
    output reg [WIDTH-1:0] out
);
    always @(*) 
        begin
            case (select)
                2'b00: out = data0;
                2'b01: out = data1;
                2'b10: out = data2;
                2'b11: out = data3;
                default: ;
            endcase
        end
endmodule

module mux8 #(parameter WIDTH = 8)
(
    input  [WIDTH-1:0] data0,
    input  [WIDTH-1:0] data1,
    input  [WIDTH-1:0] data2,
    input  [WIDTH-1:0] data3,
    input  [WIDTH-1:0] data4,
    input  [WIDTH-1:0] data5,
    input  [WIDTH-1:0] data6,
    input  [WIDTH-1:0] data7,
    input  [2:0] select,
    output reg [WIDTH-1:0] out
);
    always @(*) 
        begin
            case (select)
                3'b000: out = data0;
                3'b001: out = data1;
                3'b010: out = data2;
                3'b011: out = data3;
                3'b100: out = data4;
                3'b101: out = data5;
                3'b110: out = data6;
                3'b111: out = data7;
                default: ;
            endcase
        end
endmodule


module mux16 #(parameter WIDTH = 8)
(
    input  [WIDTH-1:0] data0,
    input  [WIDTH-1:0] data1,
    input  [WIDTH-1:0] data2,
    input  [WIDTH-1:0] data3,
    input  [WIDTH-1:0] data4,
    input  [WIDTH-1:0] data5,
    input  [WIDTH-1:0] data6,
    input  [WIDTH-1:0] data7,
    input  [WIDTH-1:0] data8,
    input  [WIDTH-1:0] data9,
    input  [WIDTH-1:0] data10,
    input  [WIDTH-1:0] data11,
    input  [WIDTH-1:0] data12,
    input  [WIDTH-1:0] data13,
    input  [WIDTH-1:0] data14,
    input  [WIDTH-1:0] data15,
    input  [4:0] select,
    output reg [WIDTH-1:0] out
);
    always @(*) 
        begin
            case (select)
                4'b0000: out = data0;
                4'b0001: out = data1;
                4'b0010: out = data2;
                4'b0011: out = data3;
                4'b0100: out = data4;
                4'b0101: out = data5;
                4'b0110: out = data6;
                4'b0111: out = data7;
                4'b1000: out = data8;
                4'b1001: out = data9;
                4'b1010: out = data10;
                4'b1011: out = data11;
                4'b1100: out = data12;
                4'b1101: out = data13;
                4'b1110: out = data14;
                4'b1111: out = data15;
                default: ;
            endcase
        end
endmodule
