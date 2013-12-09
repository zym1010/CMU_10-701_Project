%% =====================================================================
% settings
LINE_WIDTH = 2;
MAKRER_SIZE = 10;

LINE_COLOR_1 = 'k';
LINE_COLOR_2 = [1 46 137]/255;
LINE_COLOR_3 = [3 105 42]/255;
LINE_COLOR_4 = [82 53 111]/255;
LINE_COLOR_5 = [128 0 255]./[256];
LINE_COLOR_6 = [0 128  196]./[256];


MARKER_1 = '^'
MARKER_2 = '*'
MARKER_3 = 'x'
MARKER_4 = 'v'
MARKER_5 = 'o'
MARKER_6 = 'square'
% font
FONT_SIZE_LEGEND = 13;
FONT_SIZE_AXIS = 15;
FONT_SIZE_LABEL = 16;
FONT_SIZE_TITLE = 18;

% axis
LINE_WIDTH_AXIS = 2;
LABEL_X = '\# of Frequency Domain Features';
LABEL_Y = 'AUC';
LABEL_TITLE = '';
FLAG_GRID_Y = 'off';

% legend
LEGEND_TEXT_1 = '{\it\varsigma}_0=0.3';
LEGEND_TEXT_2 = '{\it\varsigma}_0=0.5';
LEGEND_TEXT_3 = '{\it\varsigma}_0=0.7';
LEGEND_TEXT_4 = '{\it\varsigma}_0=0.9';
LEGEND_POSITION = 4;

%% =====================================================================


X=[2, 3, 4, 6, 8, 12, 16, 24, 32, 48]; 


Y1=[ 0.79227, 0.79167, 0.79532, 0.79410, 0.79682, 0.79600, 0.79894, 0.79550, 0.79706, 0.79189];



%% =====================================================================
% create a new figure window
fig = figure();
set(fig, 'Position', [1 1 640 480]);

hold on;

% configure lines



line1 = plot(X, Y1);
set(line1, 'LineStyle','-'); 
set(line1, 'LineWidth',LINE_WIDTH); 
set(line1, 'Color',LINE_COLOR_6); 
set(line1, 'Marker',MARKER_1); 
set(line1, 'MarkerSize',MAKRER_SIZE); 
set(line1, 'MarkerEdgeColor',LINE_COLOR_6); 
set(line1, 'MarkerFaceColor','w'); 




 
%% =====================================================================
% conigure legend
[hL, h2]= legend('Only Frequency Features','location','northeast')
legend(hL, 'boxoff');
set(hL, 'Interpreter','latex');
set(h2(1:1), ...
    'FontSize', FONT_SIZE_LEGEND, ...
    'FontWeight', 'bold');


%% =====================================================================
% configure axis

axis([2,48,0.790,0.8])
hA = gca;
set(hA, 'FontSize', FONT_SIZE_AXIS, ...
    'LineWidth', LINE_WIDTH_AXIS, ...
    'YGrid', FLAG_GRID_Y, ...
    'XMinorTick','on', ...
    'YMinorTick', 'on');
set(hA, 'YGrid', FLAG_GRID_Y);
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
export_fig fftauc -eps -transparent;

%% =====================================================================
% end
