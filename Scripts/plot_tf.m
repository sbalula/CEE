%% Fun��o plot_tf
% Esta fun��o recebe as matrizes do modelo de estado e os limites da frequ�ncia
% para o eixo do x e retorna um gr�fico
% com o respectivo diagrama de Bode.
function [] = plot_tf( A,b,c,fmin,fmax )
%%
% A fun��o come�a por converter o sistema da representa��o de estado para
% uma fun��o de tranfer�ncia e de seguida cria uma vari�vel _sys_ que
% descreve o sistema:
[num,den]=ss2tf(A,b,c,0);

sys=tf(num,den);
%%
% De seguida � feito o diagrama de Bode com os par�metros indicados.
h=bodeplot(sys,{2*pi*fmin,2*pi*fmax});
setoptions(h,'FreqUnits','Hz','grid','on');

end

