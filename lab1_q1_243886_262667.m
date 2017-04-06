%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 1 - QUESTÃO 1 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Q1a
t = -9:0.01:9;

%a
x1 = (1 + t) .* step(t + 1) + (6 - 2*t) .* step(t - 3) - (7 - t) .* step(t - 7);
%b
y1 = 2 *(4 - t)- 4*step(-1 - t);
%c
n = -10:1:10;
x2 = 2*n.^2.*step(n) - (n+50).*step(n-6)-(2*n.^2-n-80).*step(n-9);
%d
y2 = 2*n.^2 .* step(-n) - (n+50) .* step(-n-6) - (2*n.^2 -n -80).*step(-n-9);

fig = figure;
fig.Name = 'Questão 1.a)';
fig.OuterPosition = [0 0 1000 700];
subplot(2,2,1);
plot(t,x1);
title('a');
xlabel('t');
ylabel('x(t)');

subplot(2,2,2);
plot(t,y1);
title('b');
xlabel('t');
ylabel('y(t)');


subplot(2,2,3);
stem(n,x2);
title('c');
xlabel('n');
ylabel('x[n]');


subplot(2,2,4);
stem(n,y2);
title('d');
xlabel('n');
ylabel('y[n]');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Q1b

%Uma das abordagens é definir a função parte a parte utilizando a função
%degrau para cada segmento

tb = -4:0.001:6;
%O pulso que vai de um ponto a até b pode ser descrito por u(t-a) - u (t-b)
%Dividimos o gráfico em cada segmento de reta e multiplicamos as retas pelo
%pulso do intervalo
%A reta que vai de -3 a -2 é 't+3'; a reta que vai de -1 a 1 é '-t'; a que
%vai de 2 a 4 é '2t-5'; de 1 a 2 multiplicamos a função degrau por -1

xb = (tb+3) .* (step(tb+3) - step(tb+2)) + (step(tb+2) - step(tb+1)) + -tb.*(step(tb+1) - step(tb-1)) +...
     -1 .* (step(tb-1) - step(tb-2)) + (2*tb-5).*(step(tb-2) - step(tb-4)) + 3.* step(tb-4);


nb = -4:1:5;

%O mesmo procedimento foi utilizado para o caso discreto; A reta que vai de
% -2 a 3 é descrita por '2n'. A partir de n=3, temos o próprio degrau
% multiplicado por 6
yb =  (2*nb).*(step(nb+2) - step(nb-3)) + 6*step(nb-3);

 
fig2 = figure;
fig2.Name = 'Questão 1.b';
fig2.OuterPosition = [0 0 1000 700];

subplot(1,2,1);
plot(tb,xb);
xlabel('t');
ylabel('x(t)');
title('a');
axis([-4 6 -2 3.5]);
grid on;

subplot(1,2,2);
stem(nb,yb);
xlabel('n');
ylabel('y[n]');
title('b');
axis([-4 5 -6.5 6.5]);
grid on;

%%%%%%%%%%%%%%%%%%%%%