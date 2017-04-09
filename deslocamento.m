
function [y] = deslocamento(t, sinal,deslocamento)
%Realiza a operação de deslocamento de um sinal dado
%   A operação é feita pela função circshift do MATLAB, que realiza o
%   deslocamento circular de um sinal dado, similar ao que acontece com o
%   ajuste na tela de um osciloscópio. A entrada t é necessária para
%   ajustar a escala do deslocamento, dependendo do intervalo de tempo para
%   fazer a correspondência dos índices com a escala de tempo utilizada.
% 
% Parâmetros
% --------------------
% sinal: double 1xM
%  Array que representa os valores de um sinal 
% t: double 1xM
%   Array SIMÉTRICO de tempos que é utilizado para normalização dos deslocamentos
% deslocamento: double
%  Número que indica o valor no tempo que atrasará ou adiantará o sinal dado
% 
% Retornos
% ---------------------
% y: double Mx1
%  Sinal modificado 
%
%Exemplos:
%>>t = -4:4;
% >>s = 2*t;
% >>deslocamento(t,s,3);
% ans =
% 
%      4
%      6
%      8
%     -8
%     -6
%     -4
%     -2
%      0
%      2

  if size(t,1) == 1
      sinal = sinal'; %Transpõe o sinal para que seja compatível com a função circshift
  end
  
  
  %Computar quantos deslocamentos no índice do array precisaremos para um
  %deslocamento na escala do tempo
  tinicial = t(1);
  tfinal = t(end);
  range = tfinal - tinicial;
  step = (length(t)-1)/range; %normalização - #indices percorridos/segundo
  deslocamento = deslocamento * step; %Deslocamento normalizado na nova escala
  
  y = circshift(sinal,deslocamento); %Realiza o deslocamento do sinal refletido
                                      %Essa função requer que o argumento
                                      %de entrada seja um sinal transposto
  
end 