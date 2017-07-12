module debounce(input clk, input chave, output reg sinal);
   reg [19:0]cnt;
	reg chTemp;
	always @(posedge clk) begin
	   if (chTemp != chave) begin
		  cnt <= 20'h222e0;
		  chTemp <= chave;
		end else if (cnt==0) 
		          sinal <= chave;
				  else cnt = cnt-20'd1;	 
				 
	end
endmodule

module divClk(input clk_in, input [25:0] divisor, output reg clk_out);
reg [25:0] cnt;
  always @ (posedge clk_in)
    begin
	   if (cnt==0) begin
		  clk_out <= ~clk_out;
		  cnt <= divisor; 
		end
      else cnt<= cnt-26'd1;		
	 end
endmodule 


module  display7seg( dado, leds);

input [:] dado;
output reg [:] leds;
  always @ *
	begin
		case (dado)
		endcase
	end
endmodule

module calculadora (
				input CLK_28, 
				input [17:0] SW, 
				input [3:0] KEY,
				output [17:0] LEDR, 
				output [7:0] LEDG, 
				output [7:0] HEX0_D, 
				output [7:0] HEX1_D, 
				output [7:0] HEX2_D, 
				output [7:0] HEX3_D, 
				output [7:0] HEX4_D, 
				output [7:0] HEX5_D, 
				output [7:0] HEX6_D, 
				output [7:0] HEX7_D
				);
	reg [1:0] op;
	wire [3:0] resultado;
	wire operacao = kAdd &  kSub & kMul & kDiv;
	
	
	  always @ (negedge operacao)// or negedge kMul or negedge kDiv)
	  begin
	  end  
	
endmodule	
