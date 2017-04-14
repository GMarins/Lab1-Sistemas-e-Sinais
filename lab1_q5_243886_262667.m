%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 1 - QUEST�O 5 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. (1,0) Considere um sistema discreto LTI cuja resposta impulsiva � dada por h[n], representada
% na Figura 4(a). Considerando que o sinal x[n] (Figura 4(b)) � aplicado na entrada do sistema,
% pede-se:
% (a) Calcule a sa�da resultante.
% (b) Implemente um arquivo lote (.m) que mostre a resposta obtida.
% (c) Compare a resposta obtida no item anterior usando a fun��o conv do Matlab.

%Conclus�o
%     H� uma certa dificuldade em visualizar a convolu��o em sinais
%     discretos. O processo pode ser trabalhoso por se trabalhar com
%     somat�rios, por vezes realizando as opera��es diversas vezes devido
%     aos deslocamentos. O uso da ferramenta
%     computacional torna o c�lculo e a verifica��o bem mais �gil, chegando
%     ao mesmo resultado que a resposta anal�tica.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clear all;
tic

n = -10:10;
h = 1 .* (n>=0 & n<=2) + 2 .* (n>=3 & n<=5);
x = 3 .* (n>=-2 & n <=0) + 2 .* (n == 1) + 1 .* (n == 2);
y = conv(h,x,'same');

%Resposta anal�tica atrav�s da identidade da soma de convolu��o utilizando
%a fun��o Delta de Dirac
ycalculado = 3 .* (n == -2) + ...
             6 .* (n == -1)  + ...
             9 .* (n == 0) + ...
             14 .* (n == 1) + ...
             18 .* (n == 2) +...
             21 .* (n == 3) + ...
             17 .* (n == 4) + ...
             12 .* (n == 5) + ...
             6 .* (n == 6) + ...
             2 .* (n == 7);
fig = figure;
fig.Name = 'Quest�o5';
fig.OuterPosition = [ 0 0 1000 720];
subplot(1,3,1);
stem(n,h);
title('Resposta do Sistema ao Impulso');
xlabel('n');
ylabel('h[n]');
axis([-3 6 0 2.5]);
grid on

subplot(1,3,2);
stem(n,x);
title('Sinal de entrada');
xlabel('n');
ylabel('x[n]');
axis([-5 5 0 3.5]);
grid on

subplot(1,3,3);
stem(n,y);
hold
stem(n,ycalculado);
title('Sa�da do sistema para a entrada y[n]');
xlabel('t');
ylabel('y[n]');
legend('Resposta Anal�tica','Resposta Num�rica');
axis([-4 9 0 22 ]);
grid on

toc