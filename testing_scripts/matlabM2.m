
Fs = 1024;            % Sampling frequency                    
T = 1/Fs;             % Sampling period
Time = 1;
L = Time*Fs;             % Length of signal
t = (0:L-1)*T;        % Time vector

S = ceil(1000*sin(2*pi*50*t) + 2000*sin(2*pi*120*t) + 4000*sin(2*pi*800*t));

Y = fft(S);
P2 = abs(Y/L);
f = Fs*(0:(L-1))/L;

% single sided
%P1 = P2(1:L/2+1);
%P1(2:end-1) = 2*P1(2:end-1);

plotStuff(t, P2, S, f);
printStufftoFile(L, S, Y);

function printStufftoFile(L, S, Y)

    fileID = fopen('test.txt','wt');
    fprintf(fileID, '{');
    for i = 1:L
        if mod(i, 8) == 0
            fprintf(fileID, '%d,\n', S(i));
        else
            fprintf(fileID, '%d,', S(i));
        end
    end
    fprintf(fileID, '}\r\n\n');
    
    % fprintf(fileID, '{');
    % for i = 1:L
    %     if mod(i, 8) == 0
    %         fprintf(fileID, '%3.16f,\n', Y(i));
    %     else
    %         fprintf(fileID, '%3.16f,', Y(i));
    %     end
    % end
    % fprintf(fileID, '}\r\n\n');
    
    fclose(fileID);
    winopen('test.txt'); 
end

function plotStuff(t, P2, S, f)
    %plotting

    tiledlayout(2,1)
    nexttile
    plot(1000*t(1:50),S(1:50))

    nexttile
    plot(f,P2) 
    title("Single-Sided Amplitude Spectrum of X(t)")
    xlabel("f (Hz)")
    ylabel("|P1(f)|")
end

