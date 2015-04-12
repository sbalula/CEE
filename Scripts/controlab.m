%% Fun��o controlab
% Esta macro calcula a matriz de controlabilidade a partir das
% matrizes A e b de um sistema e retorna true ou false caso o 
% sistema seja control�vel ou n�o.
function [cont,bool] = controlab(A,b)
%%
% A fun��o come�a por determinar a dimens�o do vector b do sistema e
% inicializar uma matriz onde ficar� alocada a matriz de controlabilidade.
d=length(b);
cont=zeros(d);
%%
% Neste bloco _for_ � calculada a matriz de controlabilidade.
for i=0:1:d-1 
    cont(:,i+1)=(A^i)*b;
end
%%
% Por fim � feito o teste � controlabilidade do sistema (atrav�s da
% verifica��o da caracter�stica da matriz de controlabilidade).
if(rank(cont)==d)
    bool=true;
else
    bool=false;
end
    

end

