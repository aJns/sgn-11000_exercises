%% 3.10
close all;

fftCalcTimes = zeros(1, 8);
dftCalcTimes = zeros(1,8);
nValues = zeros(1,8);

for i = 0:7
    N = 8*2^i;
    nValues(i+1) = N;
    F = exp(-2*pi*1i*(0:N-1)'*(0:N-1)/N);

    tic;
    for k=1:1000
        X = F*rand(N,1);
    end;
    dftCalcTimes(i+1) = toc;

    tic;
    for k=1:1000
        X = fft(rand(N,1));
    end;
    fftCalcTimes(i+1) = toc;
end

figure;
plot(nValues, dftCalcTimes, '--', nValues, fftCalcTimes, '-');

%% 3.11
close all;

samples = 8192;
offset = 20;
signal = rand(1, samples);

h=0.05*[ones(1,offset), zeros(1, samples-offset)];

y1 = ifft(fft(signal).*fft(h));
y2 = conv(signal, h);

n = 1:200;
figure;
plot( n, real( y1(n) ), '--', n, y2(n), ':' );

fftConvTimes = zeros(1, 8);
funcConvTimes = zeros(1,8);
nValues = zeros(1,8);

for i = 0:7
    samples = 8192*2^i;
    nValues(i+1) = samples;
    signal = rand(1, samples);
    h=0.05*[ones(1,offset), zeros(1, samples-offset)];

    tic;
    for k=1:1
        y1 = ifft(fft(signal).*fft(h));
    end;
    fftConvTimes(i+1) = toc;

    tic;
    for k=1:1
        y2 = conv(signal, h);
    end;
    funcConvTimes(i+1) = toc;
end

figure;
plot(nValues, fftConvTimes, '--', nValues, funcConvTimes, '-');


%% 3.12
close all;

corrupt = load('corrupt.mat');
handel = load('handel.mat');

Fs = handel.Fs;
y = handel.y(1:2^16);
z = corrupt.z(1:2^16);

h = ifft(fft(z).*fft(y));

for i = 1:10
    disp(['h(n) at n=' num2str(i) ':' num2str(h(i))]);
end
