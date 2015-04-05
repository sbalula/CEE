clear;

A=[0,0,1,0;0,0,0,1;0,566,-37,0;0,-922,37,0];
b=[0;0;65;-65];
c=[1,1,0,0];
vpp_C=[-70,-20,-10,-10];
vpp_O=[-50,-50,-30,-30];

[C,cntr]=controlab(A,b);
[O,obsr]=observab(A,c);

%plot_tf(A,b,c,0.1,100);

[K,L]=ganhos(C,vpp_C,O,vpp_O,A);

sys_ss=ligacao(A,b,c,A-b*K-L*c,-L,-K);

sys_tf=tf(sys_ss);

bode(sys_ss);