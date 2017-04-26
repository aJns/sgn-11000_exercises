% H11

%% 8.5
close all;

load laughter;
Fs = 8192;
L = 2;
z = zeros(1, L*length(y));
z(1:L:end) = y;

n = 100;
Fp = (Fs/2)/(L*Fs);
b = fir1(n, Fp);
a = 1;
x = filter(b, a, z);

figure();
subplot(1, 3, 1); specgram(y);
subplot(1, 3, 2); specgram(z);
subplot(1, 3, 3); specgram(x);

%% 8.6
close all;

M = 3;
n = 100;
Fp = 1/(2*M);
a = 1;
b = fir1(n, Fp);
k = filter(b, a, x);
h = k(1:M:end);

figure();
subplot(1, 3, 1); specgram(z);
subplot(1, 3, 2); specgram(k);
subplot(1, 3, 3); specgram(h);

%% 8.7
close all;

load handel;
x = y;
r = 4;
w = interp(x, r);
e = zeros(1, length(w));
y = zeros(1, length(w));

for n=2:length(w)
    tmp = w(n)-e(n-1);
    y(n) = sign(tmp);
    e(n) = y(n)-tmp;
end

y_fft = fft(y);

patka = 1:100;

figure();
subplot(3, 1, 1); plot(y(patka));
subplot(3, 1, 2); specgram(abs(y_fft(1:floor(length(y_fft)/2))));
subplot(3, 1, 3); plot(e(patka));



n = 100;
M = 4;
fp = 1/(2*M);
a = 1;
b = fir1(n, fp);

k = filter(b, a, y);
h = k(1:M:end);
