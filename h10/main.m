% H10

%% 7.5
close all;

load gong.mat;

bits = [3, 7, 11, 15];

figure();
for i = 1:length(bits)
    bit = bits(i);
    z = quant(y, 1/2^bit);
    err = y-z;
    subplot(2, 2, i); plot(err);
    title(['Error signal for ' num2str(bit) ' bit quantization']);
    err_var = var(err);
    disp(['Error signal variance: ' num2str(err_var)]);
end


[y, Fs] = audioread('seiska.wav');

bits = [3, 7, 11, 15];

figure();
for i = 1:length(bits)
    bit = bits(i);
    z = quant(y, 1/2^bit);
    err = y-z;
    subplot(2, 2, i); plot(err);
    title(['Error signal for ' num2str(bit) ' bit quantization']);
    err_var = var(err);
    disp(['Error signal variance: ' num2str(err_var)]);
end

%% 7.6
close all;

Ws = 0.1;
Wp = 0.15;
Rs = 50;
Rp = 0.1;

[n, Wp] = ellipord(Wp, Ws, Rp, Rs);
[b, a] = ellip(n, Rp, Rs, Wp, 'high');

bits = 11;
b_quant = quant(b, 1/2^bits);
a_quant = quant(a, 1/2^bits);


figure();
freqz(b, a);
title('Original');

figure();
freqz(b_quant, a_quant);
title('Quantized');


% vaimennus huononi pahimmillaan n. 8dB

%% 7.10
close all;


N = 10000; % Test signal length
x = [1; 1; zeros(N,1)]; % Input
y = zeros(size(x)); % Output

% Kirjoita alle y(n):aan suodatuksen tulos kvantisoinnin
% jalkeen, kun suodin on H(z) = 1 / (1 + 0.5z^(-1)).
bits = 5;

for n = 2:N
    y(n) = quant(x(n)-0.5*y(n-1), 1/2^bits);
end

stem(y(1:100), 'filled')

% soundsc(y,8000)
