clear;

str='dados_00';

dat=importdata(strcat(str,'.txt'));

plot(dat(1:end,1),dat(1:end,2)+dat(1:end,4));
title('y');
xlabel('Tempo (s)');
ylabel('Amplitude');
print('-dpng',strcat('C:\Users\Pedro\Documents\CEE\imgs\',str,'\',str,'_y'));