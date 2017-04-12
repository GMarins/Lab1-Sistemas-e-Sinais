%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 1 - QUESTÃO 3 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
% 
%Considere um sistema contínuo LTI cuja resposta impulsiva é dada por 
% h(t) = 0.25*exp(-4t)*u(t)
% Considerando que o sinal x(t) = u(t) é aplicado na entrada do sistema, pede-se:
% (a) Calcule a saída resultante.
% (b) Implemente um arquivo lote (.m) que mostre a resposta obtida.
% (c) Compare a resposta obtida no item anterior usando a função conv do Matlab.
%
%Conclusão
%     Pode ser muito trabalhoso encontrar uma resposta analítica através de convolução simbólica, visto que
%     geralmente há a necessidade de se trabalhar com integração por partes. A resposta numérica,
%     obtida através do MATLAB, se mostrou bem mais rápida e prática na sua implementação e, ao final, apresentou o mesmo
%     resultado. Deve ser notado, porém, que como o MATLAB aproxima funções
%     contínuas por numéricas, o resultado da função conv teve que ser
%     dividido pelo step do domínio do tempo.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
tic
%%
t= -5:0.01:5;
h = 9.24 .*exp(-4*t).*sin(6.93*t).*step(t);
x = step(t);
y = conv(x,h,'same') / 100;

%%
ycalculado = 9.24*(exp(-4*t)/16 .* (-sin(6.93*t) - 6.93/4*cos(6.93*t)) + 6.93/64) .* step(t);


fig = figure;
fig.Name = 'Questão3';
fig.OuterPosition = [ 0 0 1000 7000];
subplot(3,1,2);
plot(t,h);
title('Resposta do Sistema ao Impulso');
xlabel('t');
ylabel('h(t)');

subplot(3,1,1);
plot(t,x);
title('Sinal de entrada');
xlabel('t');
ylabel('x(t)');
axis([-5 5 -2 2]);

subplot(3,1,3);
plot(t,ycalculado,t,y);
title('Saída do sistema para a entrada x(t)');
xlabel('t');
ylabel('y(t)');
legend('Resposta Analítica','Resposta Numérica');

toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%