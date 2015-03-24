function [ obsr,bool ] = observab( A,c )
%observab -> Calcula o criterio de observabilidade
%   Esta macro calcula a matriz de observabilidade a partir das
%   matrizes A e c de um sistema e retorna true ou false caso o 
%   sistema seja observável ou não.


d=length(c);
obsr=zeros(d);

for i=0:1:d-1 
    obsr(i+1,:)=c*(A^i);
end

if(rank(obsr)==d)
    bool=true;
else
    bool=false;
end
    

end

