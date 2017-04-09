
function [y] = deslocamento(t, sinal,deslocamento)
%Realiza a opera��o de deslocamento de um sinal dado
%   A opera��o � feita pela fun��o circshift do MATLAB, que realiza o
%   deslocamento circular de um sinal dado, similar ao que acontece com o
%   ajuste na tela de um oscilosc�pio. A entrada t � necess�ria para
%   ajustar a escala do deslocamento, dependendo do intervalo de tempo para
%   fazer a correspond�ncia dos �ndices com a escala de tempo utilizada.
% 
% Par�metros
% --------------------
% sinal: double 1xM
%  Array que representa os valores de um sinal 
% t: double 1xM
%   Array SIM�TRICO de tempos que � utilizado para normaliza��o dos deslocamentos
% deslocamento: double
%  N�mero que indica o valor no tempo que atrasar� ou adiantar� o sinal dado
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
      sinal = sinal'; %Transp�e o sinal para que seja compat�vel com a fun��o circshift
  end
  
  
  %Computar quantos deslocamentos no �ndice do array precisaremos para um
  %deslocamento na escala do tempo
  tinicial = t(1);
  tfinal = t(end);
  range = tfinal - tinicial;
  step = (length(t)-1)/range; %normaliza��o - #indices percorridos/segundo
  deslocamento = deslocamento * step; %Deslocamento normalizado na nova escala
  
  y = circshift(sinal,deslocamento); %Realiza o deslocamento do sinal refletido
                                      %Essa fun��o requer que o argumento
                                      %de entrada seja um sinal transposto
  
end 