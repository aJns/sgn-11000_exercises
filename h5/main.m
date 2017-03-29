%h5


%% 4.4
close all;

n = 1:70;

x = sin(0.05*2*pi*n);

pred_y = 0.3050*sin(0.05*2*pi*n-0.6283);

b = [0.0349 0.4302 -0.5698 0.4302 0.0349];

a = 1;

y = filter(b, a, x);

figure;
plot(n, x, '--', n, pred_y, ':', n, y);



%% 4.15
close all;

Fs = 20000;
f = 5000;

w = 2*pi*f/Fs;

z = exp(1i*w);



% Y = [1 -1.143 0.4128];
% X = [0.0675 0.1349 0.0675];
% 
% zeros = roots(Y);
% poles = roots(X);
% 
% zplane(zeros, poles);




Y = 0.0675*z^2 + 0.1349*z + 0.0675;
X = 1*z^2 - 1.143*z + 0.4128;

H = Y/X;

amplitude = H;

attenuation = 20*log10(abs(amplitude)/1);

disp(['Vaimennus: ' num2str(attenuation) ' dB']);
