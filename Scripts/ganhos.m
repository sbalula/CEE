%% Função ganhos
% Esta função recebe as matrizes de controlabilidade e observabilidade do
% sistema a controlar e os valores próprios desejados para o controlador e
% para o erro do observador e retorna vectores de ganho do controlador e do
% observador. O método utilizado para calcular estes vectores é o de
% Bass-Gura.
function [K,L] = ganhos( C, vpp_C, O, vpp_O, A )
%%
% A função começa por determinar os polinómios característicos da matriz A
% e os polinómios associados aos valores próprios desejados para o controlador e
% para o erro do observador.
vpp_A=eig(A);

pol_A=(poly(vpp_A))';
pol_C=(poly(vpp_C));
pol_O=(poly(vpp_O));

pol_C=pol_C(2:end);
pol_O=pol_O(2:end);

M=zeros(length(vpp_A));
%%
% De seguida calcula-se uma matriz M que é a matriz de Bass-Gura subtraída 
% da matriz identidade através do bloco
% seguinte:
for j=1:1:length(vpp_A)
    for i=1:1:length(vpp_A)-j
        M(i+j,j)=pol_A(i+1);
    end
end
%%
% Transpõe-se o vector referente ao polinómio característico da matriz A e
% adiciona-se a matriz identidade à matriz M de modo a obter a matriz de
% Bass-Gura.
pol_A=(pol_A(2:end))';

M=M+eye(length(vpp_A));

%%
% Por fim, aplicando o método de Bass-Gura, obtém-se os valores para os
% vectores de ganho do controlador e do erro do observador:
K=(pol_C-pol_A)*(inv(M))'*inv(C);
L=inv(O)*inv(M)*(pol_O-pol_A)';


end
