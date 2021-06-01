function [output] = visualization_w_markers_focussed(signal,df_EM,in)

index = in+1; % index is + 1 because in MATLAB

% Extract markers from df_EM
x_marker = str2double (df_EM(index,2));
x_marker_plus1 = str2double (df_EM(index+1,2));
y_markers = zeros (length(x_marker),1);

% Time to samples for ECG plot
x1 = t2s (x_marker);
x2 = t2s (x_marker_plus1); 

% Output signal
output = signal(x1:x2);

% Time for the signal
t = s2t(output);

figure; 
plot (t,output);
title (df_EM(index,3));


end

