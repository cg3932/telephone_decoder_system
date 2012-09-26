% Christian Gallai (260218797)
% ECSE 304 - Matlab Assignment 1
% 
%--------------------------------------------------------------------------
% This program graphs the DTFT for d0 to d9, dislaying all 10 graphs once
% the program is run.

% Create N vectors [0:999]
N = 0:999;

% create for all 9 digits
d0 = sin(0.7217.*N)+ sin(1.0247.*N);
d1 = sin(0.5346.*N)+ sin(0.9273.*N);
d2 = sin(0.5346.*N)+ sin(1.0247.*N);
d3 = sin(0.5346.*N)+ sin(1.1328.*N);
d4 = sin(0.5906.*N)+ sin(0.9273.*N);
d5 = sin(0.5906.*N)+ sin(1.0247.*N);
d6 = sin(0.5906.*N)+ sin(1.1328.*N);
d7 = sin(0.6535.*N)+ sin(0.9273.*N);
d8 = sin(0.6535.*N)+ sin(1.0247.*N);
d9 = sin(0.6535.*N)+ sin(1.1328.*N);

% Create vector of segmented signals
d = [d0 d1 d2 d3 d4 d5 d6 d7 d8 d9];
     
% Plot all graphs for segments in for loop
for i=0:9
    % Plot  
    Nindex = ((i+1)*1000-999):((i+1)*1000);
    figure, plot(N,abs(d(Nindex)));
    
    % Labels
    str1 = num2str(i);
    label1 = ['|d' str1 '| vs. Time'];
    label2 = ['|d' str1 '|'];
    title(label1);
    xlabel('Time, n');
    ylabel(label2);
end