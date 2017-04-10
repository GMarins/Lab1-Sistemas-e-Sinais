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
%     Pode ser muito trabalhoso encontrar uma resposta analítica através de convolução, visto que
%     geralmente há a necessidade de se trabalhar com integração por partes. A resposta numérica,
%     obtida através do MATLAB, se mostrou bem mais rápida e prática na sua implementação.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
tic
%%
t= 0:0.001:3;
h = 9.24 .*exp(-4*t).*sin(6.93*t).*step(t);
x = step(-t);
y = conv(h,x,'same')*10*5.31;
y = y - y(1);
%plot(t,y);
%%
ycalculado = 9.24*(exp(-4*t)/16 .* (-sin(6.93*t) - 6.93/4*cos(6.93*t)) + 6.93/64);
%ycalculado2 = 924/640249.*exp(-4*t).*(693*exp(4*t)-400*sin(6.93*t)-693*cos(6.93*t));

figure
plot(t,ycalculado,t,y);
title('Curva de Resposta do Sistema');
xlabel('t');
ylabel('y(t)');
legend('Resposta calculada','Resposta numérica');

toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%