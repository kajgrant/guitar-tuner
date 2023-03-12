
filename = "g-WORKFLOW.wav";

[S, Fs] = audioread(filename);

S = sum(S,2);
Time = 1;
S = S(1:Time*Fs);
T = 1/Fs;             % Sampling period
L = Time*Fs;             % Length of signal
t = (0:L-1)*T;        % Time vector
S = 10000.*S;

Y = fft(S);
Y = Y(1:L);
P2 = abs(Y/L);
f2 = Fs*(0:(L-1))/L;
f1 = Fs*(0:(L/2))/L;

tiledlayout(2,1)

P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

nexttile
stem(f1(1:2000),P1(1:2000)) 
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

printStufftoFile(L, S);

function printStufftoFile(L, S)

    fileID = fopen('testM4.txt','wt');
    fprintf(fileID, '{');
    for i = 1:L
        if mod(i, 8) == 0
            fprintf(fileID, '%.0f,\n', S(i));
        else
            fprintf(fileID, '%.0f,', S(i));
        end
    end
    fprintf(fileID, '}\r\n\n');
    
    fclose(fileID);
    winopen('testM4.txt'); 
end
