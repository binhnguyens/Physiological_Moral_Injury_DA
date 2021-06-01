clear; close all; clc;


%% Add path file to CSV or TXT files
% Main file
path = ('/Users/binhnguyen/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Digital Mental Health/11. BIOPAC/3. Biopac Data');
filename = ('/Test 5 - OTU mar 25/binh multimodal mar 25.csv');
file = strcat ( path , filename );

%% Open files
df = readtable (file);

% Remove first row
df(1,:) = [];

% Assign value
RI = df.CH1;
PPG = df.CH2;
ECG = df.CH13;
GSR = df.CH14;

ECG_RR = df.CH40;
ECG_RWave = df.CH41;
PR = df.CH42;
HR = df.CH43;
% RR = df.CH44;

% X axis time 
t = s2t(RI);

% Sampling frequency
fs = 2000;

%% Visualize

choice = 1;

if choice == 0
    visualization_per_graph(RI,'RI',t);
    visualization_per_graph(PPG,'PPG',t);
    visualization_per_graph(PPG,'PPG',t);
    
elseif choice == 1
    visualization_subplots (RI,PPG,ECG,GSR,t);
    
end

