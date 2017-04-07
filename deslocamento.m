
function [y] = deslocamento(t, sinal,deslocamento)
%Realiza opera��es de reflex�o e deslocamento de um sinal dado, nessa ordem
%  Reflex�o no eixo x � dada por f2(x) = -f1(x)
%  Reflex�o no eixo y � dada por f2(x) = f1(-x)
% 
% Par�metros
% --------------------
% sinal: double 1xM
%  Array que representa os valores de um sinal 
% t: double 1xM
%   Array SIM�TRICO de tempos que � utilizado para normaliza��o dos deslocamentos
% deslocamento: double
%  N�mero que indica o valor que atrasar� ou adiantar� o sinal dado
% 
% Retornos
% ---------------------
% y: double Mx1
%  Sinal modificado 
    
    if nargin == 3 %Se apenas dois argumentos forem fornecidos, considere o eixo = ''
        eixo = '';
    end
  if size(t,1) == 1
      sinal = sinal'; %Transp�e o sinal para que seja compat�vel com a fun��o circshift
  end
  
  
  %Computar quantos deslocamentos no �ndice do array precisaremos para um
  %deslocamento na escala do tempo
  tinicial = t(1);
  tfinal = t(end);
  range = tfinal - tinicial;
  step = (length(t)-1)/range; %normaliza��o - #indices percorridos/segundo
  deslocamento = deslocamento * step; 
  
  y = circshift(sinal,deslocamento); %Realiza o deslocamento do sinal refletido
                                      %Essa fun��o requer que o argumento
                                      %de entrada seja um sinal transposto
  
end 