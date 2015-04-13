% Nathaniel Lundie ngl8
function problem2

f = figure('Visible', 'off','color','white','Position',[300, 400, 450,700]);
text1 = uicontrol('Style','text','BackgroundColor','white','FontSize',18,'Position', [50,200, 150, 50], 'String','Filename: ');
text2 = uicontrol('Style','text','BackgroundColor','white','FontSize',18,'Position', [50,150, 150, 50], 'String','Order(1 or more): ');
editText1 = uicontrol('Style','edit', 'Position',[250,200,150,50],'FontSize',18, 'String','Enter here');
editText2 = uicontrol('Style','edit', 'Position',[250,150,150,50],'FontSize',18, 'String','Enter here');
button = uicontrol('Style','pushbutton','String','Update', 'Position',[0,0,450,50],'Callback',@callbackfn,'FontSize',24);
axhan = axes('Units','Pixels','Position', [50,310,360,360]);
set(f,'Name','Problem 2')
movegui(f,'center')
set(f,'Visible','on')


function callbackfn(hObject,eventdata)
    hold off
    x1 = 2:0.1:8;
    filename = get(editText1 ,'String');
    order = str2num(get(editText2 ,'String'));
    fid = fopen(filename, 'r');
    if fid == -1
        errordlg('Error: Could not open file','Error');
    elseif order < 1
        errordlg('Polynomial order must be at least 1.','Error')
    else
        x = fscanf(fid, '%d %d', [2 inf]);
        plot(x(1, :), x(2, :), 'ro')
        hold on
        r = polyfit(x(1, :), x(2,:), order);
        s = polyval(r, x1);
        plot(x1, s)
        xlabel('x')
        ylabel('y')
        q = sprintf('Order = %d', order);
        title(q)
        if order >= 4
            warndlg('Polynomial is not unique; degree >= number of data points.');
        end
    end
end
end

