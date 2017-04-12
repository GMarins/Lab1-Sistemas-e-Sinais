%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 1 - QUEST�O 4 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Considere um sistema cont�nuo LTI cuja resposta impulsiva � dada por h(t), representada
% na Figura 3(a). Considerando que o sinal x(t) (Figura 3(b)) � aplicado na entrada do sistema,
% pede-se:
% (a) Calcule a sa�da resultante.
% (b) Implemente um arquivo lote (.m) que mostre a resposta obtida.
% (c) Compare a resposta obtida no item anterior usando a fun��o conv do Matlab.

tic
t = -5:0.01:5;

h = t .* (t >= -1 & t <= 1);
x = -1 .* (t>=-2 & t<=0) + (-0.5*t+1).*(t>0 & t<=2);
y = conv(x,h,'same') / 100;

fig = figure;
fig.Name = 'Quest�o4';
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
plot(t,y);
title('Sa�da do sistema para a entrada x(t)');
xlabel('t');
ylabel('y(t)');
legend('Resposta Anal�tica','Resposta Num�rica');
axis([-3.5 4 -1 1]);
grid on


toc