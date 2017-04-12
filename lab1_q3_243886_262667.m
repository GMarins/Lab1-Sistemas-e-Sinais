%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 1 - QUEST�O 3 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
% 
%Considere um sistema cont�nuo LTI cuja resposta impulsiva � dada por 
% h(t) = 0.25*exp(-4t)*u(t)
% Considerando que o sinal x(t) = u(t) � aplicado na entrada do sistema, pede-se:
% (a) Calcule a sa�da resultante.
% (b) Implemente um arquivo lote (.m) que mostre a resposta obtida.
% (c) Compare a resposta obtida no item anterior usando a fun��o conv do Matlab.
%
%Conclus�o
%     Pode ser muito trabalhoso encontrar uma resposta anal�tica atrav�s de convolu��o simb�lica, visto que
%     geralmente h� a necessidade de se trabalhar com integra��o por partes. A resposta num�rica,
%     obtida atrav�s do MATLAB, se mostrou bem mais r�pida e pr�tica na sua implementa��o e, ao final, apresentou o mesmo
%     resultado. Deve ser notado, por�m, que como o MATLAB aproxima fun��es
%     cont�nuas por num�ricas, o resultado da fun��o conv teve que ser
%     dividido pelo step do dom�nio do tempo.
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
fig.Name = 'Quest�o3';
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
title('Sa�da do sistema para a entrada x(t)');
xlabel('t');
ylabel('y(t)');
legend('Resposta Anal�tica','Resposta Num�rica');

toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%