function rgb_adjustment_gui
    hFig = figure('Name', 'RGB Adjustment', 'Position', [100, 100, 400, 300]);
    handles = struct();

    handles.hSliderR = uicontrol('Style', 'slider', 'Min', 0, 'Max', 1, 'Value', 0.5, ...
        'Position', [50, 220, 300, 20], 'Callback', @updateColor);
    handles.hSliderG = uicontrol('Style', 'slider', 'Min', 0, 'Max', 1, 'Value', 0.5, ...
        'Position', [50, 180, 300, 20], 'Callback', @updateColor);
    handles.hSliderB = uicontrol('Style', 'slider', 'Min', 0, 'Max', 1, 'Value', 0.5, ...
        'Position', [50, 140, 300, 20], 'Callback', @updateColor);

    uicontrol('Style', 'text', 'Position', [160, 250, 80, 30], 'String', 'Choose Color :');
    uicontrol('Style', 'text', 'Position', [10, 220, 30, 20], 'String', 'R');
    uicontrol('Style', 'text', 'Position', [10, 180, 30, 20], 'String', 'G');
    uicontrol('Style', 'text', 'Position', [10, 140, 30, 20], 'String', 'B');

    handles.hColorPanel = uipanel('Position', [0.1, 0.1, 0.8, 0.2], 'BackgroundColor', [0.5, 0.5, 0.5]);

    guidata(hFig, handles);

    function updateColor(src, ~)
        handles = guidata(src);

        r = get(handles.hSliderR, 'Value');
        g = get(handles.hSliderG, 'Value');
        b = get(handles.hSliderB, 'Value');
        set(handles.hColorPanel, 'BackgroundColor', [r, g, b]);
        
        rInt = round(r * 255);
        gInt = round(g * 255);
        bInt = round(b * 255);
        dataStr = sprintf('%d,%d,%d\n', rInt, gInt, bInt);
%%        handles.serialPort = serialport("COM8", 9600);
         handles.serialPort = serial('COM8', 'BaudRate', 9600);
         fopen(handles.serialPort);
         fprintf(handles.serialPort, dataStr);
         fclose(handles.serialPort);
         delete(handles.serialPort);
         clear handles.serialPort;
         
         %        writeline(handles.serialPort, dataStr);
    end
end
        % Format the data string
        %dataStr = sprintf('%d,%d,%d\n', rInt, gInt, bInt);
        
        % Create the serial object
%        handles.serialPort = serial('COM8', 'BaudRate', 9600);
        % Open the serial port
%         fopen(handles.serialPort);
%         fprintf(handles.serialPort, dataStr);
%         fclose(handles.serialPort);
%         delete(handles.serialPort);
%         clear handles.serialPort;