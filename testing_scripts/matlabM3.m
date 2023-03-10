
%Fs = 1024;            % Sampling frequency    
[S, Fs] = audioread("e-string.wav");
S = sum(S,2);
Time = 1;
S = S(1:Time*Fs);
T = 1/Fs;             % Sampling period
L = Time*Fs;             % Length of signal
t = (0:L-1)*T;        % Time vector


Y = fft(S);
Y = Y(1:L);
P2 = abs(Y/L);
f2 = Fs*(0:(L-1))/L;
f1 = Fs*(0:(L/2))/L;

tiledlayout(2,1)

P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

nexttile
stem(f1(1:1000),P1(1:1000)) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")


hps_sum = zeros(Fs,1);
max_val = 0;

for k = 1:L/5
    hps_sum(k) = P2(k) * P2(2*k) * P2(3*k) * P2(5*k);

    if hps_sum(k) > max_val
        max_val = hps_sum(k);
        fund_freq = k;
    end
end

nexttile
stem(f2(1:1000), hps_sum(1:1000));