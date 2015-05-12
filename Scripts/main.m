%% Relat�rio preliminar do laborat�rio de CEE
% Este trabalho foi realizado pelo grupo 4 de 4� feira composto por:
% 
% * Alexandre Apar�cio N�73252
% * Pedro Ribeiro N�73221
% * Samuel Balula N�72735
%%
% Come�a-se por limpar todas as vari�veis que possam estar definidas
% antes de executar o c�digo
clear;
%% Defini��o das matrizes do modelo de estado
% Come�a-se por se definir as matrizes que se definem o modelo de estado,
% que s�o fornecidas no enunciado:
A=[0,1;-25,0];
b=[0;1];
c=[0,1];
%% Caracteriza��o da controlabilidade e observabilidade do sistema
% Antes de se calcular os vectores de ganho do controlador e do observador,
% � necess�rio determinar se o sistema � ou n�o control�vel e observ�vel.
% Criaram-se ent�o duas macros:
% 
% * controlab: Recebe a matriz A e o vector b e retorna a respectiva matriz
% de controlabilidade e uma vari�vel que � igual a 1 se o sistema for
% control�vel e 0 se n�o for.
% * observab: Recebe a matriz A e o vector c e retorna a respectiva matriz
% de observabilidade e uma vari�vel que � igual a 1 se o sistema for
% observ�vel e 0 se n�o for.
%%
% Verifica-se que este sistema � control�vel e observ�vel.
[C,cntr]=controlab(A,b);
C
cntr
[O,obsr]=observab(A,c);
O
obsr
%% Diagrama de Bode do sistema 
% Criou-se uma macro para realizar o diagrama de bode do sistema a partir
% das sua matrizes A, b e c (e assumindo que d=0). Observa-se que o sistema
% em malha aberta possui pelo um p�lo na origem e os restantes 3 p�los
% perto da frequ�ncia de 4Hz, visto que a magnitude decai a -20db por
% d�cada at� essa frequ�ncia, passando a decair de seguida com -80db por
% d�cada.
plot_tf(A,b,c,0.1,100);
%%
% Atrav�s do diagrama de Bode � ent�o poss�vel concluir que o sistema
% possui 4 p�los como esperado, visto que o motor DC ir� introduzir dois
% p�los (reais) e os dois graus de liberdade da barra ir�o introduzir
% outros dois p�los (complexos, um para cada grau de liberdade) .
%% Manipula��o de p�los do sistema por realimenta��o e estima��o das vari�veis de estado
% Come�a-se por se definir os valores pr�prios pretendidos para o
% controlador (vpp_C) e para o erro do observador (vpp_O):
vpp_C=[-4+4i,-4-4i];
vpp_O=[-10+10i,-10-10i];
%%
% De seguida, executa-se a fun��o ganhos, que recebe a matriz de
% controlabilidade e observabilidade do sistema, juntamente com os valores
% pr�prios pretendidos para o controlador e para os erros do observador e
% que retorna os vectores de ganho do controlador (L) e do erro do
% observador (K)
[K,L]=ganhos(C,vpp_C,O,vpp_O,A);
K
L
%% Verifica��o do c�lculo dos vectores de ganho
% � poss�vel confirmar se os vectores de ganho do controlador e do
% observador est�o correctos, calculando os p�los da nova matriz A para o
% sistema realimentado $A_C=A-bK$ e para o observador assimpt�tico aplicado $A_O=A-Lc$.
% Relembrando que os p�los desejados para o controlador eram:
%
% $$ (-70,-20,-10,-10) $$
% 
% E para os erros do observador
%
% $$ (-50,-50,-30,-30) $$
%
% � poss�vel confirmar se os p�los est�o bem c�lculados calculando os p�los
% das novas matrizes A para o sistma realimentado e para o observador assimpt�tico:
polos_C=eig(A-b*K)
polos_O=eig(A-L*c)
%%
% Visto que os p�los obtidos computacionalmente s�o iguais aos desejados e
% como pelo teorema da separa��o, os p�los de um sistema de controlo linear por realimenta��o
% podem ser projectados independentemente para o sistema realimentado e para o
% observador assimpt�tico sendo este v�lido para um sistema realimentado pelas
% vari�veis de estado estimadas, confirma-se que os vectores de ganho obtidos
% tanto para o controlador como para erro do observador est�o correctos. 
%% Fun��o de transfer�ncia em cadeia fechada
% Por fim determinou-se o diagrama de Bode do sistema em cadeia fechada. A
% uni�o entre o modelo em cadeia aberta e o estimador que ir�o formar o
% sistema em cadeia fechada � realizada pela fun��o ligacao, que recebe
% as matrizes do sistema em malha aberta e do estimador em malha aberta e
% retorna uma vari�vel em formato sys que descreve o sistema (representado
% em espa�o de de estados) como
% representado no esquema de simulink.
sys_ss=ligacao(A,b,c,A-b*K-L*c,-L,-K);
%% 
% Assim � poss�vel determinar a fun��o de transfer�ncia atrav�s da fun��o
% tf:
sys_tf=tf(sys_ss)
%%
% E obter o respectivo diagrama de bode
h=bodeplot(sys_ss,{2*pi*0.1,2*pi*100});
setoptions(h,'FreqUnits','Hz','grid','on');
%%
% Os p�los obtidos agora foram deslocados, de modo que j� n�o existe p�lo
% na origem, estando os quatro p�los do sistema realimentado distribu�dos
% entre a gama de frequ�ncias de 1 a 10 Hz.