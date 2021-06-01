function [event_markers] = event_marker(df_event_markers)

    % Marker for Index, Time and Labels
    event_markers = cell (1,3);


    for n_row = 1:size (df_event_markers,1)

    % Empty row for cells to be stored
    row_cells = table2cell (df_event_markers (n_row,:));

    % Try and catch to put component into one line 
    try
        hold1 = row_cells (1);
        for i = row_cells(1:end-1)
            hold2 = i;
            str_concat = strcat (hold1,hold2);
            hold1 = str_concat;
        end

    catch 
    end

    % Save index, time and label
    str_seperated = strsplit (char (str_concat),',');
    event_markers(n_row,1) = (str_seperated(1)); % Index
    event_markers(n_row,2) = (str_seperated(2)); % Time
    event_markers(n_row,3) = str_seperated(6); % Label


    end


end

