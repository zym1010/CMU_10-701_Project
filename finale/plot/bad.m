


%% =====================================================================

% This is a template for plotting multiple lines with error bars
% By Dr. Yanmin Zhu
% Updated on 5/8/2012

%% =====================================================================
% clear variables
clear;

% prepare data
% X_MIN = 6;
% X_MAX = 12;
% STEP = 1;
% XX = X_MIN : STEP : X_MAX;

X_MIN = 0.8;
X_MAX = 9;
STEP = 100;
XX = [1: 1: 9]

x = [1: 1: 9]
opt = [5479 5525 5650 5375 5355 6055 5356 4769 6315]
y1 = [565 593 549 538 558 582 547 459 617]./opt%GPSR
e1 = [2 2 3  4 6 5 7 8 5]./opt*3000
y2 = [1601 1636 1685 1623 1603 1749 1605 1404 1859]./opt.*0.8%Epdemic .
e2 = [15 12  12 13  16 15 12 16 17]./opt*2000
y3 = [1552 1512 1494 1292 1252 1353 1256 1155 1600]./opt%S&W
e3 = [6 9  12 10 13  15 17 15 18]./opt*500
y4 = [1784 1770 1612 1348 1307 1489 1251 1105 1532]./opt%RAPID
e4 = [ 12 5 9 11 11 14 18 17 16 ]./opt*500
y5 = [1998 1925 1975 1846 1905 2095 1924 1685 2222]./opt%CCR
e5 = [11  12 12 10 14  16 15 18 17 ]./opt*2000


NUM_LINES = 1;

[N NUM_POINTS] = size(XX);
YLINE_V = ones(NUM_LINES, NUM_POINTS);
YLINE_V = [y1;y2;y3;y4;y5];
ERROR_L_V = [e1;e2;e3;e4;e5];
ERROR_U_V = [e1;e2;e3;e4;e5];
    
X = XX;
% YLINE_V(1,:) = normpdf(XX, 0, 4);
% YLINE_V(2,:) = normpdf(XX, 0, 5);
% YLINE_V(3,:) = normpdf(XX, 0, 6);
% YLINE_V(4,:) = normpdf(XX, 0, 7);

% YLINE_V(1,:) = XX.^2.5 + 20;
% YLINE_V(2,:) = 2*XX.^3.5+10;
% YLINE_V(3,:) = 3*XX.^3;
% YLINE_V(4,:) = 4*XX.^3.5-20;

%dataPath = Fig12A.txt

%YLINES_V = load(dataPath)



ERROR_L_V(1,:) = std( YLINE_V(1,:) )/2 * ERROR_L_V(1,:) ;
ERROR_L_V(2,:) = std( YLINE_V(2,:) )/2 * ERROR_L_V(2,:)  ;
ERROR_L_V(3,:) = std( YLINE_V(3,:) )/2 * ERROR_L_V(3,:)  ;
ERROR_L_V(4,:) = std( YLINE_V(4,:) )/2 * ERROR_L_V(4,:)  ;
ERROR_L_V(5,:) = std( YLINE_V(5,:) )/2 * ERROR_L_V(5,:)  ;


ERROR_U_V(1,:) = std( YLINE_V(1,:) )/2  * ERROR_U_V(1,:) ;
ERROR_U_V(2,:) = std( YLINE_V(2,:) )/2 * ERROR_U_V(2,:)  ;
ERROR_U_V(3,:) = std( YLINE_V(3,:) )/2 * ERROR_U_V(3,:)  ;
ERROR_U_V(4,:) = std( YLINE_V(4,:) )/2 * ERROR_U_V(4,:)  ;
ERROR_U_V(5,:) = std( YLINE_V(5,:) )/2 * ERROR_U_V(5,:)  ;


%% =====================================================================
% settings
LINE_WIDTH = 2;
MAKRER_SIZE = 10;


%by default, all lines have the same line style of '-'
for i = 1:NUM_LINES
   LINE_STYLE_V{i} = '-';
end
LINE_STYLE_V{1} = '-';
LINE_STYLE_V{2} = '--';
LINE_STYLE_V{3} = ':';
LINE_STYLE_V{4} = '-.';


%by default, all lines have black color
for i = 1:NUM_LINES
   LINE_COLOR_V{i} = [0 0 0]/255;
end
LINE_COLOR_V{1} = [0 0 0]/255;
LINE_COLOR_V{2} = [1 46 137]/255;
LINE_COLOR_V{3} = [3 105 42]/255;
LINE_COLOR_V{4} = [82 53 111]/255;
LINE_COLOR_V{5} = [0 128  196]./[256];

%by default, all markers have a shape of ^
% + Plus sign
% o Circle
% * Asterisk
% . Point
% x Cross
% 'square' or s  Square
% 'diamond' or d  Diamond
% ^ Upward-pointing triangle
% v Downward-pointing triangle
% > Right-pointing triangle
% < Left-pointing triangle
% 'pentagram' or p  Five-pointed star (pentagram)
% 'hexagram' or h  Six-pointed star (hexagram)

for i = 1:NUM_LINES
   MARKER_SHAPE_V(i) = '^';
end

MARKER_SHAPE_V(1) = '^';
MARKER_SHAPE_V(2) = '*';
MARKER_SHAPE_V(3) = 'x';
MARKER_SHAPE_V(4) = 'v';
MARKER_SHAPE_V(5) = 'o';


MARKER_FACE_FLAG = false ;

%by default, all marker faces have a color of 'w' ^
for i = 1:NUM_LINES
   MARKER_FACE_COLOR_V(i) = 'w';
end
MARKER_FACE_COLOR_V(1) = 'w';
MARKER_FACE_COLOR_V(2) = 'w';
MARKER_FACE_COLOR_V(3) = 'w';
MARKER_FACE_COLOR_V(4) = 'w';

% font
FONT_SIZE_LEGEND = 13;
FONT_SIZE_AXIS = 15;
FONT_SIZE_LABEL = 16;
FONT_SIZE_TITLE = 18;

% axis
LINE_WIDTH_AXIS = 2;
LABEL_X = 'Number of Turnovers';
LABEL_Y = 'Delivery ratio';
LABEL_TITLE = '';
FLAG_GRID_Y = 'off';

% legend
%by default, all legend texts are set to '' ^
for i = 1:NUM_LINES
   LEGEND_TEXT_V{i} = '';
end
LEGEND_TEXT_V{1} = 'GPSR';
LEGEND_TEXT_V{2} = 'Epidemic';
LEGEND_TEXT_V{3} = 'S\&W';
LEGEND_TEXT_V{4} = 'RAPID';
LEGEND_TEXT_V{5} = 'CCR';

% 1: right upper; 2: left upper; 3: left bottom; 4 right bottom
LEGEND_POSITION = 1;
LEGEND_BOX_FLAG = 'boxoff';
LEGEND_FONT_WEIGHT = 'bold';

%errorbar or simple lines
ERRORBAR_FLAG = false;




%% =====================================================================
% create a new figure window
fig = figure();
set(fig, 'Position', [1 1 650 600]);
%set(fig, 'Position', [1 1 700 600]);
if ERRORBAR_FLAG
    for i = 1 : NUM_LINES
        line = errorbar(X, YLINE_V(i,:), ERROR_L_V(i,:), ERROR_U_V(i,:));
        hold on;

        set(line, 'LineStyle',LINE_STYLE_V{i} ); 
        set(line, 'LineWidth',LINE_WIDTH); 
        set(line, 'Color',LINE_COLOR_V{i} ); 
        set(line, 'Marker',MARKER_SHAPE_V(i) ); 
        set(line, 'MarkerSize',MAKRER_SIZE); 
        set(line, 'MarkerEdgeColor',LINE_COLOR_V{i}); 
        if MARKER_FACE_FLAG 
            set(line, 'MarkerFaceColor',MARKER_FACE_COLOR_V(i) ); 
        end 
    end
else
    for i = 1 : NUM_LINES
        line = plot(X, YLINE_V(i,:));
        hold on;

        set(line, 'LineStyle',LINE_STYLE_V{i} ); 
        set(line, 'LineWidth',LINE_WIDTH); 
        set(line, 'Color',LINE_COLOR_V{i}  ); 
        set(line, 'Marker',MARKER_SHAPE_V(i) ); 
        set(line, 'MarkerSize',MAKRER_SIZE); 
        set(line, 'MarkerEdgeColor',LINE_COLOR_V{i} ); 
        if MARKER_FACE_FLAG 
            set(line, 'MarkerFaceColor',MARKER_FACE_COLOR_V(i) ); 
        end 
    end 
end %errorflag



%% =====================================================================
% configure axis

xlim([X_MIN X_MAX]);
ylim([0.08 0.5]);
hA = gca;
set(hA, 'FontSize', FONT_SIZE_AXIS, ...
    'LineWidth', LINE_WIDTH_AXIS, ...
    'YGrid', FLAG_GRID_Y, ...
    'XMinorTick','on', ...
    'YMinorTick', 'on');

% set(hA, 'Color', [1,0,1]); % background
% set(hA, 'XColor', [1,1,0]);
% set(hA, 'YColor', [1,0,1]);

% set(hA, 'XTickLabel',{'one';'two';'three'});

hX = xlabel(LABEL_X);
hY = ylabel(LABEL_Y);
set(hX, 'FontSize', FONT_SIZE_LABEL);
set(hX, 'Color', 'k');
set(hX, 'Interpreter','latex');
set(hY, 'FontSize', FONT_SIZE_LABEL);
set(hY, 'Color', 'k');
set(hY, 'Interpreter','latex');

hT = title(LABEL_TITLE);
set(hT, 'FontSize', FONT_SIZE_TITLE);

box on;
hold off;


%% =====================================================================
% conigure legend
[hL, h2] = legend(LEGEND_TEXT_V{1}, ...
    LEGEND_TEXT_V{2}, ...
    LEGEND_TEXT_V{3}, ...
    LEGEND_TEXT_V{4}, ...
    LEGEND_TEXT_V{5}, ...
    LEGEND_POSITION);

legend(hL, LEGEND_BOX_FLAG);
set(hL, 'Interpreter','latex');
set(h2(1:NUM_LINES), ...
    'FontSize', FONT_SIZE_LEGEND, ...
    'FontWeight', LEGEND_FONT_WEIGHT);
%export_fig bus_dr_jump -eps -transparent



%% =====================================================================
% annotate

%annotation('textarrow',[0.2 0.5],[0.2 0.5]);
%annotation('ellipse',[0.2 0.2 0.3 0.3])




%% =====================================================================
% end

