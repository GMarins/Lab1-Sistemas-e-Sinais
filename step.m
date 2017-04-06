
function [y] = step(t)
% Função que implementa a função Degrau de Heaviside
%  Dado um array de tempos, retorna um array com o resultado de u(t)
%
%Gabriel Marins da Costa e Arthur Koucher

%Obs: Foi utilizado que u(0) = 1
%Obs2: Se plotado com step pequeno, o gráfico pode aparentar conter uma
%       reta visto que o matlab automaticamente conecta os intervalos
% Parâmetros:
% ---------------
% t: double 1xM
%   Array de tempos
%
% Retornos:
% ---------------
% y: double 1xM
%   Array que representa u(t)
%
%Exemplos
% >>step(2)
%
% ans =
%
%      1
% >> step([-2 -1 0 1 2])
%
% ans =
%
%      0     0     1     1     1



  y = [];
  for i=1:length(t)
    if t(i) >= 0
      y = [y 1];
    else
      y = [y 0];
    end
  end 

end
