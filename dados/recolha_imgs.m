clear;

str='dados_11_100';

dat=importdata(strcat(str,'.txt'));

plot(dat(1:end,1),dat(1:end,2));
title('Potenciómetro');
xlabel('Tempo (s)');
ylabel('Amplitude');
print('-dpng',strcat('C:\Users\Pedro\Documents\CEE\imgs\',str,'\',str,'_pot'));

plot(dat(1:end,3),dat(1:end,4));
title('Extensómetro');
xlabel('Tempo (s)');
ylabel('Amplitude');
print('-dpng',strcat('C:\Users\Pedro\Documents\CEE\imgs\',str,'\',str,'_ext'));

plot(dat(1:end,5),dat(1:end,6));
title('Referência');
xlabel('Tempo (s)');
ylabel('Amplitude');
print('-dpng',strcat('C:\Users\Pedro\Documents\CEE\imgs\',str,'\',str,'_ref'));

plot(dat(1:end,7),dat(1:end,8));
title('u');
xlabel('Tempo (s)');
ylabel('Amplitude');
print('-dpng',strcat('C:\Users\Pedro\Documents\CEE\imgs\',str,'\',str,'_u'));

if(dat(1,9)==0)
    gra=plot(dat(1:end,9),dat(1:end,10));
    title('Erro');
    xlabel('Tempo (s)');
    ylabel('Amplitude');
print('-dpng',strcat('C:\Users\Pedro\Documents\CEE\imgs\',str,'\',str,'_err'));
end