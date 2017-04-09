
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 1 - QUEST�O 2 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
% Para os sinais apresentados nas figuras abaixo, aplique as opera�c�oes de reflex�ao e deslocamento
% no tempo.
% (a) Apresente a express�o obtida ap�s as opera��eses, considerando um deslocamento no tempo
% de tau segundos.
% (b) Implemente um arquivo lote (.m) que mostre, cada sinal obtido, considerando os sinais
% refletidos e deslocamentos de tau = -2, 0, 3. Com o objetivo de melhor visualizar o efeito do
% deslocamento no tempo, para cada um dos sinais considerados, plotar cada um dos sinais
% deslocados em uma mesma figura.

%Conclus�o
%     Pudemos visualizar os efeitos de um sinal deslocado no tempo e a opera��o de reflex�o.
%     A opera��o de deslocamento foi implementado em "deslocamento.m" e a opera��o de reflex�o foi
%     feita invertendo o vetor de tempo segundo a express�o frefletido(x) = f(-x).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

 %A) Embora um deslocamento de um tempo tau possa ser implementado num sinal
 %realizando fdeslocado(x) = f(x - tau), optamos por realizar a opera��o
 %num arquivo separado 'deslocamento.m'
 
 t = -8:0.001:8;
 

 %Implementamos os sinais utilizando os operadores l�gicos para descrever o sinal
 %a cada periodo. Isso equivale a utilizar a fun��o degrau para cada pulso num intervalo
 x = exp(-t) .* (t >= 0 & t <=1);
 y = t .* (t>=-1 & t <= 1);
 z = 1 .* (t>=1 & t<=3) + 2.*(t>3 & t<=4);
 
 %A implementa��o das opera��es de deslocamento se encontram documentadas no arquivo
 %1deslocamento.m'
 %A opera��o de reflex�o no eixo y pode ser obtida multiplicando o vetor de
 %tempo por -1
 %A opera��o de reflex�o no eixo x pode ser obtida multiplicando o vetor de
 %sinal por -1
 
 %x(t)
 figy = figure
 figy.Name = 'Quest�o2 - x(t)';
 figy.OuterPosition = [ 0 0 1000 7000];
 subplot(2,1,1)
 plot(t,deslocamento(t,x,-2),t,deslocamento(t,x,0),'g',...
       t,deslocamento(t,x,3),'r');
 leg = legend('$\tau = -2$','$\tau = 0$','$\tau = 3$'); 
 set(leg,'Interpreter','latex'); %Legenda em LaTex
 xlabel('t');
 ylabel('x(t)');
 title('Sinais N�o-refletidos');
 axis([-3 5 -0.5 1.5]);
 grid on;
 
 subplot(2,1,2)
 plot(-t,deslocamento(t,x,2),-t,deslocamento(t,x,0),'g',...
       -t,deslocamento(t,x,-3),'r'); %Para reflexao em y, invertemos a escala de tempo
 leg2 = legend('$\tau = -2$','$\tau = 0$','$\tau = 3$'); 
 set(leg2,'Interpreter','latex'); %Legenda em LaTex
 xlabel('t');
 ylabel('x(t)');
 title('Sinais refletidos');
 grid on;
 axis([-3 5 -0.5 1.5]);
 
 %y(t)
 figy = figure
 figy.Name = 'Quest�o2 - y(t)';
 figy.OuterPosition = [ 0 0 1000 7000];
 subplot(2,1,1)
 plot(t,deslocamento(t,y,-2),t,deslocamento(t,y,0),'g',...
       t,deslocamento(t,y,3),'r');
 leg = legend('$\tau = -2$','$\tau = 0$','$\tau = 3$'); 
 set(leg,'Interpreter','latex'); %Legenda em LaTex
 xlabel('t');
 ylabel('y(t)');
 title('Sinais N�o-refletidos');
 axis([-3 5 -2 1.5]);
 grid on;
 
 subplot(2,1,2)
 plot(-t,deslocamento(t,y,2),-t,deslocamento(t,y,0),'g',...
       -t,deslocamento(t,y,-3),'r'); %Para reflexao em y, invertemos a escala de tempo
 leg2 = legend('$\tau = -2$','$\tau = 0$','$\tau = 3$'); 
 set(leg2,'Interpreter','latex'); %Legenda em LaTex
 xlabel('t');
 ylabel('y(t)');
 title('Sinais refletidos');
 grid on;
 axis([-3 5 -2 1.5]);
 
 %z(t)
 figy = figure
 figy.Name = 'Quest�o2 - z(t)';
 figy.OuterPosition = [ 0 0 1000 7000];
 subplot(2,1,1)
 plot(t,deslocamento(t,z,-2),t,deslocamento(t,z,0),'g',...
       t,deslocamento(t,z,3),'r');
 leg = legend('$\tau = -2$','$\tau = 0$','$\tau = 3$'); 
 set(leg,'Interpreter','latex'); %Legenda em LaTex
 xlabel('t');
 ylabel('z(t)');
 title('Sinais N�o-refletidos');
 axis([-3 8 -0.5 2.5]);
 grid on;
 
 subplot(2,1,2)
 plot(-t,deslocamento(t,z,2),-t,deslocamento(t,z,0),'g',...
       -t,deslocamento(t,z,-3),'r'); %Para reflexao em y, invertemos a escala de tempo
 leg2 = legend('$\tau = -2$','$\tau = 0$','$\tau = 3$'); 
 set(leg2,'Interpreter','latex'); %Legenda em LaTex
 xlabel('t');
 ylabel('z(t)');
 title('Sinais refletidos');
 grid on;
 axis([-7 4 -0.5 2.5]);
 