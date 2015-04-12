%% Função ligacao
% Esta função recebe as matrizes de estado relativas aos sistemas a serem
% colocados em série e realimentados na entrada com a saída e retorna o
% sistema acoplado.
function[sys]=ligacao(A,B,C,A_o,B_o,C_o)
%%
% Começa-se por definir no matlab as variáveis _sys_ relativas aos sistemas
% a serem acoplados, através das suas matrizes A, b e c (assume-se que
% d=0).
sys_ca=ss(A,B,C,0);
sys_o=ss(A_o,B_o,C_o,0);
%% 
% Esta função acopla os dois sistemas (obtendo-se assim o sistema em malha
% fechada).
sys=feedback(sys_ca*sys_o,1);

end