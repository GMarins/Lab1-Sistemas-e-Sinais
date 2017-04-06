

 
 
 t = -2:0.001:5;
 
 %Implementamos os sinais utilizando os operadores logicos para descrever o sinal
 %a cada periodo. Isso equivale a utilizar a funcao degrau para cada pulso num intervalo
 x = exp(-t) .* (t >= 0 & t <=1);
 y = t .* (t>=-1 & t <= 1);
 z = 1 .* (t>=1 & t<=3) + 2.*(t>3 & t<=4);
 
 figure
 subplot(2,3,4)
 plot(t,reflexao_deslocamento(x,'y',-2);
 subplot(2,3,5)
 plot(t,reflexao_deslocamento(x,'y',0);
 subplot(2,3,6)
 plot(t,reflexao_deslocamento(x,'y',3);
 
 
 
 