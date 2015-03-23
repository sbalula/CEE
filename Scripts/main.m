clear;

A=[0,0,1,0;0,0,0,1;0,566,-37,0;0,-922,37,0];
b=[0;0;65;-65];
c=[1,1,0,0];

[C,cntr]=controlab(A,b);
[O,obsr]=observab(A,c);

% sys=ss(A,b,c,0);
% bode(sys,{100,1000}),grid

plot_tf(A,b,c,0.1,100);