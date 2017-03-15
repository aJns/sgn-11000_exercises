%% 1.1
%a
close all;
delta = [zeros(1,7),1,zeros(1,7)];
n = -7:7;
figure;
stem(n, delta);

%b
u = [zeros(1,7),ones(1,8)];
figure;
stem(n, u);

%c
nu = [zeros(1,7),0:7];
figure;
stem(n, nu);

%% 1.3
close all;
vectorForm = 1:100;
A = reshape(vectorForm, [10 10]).'
A.^3
A^3

B = rand(10)
C = inv(B)
B*C

%% 1.11
[seiska, Fs] = audioread('./seiska.wav');

%%
close all;
figure;
specgram(seiska);
soundsc(seiska, Fs);
pause(1);

h = fir1(30, 0.3, 'high');
y = filter(h, 1, seiska);

figure;
specgram(y);
soundsc(y, Fs);

% matalat taajuudet näyttivät poistuvan, tai ainakin heikkenevän vahvasti













