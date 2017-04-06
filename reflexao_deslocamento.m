
function [y] = reflexao_deslocamento(sinal,eixo,deslocamento)
%Realiza operaçoes de reflexao e deslocamento de um sinal dado, nessa ordem
%  Reflexao no eixo x e dada por f2(x) = -f1(x)
%  Reflexao no eixo y e dada por f2(x) = f1(-x)
% 
% Parâmetros
% --------------------
% sinal: double 1xM
%  Array que representa os valores de um sinal 
% eixo: char 1x1
%  Caractere que indica o eixo no qual havera deslocamento
% deslocamento: double
%  Numero que indica o valor que atrasara ou adiantara o sinal dado
% 
% Retornos
% ---------------------
% y: double 1xM
%  Sinal modificado
  
  if eixo == ''
    sinal = sinal; %Se nada for indicado, nao reflete
  end
  if eixo == 'x'
    sinal = -sinal; 
  end
  if eixo == 'y'
    sinal = sinal(end:-1:1) %Inverte sinal da direita pra esquerda
  end
  
  y = circshift(sinal,[1 -deslocamento]); %Realiza o deslocamento do sinal refletido
  
end 