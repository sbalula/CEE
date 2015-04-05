function[sys]=ligacao(A,B,C,A_o,B_o,C_o)

sys_ca=ss(A,B,C,0);
sys_o=ss(A_o,B_o,C_o,0);

sys=feedback(sys_ca*sys_o,1);

end