N = 10000; % Test signal length
x = [1; 1; zeros(N,1)]; % Input
y = zeros(size(x)); % Output

% Kirjoita alle y(n):aan suodatuksen tulos kvantisoinnin
% jalkeen, kun suodin on H(z) = 1 / (1 + 0.5z^(-1)).
b = 1;
a = [1, -0.2];
bits = 5;

for n = 2:N
    result = filter(b, a, x(n));
    y(n) = quant(result, 1/2^bits)
end

stem(y(1:100), 'filled')

% soundsc(y,8000)
