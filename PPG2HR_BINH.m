function [trough_peaks,outputArg2] = PPG2HR_BINH(focus,fs)
% HR is range from 60 to 100 
% Sample range is from 1200-2000 samples
% Homemade alg made by Binh

%% Moving average filter for the focussed sample
len = length (focus);
for i=1:(len-fs/5)
    
    local_sum=0;
    
    for j=1:fs/5
        local_sum=local_sum+focus(i+j);
    end
    
    y(i)=local_sum/(fs/5);
end

%% Take the windows of 2000 samples
% Find the number of windows the signal can fit 2000 samples
max_windows = floor (length(y)/fs);

% Trough in col 1 and Peaks in col 2
trough_peaks = zeros(1,2);
count = ones(1,2);

for window_num = 0:max_windows

    % Sample every 2000
    % Start at 1:2000 then 2001:4000....
    start = 1 + window_num*2000;
    endz = 2000 + window_num*2000;
    
    if endz >length (y)
        endz = length(y);        
    end
    
    yy = y (start:endz);
    yy_deriv = abs(diff (yy));
    [pks,locs] = findpeaks(-yy_deriv,'MinPeakDistance',400,'MinPeakHeight', - (max(yy_deriv) * 0.01));


%     figure;hold on;
%     plot (yy);
%     scatter (locs, yy (locs));


    for i = locs

        samples_before = mean (yy(i-5:i-1));
        samples_after = mean (yy(i+1:i+5));

        % Trough
        if samples_after > yy(i) &&  samples_before > yy(i)
            trough_peaks (count(1),1) = i;
            count (1) = count (1) + 1;
        % Peak
        elseif samples_after < yy(i) &&  samples_before < yy(i)
            trough_peaks (count(2),2) = i;
            count (2) = count (2) + 1;

        else 
            display ('Do not work');
        end


    end


end

end

