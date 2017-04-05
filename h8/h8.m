% h8

%% 5.5
close all;

fc = 0.3;

absLimit = 20;
n = -absLimit:absLimit;
impulseResponse = -2*fc*sinc(n*2*pi*fc);
impulseResponse(find(~n)) = 1-2*fc;

figure();
freqz(impulseResponse);

% a n. -8.35

% b

absLimit = 30;
n = -absLimit:absLimit;
impulseResponse = -2*fc*sinc(n*2*pi*fc);
impulseResponse(find(~n)) = 1-2*fc;

figure();
freqz(impulseResponse);

% Ensimmaisen varahtelyhuipun vaimennus ei muutu, mutta huiput "tihentyvat"

% c

absLimit = 100;
n = -absLimit:absLimit;
impulseResponse = -2*fc*sinc(n*2*pi*fc);
impulseResponse(find(~n)) = 1-2*fc;

figure();
freqz(impulseResponse);

% Huiput tihentyvat entisestaan, mutta eivat vaimene lisaa. Estokaistan
% vaimennusta ei siis taman perusteella voi parantaa kertoimia lisaamalla.
% Estokaistan vaimennuksen varahtely tosin pienenee.


%% 5.14
close all;

Fs = 8192;
fe = 820;
fp = 1240;
fn = (fp-fe)/Fs;

% Kaytetaan blackman ikkunaa

N = ceil(5.5/fn);
N = N + (1-mod(N, 2));

fc = (fe+(fp-fe)/2)/Fs;

type = 'high';
window = blackman(N);
d = fir1(N-1, 2*fc, type, window);

figure();
freqz(d);
