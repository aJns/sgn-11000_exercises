% H9

%% 6.4
close all;

Fs = 40000;
Fp = 4000/Fs;
Fs = 7000/Fs;
Rp = 0.3;
Rs = 45;

[N, Wn] = buttord(2*Fp, 2*Fs, Rp, Rs);
[b, a] = butter(N, Wn);

figure();
impz(b, a);

figure();
freqz(b, a);

figure();
zplane(b, a);

%% 6.6 & 6.7

% toteutetaan funktio

%% 6.8
close all;

fp = 9000;
fs = 12500;
Rp = 0.4;
Rs = 25;
Fs = 32000;

[b, a] = design_lowpass(fp, fs, Rp, Rs, Fs);

figure();
freqz(b, a);

figure();
zplane(b, a);
