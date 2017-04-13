%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 1 - QUESTÃO 4 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Considere um sistema contínuo LTI cuja resposta impulsiva é dada por h(t), representada
% na Figura 3(a). Considerando que o sinal x(t) (Figura 3(b)) é aplicado na entrada do sistema,
% pede-se:
% (a) Calcule a saída resultante.
% (b) Implemente um arquivo lote (.m) que mostre a resposta obtida.
% (c) Compare a resposta obtida no item anterior usando a função conv do Matlab.

%Conclusão
%     Pode ser muito trabalhoso encontrar uma resposta analítica através de convolução simbólica, visto que
%     geralmente há a necessidade de se trabalhar com integração por partes. Houve dificuldade 
%      no cálculo da convolução por integral devido aos intervalos de cada parte do sinal. 
%      Isso pode eventualmente acarretar em erros se o gráfico do sinal não estiver
%      disponível. A resposta numérica,
%     obtida através do MATLAB, se mostrou bem mais rápida e prática na sua implementação e, ao final, apresentou o mesmo
%     resultado. Deve ser notado, porém, que como o MATLAB aproxima funções
%     contínuas por numéricas, o resultado da função conv teve que ser
%     dividido pelo step do domínio do tempo.

tic
t = -5:0.01:5;

h = t .* (t >= -1 & t <= 1);
x = -1 .* (t>=-2 & t<=0) + (-0.5*t+1).*(t>0 & t<=2);
y = conv(x,h,'same') / 100;

ycalculado = (1/2).*((-t.^2)-(4.*t)-3) .* (t >= -3 & t <= -1) + ...
             (1/12).*((-t.^3)+(12.*t.^2)+(3.*t)-10) .* (t > -1 & t < 1) + ...
             (t/12).*((t-3).^2) .* (t >=1 & t <=3);
         

fig = figure;
fig.Name = 'Questão4';
fig.OuterPosition = [ 0 0 1000 700];
subplot(1,3,1);
plot(t,h);
title('Resposta do Sistema ao Impulso');
xlabel('t');
ylabel('h(t)');
axis([-2.5 2.5 -2 2]);
grid on

subplot(1,3,2);
plot(t,x);
title('Sinal de entrada');
xlabel('t');
ylabel('x(t)');
axis([-2.5 2.5 -2 2]);
grid on

subplot(1,3,3);
plot(t,y,t,ycalculado);
title('Saída do sistema para a entrada x(t)');
xlabel('t');
ylabel('y(t)');
legend('Resposta Analítica','Resposta Numérica');
axis([-3.5 4 -1 1]);
grid on


toc