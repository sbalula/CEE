%% Função plot_tf
% Esta função recebe as matrizes do modelo de estado e os limites da frequência
% para o eixo do x e retorna um gráfico
% com o respectivo diagrama de Bode.
function [] = plot_tf( A,b,c,fmin,fmax )
%%
% A função começa por converter o sistema da representação de estado para
% uma função de tranferência e de seguida cria uma variável _sys_ que
% descreve o sistema:
[num,den]=ss2tf(A,b,c,0);

sys=tf(num,den);
%%
% De seguida é feito o diagrama de Bode com os parâmetros indicados.
h=bodeplot(sys,{2*pi*fmin,2*pi*fmax});
setoptions(h,'FreqUnits','Hz','grid','on');

end

