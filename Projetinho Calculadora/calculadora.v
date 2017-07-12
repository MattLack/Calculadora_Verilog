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
	
	debounce db1(.clk(CLK_28), .chave(KEY[0]), .sinal(kAdd));
	debounce db2(.clk(CLK_28), .chave(KEY[1]), .sinal(kSub));
	debounce db3(.clk(CLK_28), .chave(KEY[2]), .sinal(kMul));
	debounce db4(.clk(CLK_28), .chave(KEY[3]), .sinal(kDiv));
	
	modCalc mc (.A(SW[3:0]), .B(SW[7:4]), .S(resultado), .OP(op)); 
	
	  always @ (negedge operacao)// or negedge kMul or negedge kDiv)
	  begin
		  if  (kAdd==0) begin
			op <=0;
		  end	
		  else  if  (kSub==0) begin
					  op <=1;
					end  
					else  if  (kMul==0) begin
								 op <=2;
						   end		 
							else if  (kDiv==0) begin
								 op <=3;
							end	 
	   end
	  
	  
	display7seg dsp0( SW[3:0], HEX0_D);
	display7seg dsp1( SW[7:4], HEX1_D);
	display7seg dsp2( resultado, HEX2_D);
	display7seg dsp3( op, HEX3_D);
	
endmodule	
