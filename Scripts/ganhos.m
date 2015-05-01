%% Fun��o ganhos
% Esta fun��o recebe as matrizes de controlabilidade e observabilidade do
% sistema a controlar e os valores pr�prios desejados para o controlador e
% para o erro do observador e retorna vectores de ganho do controlador e do
% observador. O m�todo utilizado para calcular estes vectores � o de
% Bass-Gura.
function [K,L] = ganhos( C, vpp_C, O, vpp_O, A )
%%
% A fun��o come�a por determinar os polin�mios caracter�sticos da matriz A
% e os polin�mios associados aos valores pr�prios desejados para o controlador e
% para o erro do observador.
vpp_A=eig(A);

pol_A=(poly(vpp_A))';
pol_C=(poly(vpp_C));
pol_O=(poly(vpp_O));

pol_C=pol_C(2:end);
pol_O=pol_O(2:end);

M=zeros(length(vpp_A));
%%
% De seguida calcula-se uma matriz M que � a matriz de Bass-Gura subtra�da 
% da matriz identidade atrav�s do bloco
% seguinte:
for j=1:1:length(vpp_A)
    for i=1:1:length(vpp_A)-j
        M(i+j,j)=pol_A(i+1);
    end
end
%%
% Transp�e-se o vector referente ao polin�mio caracter�stico da matriz A e
% adiciona-se a matriz identidade � matriz M de modo a obter a matriz de
% Bass-Gura.
pol_A=(pol_A(2:end))';

M=M+eye(length(vpp_A));

%%
% Por fim, aplicando o m�todo de Bass-Gura, obt�m-se os valores para os
% vectores de ganho do controlador e do erro do observador:
K=(pol_C-pol_A)*(inv(M))'*inv(C);
L=inv(O)*inv(M)*(pol_O-pol_A)';


end
