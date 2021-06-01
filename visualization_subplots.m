function output = visualization_subplots(sig1,sig2,sig3,sig4,t)

    count = 0;
    c1 = 0;
    c2 = 0;
    c3 = 0;
    c4 = 0;
    
    
%     Check which one is included to determine the number of subplots
    if length (sig1) > 1
       count = count +1;
       c1 = 1;
    end
   
    if length(sig2) > 1
       count = count +1;
       c2 = 1;
    end
    
    if length(sig3) > 1
       count = count +1;
       c3 = 1;
    end
        
    if length(sig4) > 1
       count = count +1;
       c4 = 1;
    end
   
    
    figure; 
    fig_num = 1;
  
    if c1 == 1
        subplot (count,1,fig_num)
        plot (t,sig1);
        title ('RI');
        xlabel ('Time (s)');
        ylabel ('Volts');
        
        fig_num = fig_num+1;
    end
    
    if c2 == 1
        subplot (count,1,fig_num)
        plot (t,sig2);
        title ('PPG');
        xlabel ('Time (s)');
        ylabel ('Volts');
        
        fig_num = fig_num+1;
    end
    
    if c3 == 1
        subplot (count,1,fig_num)
        plot (t,sig3);
        title ('ECG');
        xlabel ('Time (s)');
        ylabel ('Microvolts');
        
        fig_num = fig_num+1;
    end
    
    if c4 == 1
        subplot (count,1,fig_num)
        plot (t,sig4);
        title ('GSR');
        xlabel ('Time (s)');
        ylabel ('Microsiemens');
        
        fig_num = fig_num+1;
    end
    
    set(gcf,'Position',[100 100 1000 800]);

end

