function [] = plot_tf( A,b,c,fmin,fmax )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[num,den]=ss2tf(A,b,c,0);

sys=tf(num,den);

h=bodeplot(sys,{2*pi*fmin,2*pi*fmax});
setoptions(h,'FreqUnits','Hz','grid','on');

end

