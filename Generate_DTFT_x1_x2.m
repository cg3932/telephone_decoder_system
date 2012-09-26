% Christian Gallai (260218797)
% ECSE 304 - Matlab Assignment 1
% 
%--------------------------------------------------------------------------
% This program graphs the DTFT for x1 or x2, dislaying all 7 graphs once
% the program is run.

% Define which signal is to be analyzed
signalx = x1;

% Segment individual numbers
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

% FFT parameters
Nf=2048;
k = 1:Nf;
omega = (2*pi/Nf).*k;
omega_f = linspace(-pi, pi, Nf);
     
% Plot all graphs for segments in for loop
for i=1:7
    % Perform fftshift
    Nindex = (i*1000-999):(i*1000);
    N_fftshift = fftshift(fft(segment(Nindex),Nf));

    % Plot    
    figure, plot(omega_f,abs(N_fftshift));
    
    % Labels
    str1 = num2str(i);
    label1 = ['|N' str1 '| vs. Omega'];
    label2 = ['|N' str1 '|'];
    title(label1);
    xlabel('Frequency, w');
    ylabel(label2);
end