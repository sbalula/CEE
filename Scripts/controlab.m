function [cont,bool] = controlab(A,b)
%controlab -> Calcula o criterio de controlabilidade
%   Esta macro calcula a matriz de controlabilidade a partir das
%   matrizes A e b de um sistema e retorna true ou false caso o 
%   sistema seja controlável ou não.

d=length(b);
cont=zeros(d);

for i=0:1:d-1 
    cont(:,i+1)=(A^i)*b;
end

if(rank(cont)==d)
    bool=true;
else
    bool=false;
end
    

end

