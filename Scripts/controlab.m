%% Função controlab
% Esta macro calcula a matriz de controlabilidade a partir das
% matrizes A e b de um sistema e retorna true ou false caso o 
% sistema seja controlável ou não.
function [cont,bool] = controlab(A,b)
%%
% A função começa por determinar a dimensão do vector b do sistema e
% inicializar uma matriz onde ficará alocada a matriz de controlabilidade.
d=length(b);
cont=zeros(d);
%%
% Neste bloco _for_ é calculada a matriz de controlabilidade.
for i=0:1:d-1 
    cont(:,i+1)=(A^i)*b;
end
%%
% Por fim é feito o teste à controlabilidade do sistema (através da
% verificação da característica da matriz de controlabilidade).
if(rank(cont)==d)
    bool=true;
else
    bool=false;
end
    

end

