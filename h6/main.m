% h5

%% 4.11
close all;

b = [0.0122 0.0226 0.0298 0.0204 0.0099];
a = [1 -0.9170 0.0540 -0.2410 0.1990];

figure;
subplot(2, 1, 1); zplane(b, a); title('zplane original');
subplot(2, 1, 2); zplane(a, b); title('zplane inverse');

%%
figure;
freqz(b, a); title('freqz original');
figure;
freqz(a, b); title('freqz inverse');

%%
figure;
subplot(2, 1, 1); impz(b, a); title('impz original');
subplot(2, 1, 2); impz(a, b); title('impz inverse');


%% 4.16
close all;

t = 0:1/8192:4;
y = chirp(t, 0, 1, 1000);

b = [0.0675 0.1349 0.0675];
a = [1 -1.143 0.4128];

y_filt = filter(b, a, y);

figure;
subplot(2, 1, 1); spectrogram(y);
subplot(2, 1, 2); spectrogram(y_filt);

%% 5.3
close all;

load numero.mat;
Fs = 8192;
figure;
specgram(salainen);

% alhaalta ylös

% 0.1709, 0.3623 = 3
% 0.1885, 0.3623 = 6
% 0.1885, 0.3271 = 5
% 0.1709, 0.3623 = 3
% 0.2109, 0.3281 = 8
% 0.1885, 0.2959 = 4
% 0.2266, 0.3281 = 0
