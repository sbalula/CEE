clear;

str='dados_0n';

dat=importdata(strcat(str,'.txt'));

plot(dat(1:end,1),dat(1:end,2)+dat(1:end,4));
title('y');
xlabel('Tempo (s)');
ylabel('Amplitude');
print('-dpng',strcat('C:\Users\Pedro\Documents\CEE\imgs\',str,'\',str,'_y'));