function [N, D] = design_lowpass(fp, fs, Rp, Rs, Fs)

wp = 2*pi*fp/Fs;
ws = 2*pi*fs/Fs;

c = 1/tan(wp/2);
Op = 1;
Os = c*tan(ws/2);

e = sqrt(10^(Rp/10) -1);
A = sqrt(10^(Rs/10));

M = log10((A^2-1)/e^2)/(2*log10(Os));
M = ceil(M);

p = zeros(1, M);
for k = 1:M
    p(k) = (1/(e^(1/M)))*exp(pi*1i*(1/2 +(2*k-1)/(2*M)));
end

p1 = 1 + p/c;
p2 = 1 - p/c;
p = p1./p2;

K = 1;
z = repmat(-1, 1, M)';

[N, D] = zp2tf(z, p, K);
K = sum(N)/sum(D);
N = N/K;
