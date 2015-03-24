function [K,L] = ganhos( C, vpp_C, O, vpp_O, A )
%UNTITLED4 Calcula vectores de ganho de controlador e observador
%   Explicação
vpp_A=eig(A);

pol_A=(poly(vpp_A))';
pol_C=(poly(vpp_C));
pol_O=(poly(vpp_O));

pol_C=pol_C(2:end);
pol_O=pol_O(2:end);

M=zeros(length(vpp_A));

for j=1:1:length(vpp_A)
    for i=1:1:length(vpp_A)-j
        M(i+j,j)=pol_A(i+1);
    end
end
pol_A=(pol_A(2:end))';

M=M+eye(length(vpp_A));

K=(pol_C-pol_A)*(inv(M))'*inv(C);
L=inv(O)*inv(M)*(pol_O-pol_A)';




end
