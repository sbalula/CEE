clear;

dat=importdata('C:\Users\Pedro\Documents\CEE\dados\dados_01.txt');

plot(dat(1:end,1),dat(1:end,8));
title('u');
xlabel('Tempo (s)');
ylabel('Amplitude');

print('-dpng',strcat('C:\Users\Pedro\Documents\CEE\img\u_dados_01.png'));