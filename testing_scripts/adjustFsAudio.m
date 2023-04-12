
NewFs = 8192;            % Sampling frequency    
NewFileName = "g-WORKFLOW.wav";

[S, Fs] = audioread("sampleNotes/g-string.wav");
%change the sampling rate
y = stretchAudio(S,5.875);
audiowrite(NewFileName,y,NewFs);
%Read the data back into MATLAB using audioread.
[y,fs2] = audioread(NewFileName);
sound(y,fs2);