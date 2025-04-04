`timescale 1ns/100ps

module tb_ctrl;

  // ins
  logic clock = 0;
  logic reset;
  logic[3:0] dig;
  logic[3:0] pos;

  // outs
  logic[8] a;
  logic[8] b;
  logic[8] c;
  logic[8] d;
  logic[8] e;
  logic[8] f;
  logic[8] g;
  logic[8] dp;

  //sinal de clock de 1ns
  always #1 clock = ~clock; 


  //instanciando o ctrl.sv
  //.* conecta automaticamente os sinais de mesmo nome entre tb e modulo.
  ctrl master0(.*);


  //esse bloco roda apenas uma vez
  //ele basicamente reseta o sistema.
  initial begin
    dig = 0;
    pos = 0;
    reset = 1; 
    #1 reset = 0;
    
  end  
  // --------------------------------//




//simula o comportamento de entrada ao longo do tempo
 
  //a cada clock ele...
  always @(posedge clock) begin

    //indica o displau e o digito atual
     $display("Display %0d <- Digit %0d", pos, dig);

  //valores dos segmentos
  $display("a=%b b=%b c=%b d=%b e=%b f=%b g=%b dp=%b", 
         a[pos], b[pos], c[pos], d[pos], e[pos], f[pos], g[pos], dp[pos]);


    //quando dig chega a 9 ele incrementa +1 à pos
    if(dig == 4'b1001) begin
      dig <= 0;
      pos = pos +1;

      $display("\n-------------------------------\n"); //Para separar os displays no terminal


    end else begin

    //se não, incrimenta +1 ao digito
    dig <= dig + 1;
    end


     if (pos == 8) begin
        $display("End of simulation");
        $stop;
      end


  end

endmodule
