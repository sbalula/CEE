%% Função observab
%   Esta macro calcula a matriz de observabilidade a partir das
%   matrizes A e c de um sistema e retorna true ou false caso o 
%   sistema seja observável ou não.
function [ obsr,bool ] = observab( A,c )
%%
% A função começa por determinar a dimensão do vector b do sistema e
% inicializar uma matriz onde ficará alocada a matriz de observabilidade.
d=length(c);
obsr=zeros(d);
%%
% De seguida é calculada a matriz de observabilidade:
for i=0:1:d-1 
    obsr(i+1,:)=c*(A^i);
end
%%
% Por fim é feito o teste à observabilidade do sistema (através da
% verificação da característica da matriz de observabilidade).

if(rank(obsr)==d)
    bool=true;
else
    bool=false;
end
    

end

