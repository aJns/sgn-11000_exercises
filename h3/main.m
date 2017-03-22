%% 2.11
close all;
zerosStart = -7;
onesEnd = 12;
u = [zeros(1,abs(zerosStart)), ones(1,abs(onesEnd+1))];
n = zerosStart:onesEnd;

a = [1, -1.1];
b = 1;

filtered = filter(b, a, u);
stem(filtered);

%% 2.19
close all;
delta = [1, zeros(1, 127)];

b = 1;
a = [1 0.9];

filtered = filter(b, a, delta);
figure;
stem(filtered);

b = [0.2 -0.5 0.8];
a = [1 -0.6 0.3];

filtered = filter(b, a, delta);
figure;
stem(filtered);

b = [1 0.5 0.25];
a = [1 -0.5 -0.6];

filtered = filter(b, a, delta);
figure;
stem(filtered);

% c) kohdan systeemi ei ole stabiili, koska se kasvaa rajattomasti

%% 2.20
close all;
% a
b = 1;
a = [1 0.9];
figure;
impz(b, a)

% b
b = [0.2 -0.5 0.8];
a = [1 -0.6 0.3];
figure;
impz(b, a)

% c
b = [1 0.5 0.25];
a = [1 -0.5 -0.6];
figure;
impz(b, a)

% samalta näyttää


%% 3.8
close all;

Fs = 8192;
f = 1000;
n = 1:Fs;
rest = (2*pi*n)/Fs;
x = sin(rest*f);

xDFT = fft(x);

figure;
plot(n, abs(xDFT));







