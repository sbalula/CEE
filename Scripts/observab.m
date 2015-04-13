%% Fun��o observab
%   Esta macro calcula a matriz de observabilidade a partir das
%   matrizes A e c de um sistema e retorna true ou false caso o 
%   sistema seja observ�vel ou n�o.
function [ obsr,bool ] = observab( A,c )
%%
% A fun��o come�a por determinar a dimens�o do vector b do sistema e
% inicializar uma matriz onde ficar� alocada a matriz de observabilidade.
d=length(c);
obsr=zeros(d);
%%
% De seguida � calculada a matriz de observabilidade:
for i=0:1:d-1 
    obsr(i+1,:)=c*(A^i);
end
%%
% Por fim � feito o teste � observabilidade do sistema (atrav�s da
% verifica��o da caracter�stica da matriz de observabilidade).

if(rank(obsr)==d)
    bool=true;
else
    bool=false;
end
    

end

