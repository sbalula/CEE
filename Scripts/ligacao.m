%% Fun��o ligacao
% Esta fun��o recebe as matrizes de estado relativas aos sistemas a serem
% colocados em s�rie e realimentados na entrada com a sa�da e retorna o
% sistema acoplado.
function[sys]=ligacao(A,B,C,A_o,B_o,C_o)
%%
% Come�a-se por definir no matlab as vari�veis _sys_ relativas aos sistemas
% a serem acoplados, atrav�s das suas matrizes A, b e c (assume-se que
% d=0).
sys_ca=ss(A,B,C,0);
sys_o=ss(A_o,B_o,C_o,0);
%% 
% Esta fun��o acopla os dois sistemas (obtendo-se assim o sistema em malha
% fechada).
sys=feedback(sys_ca*sys_o,1);

end