
function [y] = deslocamento(t, sinal,deslocamento)
%Realiza operações de reflexão e deslocamento de um sinal dado, nessa ordem
%  Reflexão no eixo x é dada por f2(x) = -f1(x)
%  Reflexão no eixo y é dada por f2(x) = f1(-x)
% 
% Parâmetros
% --------------------
% sinal: double 1xM
%  Array que representa os valores de um sinal 
% t: double 1xM
%   Array SIMÉTRICO de tempos que é utilizado para normalização dos deslocamentos
% deslocamento: double
%  Número que indica o valor que atrasará ou adiantará o sinal dado
% 
% Retornos
% ---------------------
% y: double Mx1
%  Sinal modificado 
    
    if nargin == 3 %Se apenas dois argumentos forem fornecidos, considere o eixo = ''
        eixo = '';
    end
  if size(t,1) == 1
      sinal = sinal'; %Transpõe o sinal para que seja compatível com a função circshift
  end
  
  
  %Computar quantos deslocamentos no índice do array precisaremos para um
  %deslocamento na escala do tempo
  tinicial = t(1);
  tfinal = t(end);
  range = tfinal - tinicial;
  step = (length(t)-1)/range; %normalização - #indices percorridos/segundo
  deslocamento = deslocamento * step; 
  
  y = circshift(sinal,deslocamento); %Realiza o deslocamento do sinal refletido
                                      %Essa função requer que o argumento
                                      %de entrada seja um sinal transposto
  
end 