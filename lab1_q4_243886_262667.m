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

%Conclus�o
%     Pode ser muito trabalhoso encontrar uma resposta anal�tica atrav�s de convolu��o simb�lica, visto que
%     geralmente h� a necessidade de se trabalhar com integra��o por partes. Houve dificuldade 
%      no c�lculo da convolu��o por integral devido aos intervalos de cada parte do sinal. 
%      Isso pode eventualmente acarretar em erros se o gr�fico do sinal n�o estiver
%      dispon�vel. A resposta num�rica,
%     obtida atrav�s do MATLAB, se mostrou bem mais r�pida e pr�tica na sua implementa��o e, ao final, apresentou o mesmo
%     resultado. Deve ser notado, por�m, que como o MATLAB aproxima fun��es
%     cont�nuas por num�ricas, o resultado da fun��o conv teve que ser
%     dividido pelo step do dom�nio do tempo.

tic
t = -5:0.01:5;

h = t .* (t >= -1 & t <= 1);
x = -1 .* (t>=-2 & t<=0) + (-0.5*t+1).*(t>0 & t<=2);
y = conv(x,h,'same') / 100;

ycalculado = (1/2).*((-t.^2)-(4.*t)-3) .* (t >= -3 & t <= -1) + ...
             (1/12).*((-t.^3)+(12.*t.^2)+(3.*t)-10) .* (t > -1 & t < 1) + ...
             (t/12).*((t-3).^2) .* (t >=1 & t <=3);
         

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
plot(t,y,t,ycalculado);
title('Sa�da do sistema para a entrada x(t)');
xlabel('t');
ylabel('y(t)');
legend('Resposta Anal�tica','Resposta Num�rica');
axis([-3.5 4 -1 1]);
grid on


toc