% Christian Gallai (260218797)
% ECSE 304 - Matlab Assignment 1
% 
%--------------------------------------------------------------------------
% This program first create an array of the signals corresponding to the
% numbers in the phone signals and then analyses their fft to determine the
% two peak frequencies in the signal. It then compares these frequencies to
% the known frequencies for the numbers 0-9 and outputs the number
% corresponding to the phone signal in the vector num

% Define which signal is being decoded
signalx = x2;

% Create segments for the numbers
NS1 = 1:1000;
segment1 = signalx(NS1);

NS2 = 1100:2100;
segment2 = signalx(NS2);

NS3 = 2200:3200;
segment3 = signalx(NS3);

NS4 = 3300:4300;
segment4 = signalx(NS4);

NS5 = 4400:5400;
segment5 = signalx(NS5);

NS6 = 5500:6500;
segment6 = signalx(NS6);

NS7 = 6600:7600;
segment7 = signalx(NS7);

% Create vector of segmented signals
segment = [segment1 segment2 segment3 segment4 segment5 segment6 segment7];

% Define sample length
Nf=2048;

% Determine numbers one by one
for ffts=1:7
    
    % Perform fftshift
    Nindex = (ffts*1000-999):(ffts*1000);
    N_fftshift = fftshift(fft(segment(Nindex),Nf));
    
    % Determine frequency 1
    [C1, I1] = max( N_fftshift(1024:1274));
    freq1(ffts) = pi/1024*I1;
    
    % Determine frequency 2
    [C2, I2] = max( N_fftshift(1275:2048));
    freq2(ffts) = pi/1024*(I2+251);
    
    %Determine number based on frequency 1 & 2 and save in num vector
    if freq1(ffts) < 0.5626 
        if (freq2(ffts) <0.976)
            num(ffts)=1;
        elseif (freq2(ffts) < 1.079)
            num (ffts)=2;
        else
            num (ffts)=3;
        end
    elseif (freq1(ffts) < 0.6221)
        if (freq2(ffts) <0.976)
            num(ffts)=4;
        elseif (freq2(ffts) < 1.079)
            num (ffts)=5;
        else
            num (ffts)=6;
        end
    elseif (freq1(ffts) < 0.6876)
        if (freq2(ffts) <0.976)
            num(ffts)=7;
        elseif (freq2(ffts) < 1.079)
            num (ffts)=8;
        else
            num (ffts)=9;
        end
    else
         num (ffts)=0;
    end
end

%Display num vector
num
















