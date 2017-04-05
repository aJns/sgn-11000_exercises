% h7

%% 5.4
close all;

N = 98;

a = 0;
b = 0.33;

c = 0.36;
d = 1;

f = remez(N, [a, b, c, d], [0, 0, 1, 1]);

figure();
freqz(f);

load numero.mat

figure();
specgram(salainen);

filteredSalainen = filter(f, 1, salainen);

figure();
specgram(filteredSalainen);


%% 5.9
close all;

Fs = 44100;
N = 47;
fc = (15000+(18000-15000)/2)/Fs;
tyyppi = 'high';
ikkuna = hanning(N);

d = fir1(N-1, 2*fc, tyyppi, ikkuna);

figure();
impz(d);

figure();
freqz(d);

figure();
zplane(d);
