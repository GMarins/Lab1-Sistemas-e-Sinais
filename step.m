
function [y] = step(t)
% Função que descreve a função degrau
%  Dado um array de tempos, retorna um array com o resultado de u(t)
% Parâmetros:
% ---------------
% t: double 1xM
%   Array de tempos
%
% Retornos:
% y: double 1xM
%   Array que representa u(t)

  y = []
  for i=1:length(t)
    if t(i) >= 0
      y = [y 1]
    else
      y = [y 0]

end
