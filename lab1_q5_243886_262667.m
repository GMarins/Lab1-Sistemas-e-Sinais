%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 1 - QUESTÃO 5 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. (1,0) Considere um sistema discreto LTI cuja resposta impulsiva é dada por h[n], representada
% na Figura 4(a). Considerando que o sinal x[n] (Figura 4(b)) é aplicado na entrada do sistema,
% pede-se:
% (a) Calcule a saída resultante.
% (b) Implemente um arquivo lote (.m) que mostre a resposta obtida.
% (c) Compare a resposta obtida no item anterior usando a função conv do Matlab.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
tic

n = -10:10;
h = 1 .* (n>=0 & n<=2) + 2 .* (n>=3 & n<=5);
x = 3 .* (n>=-2 & n <=0) + 2 .* (n == 1) + 1 .* (n == 2);
y = conv(h,x,'same');


fig = figure;
fig.Name = 'Questão5';
fig.OuterPosition = [ 0 0 1000 700];
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
title('Saída do sistema para a entrada y[n]');
xlabel('t');
ylabel('y[n]');
legend('Resposta Analítica','Resposta Numérica');
axis([-4 9 0 22 ]);
grid on

toc