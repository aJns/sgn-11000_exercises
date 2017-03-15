%% 1.8
Fs = 8192;
f1 = 1000;
f2 = 2000;
f3 = 3000;
f6 = 6000;
f7 = 7000;
f8 = 8000;
n = 1:Fs;
rest = (2*pi*n)/Fs;

x1 = sin(rest*f1);
x2 = sin(rest*f2);
x3 = sin(rest*f3);
x6 = sin(rest*f6);
x7 = sin(rest*f7);
x8 = sin(rest*f8);

soundsc(x1, Fs);
pause(1);
soundsc(x2, Fs);
pause(1);
soundsc(x3, Fs);
pause(1);
soundsc(x6, Fs);
pause(1);
soundsc(x7, Fs);
pause(1);
soundsc(x8, Fs);

% Äänentaajuus laskee kun signaali laskostuu
%%
close all;

indices = 1:250;
figure;
subplot(3, 3, 1); plot(n(indices), x1(indices));
subplot(3, 3, 2); plot(n(indices), x2(indices));
subplot(3, 3, 3); plot(n(indices), x3(indices));
subplot(3, 3, 4); plot(n(indices), x6(indices));
subplot(3, 3, 5); plot(n(indices), x7(indices));
subplot(3, 3, 6); plot(n(indices), x8(indices));

%% 1.9
close all;
x = load('seiska.mat');
x = x.x;
%%
Fs = 16384;
soundsc(x, Fs);
pause(1);

y = x(1:2:length(x));
soundsc(y, Fs/2);
pause(1);

d = decimate(x, 2);
y = d(1:2:length(d));
soundsc(y, Fs/4);
pause(1);

%% 2.3
close all;

load gong;

%%

aVec = [-0.2427 -0.2001 0.7794 -0.2001 -0.2427];

z = conv(y, aVec);

soundsc(y, Fs);
pause(5);

soundsc(z, Fs);
pause(5);

% kuulostaa siltä että matalia taajuuksia oltaisiin suodatettu pois

%%
[hall, Fs] = audioread('hall.wav');
load seiska.mat;

%%
% ennen conv
soundsc(x, Fs);
pause(2);

% jälkeen conv
z = conv(x, hall);
soundsc(z, Fs);
pause(2);














