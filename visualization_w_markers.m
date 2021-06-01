function output = visualization_w_markers(x_markers,y_markers,c1,c2,c3,c4,t)
    
    
    if mean (c1) ~= 0
        figure;
        hold on;
        
        plot (t,c1);
        scatter (x_markers,y_markers,'+','g');
        title ('RI');
        xlabel ('Time (s)');
        ylabel ('Volts');
        
        set(gcf,'Position',[100 100 1000 800]);
    end
    
    if mean (c2) ~= 0
        figure;
        hold on;
        
        plot (t,c2);
        scatter (x_markers,y_markers,'+','r');
        title ('PPG');
        xlabel ('Time (s)');
        ylabel ('Volts');
        
        set(gcf,'Position',[100 100 1000 800]);
    end
    
    if mean(c3) ~= 0
        figure;
        hold on;
        
        plot (t,c3);
        scatter (x_markers,y_markers,'+','r');
        title ('ECG');
        ylabel ('Microvolts');
        xlabel ('Time (s)');
        
        
        set(gcf,'Position',[100 100 1000 800]);
        
    end
    
    if mean(c4) ~= 0
        figure;
        hold on;
        
        plot (t,c4);
        scatter (x_markers,y_markers,'+','g');
        title ('GSR');
        xlabel ('Time (s)');
        ylabel ('Microsiemens');
        
        set(gcf,'Position',[100 100 1000 800]);
        
    end
    
    

end

