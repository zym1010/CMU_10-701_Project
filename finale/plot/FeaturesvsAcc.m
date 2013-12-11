%% =====================================================================
% settings
LINE_WIDTH = 1.5;
MAKRER_SIZE = 10;

LINE_COLOR_2 = [178 34 34]./[256];
LINE_COLOR_1 = [25 25 112 ]./[256];
LINE_COLOR_3 =[227 114 0]./[256];
LINE_COLOR_4 = [47 145 66]./[256];
LINE_COLOR_5 = [128 0 255]./[256];
LINE_COLOR_6 = [0 128  196]./[256];

MARKER_1 = 'square'
MARKER_2 = '^'
MARKER_3 = 'diamond'
MARKER_4 = 'v'
MARKER_5 = 'o'

% font
FONT_SIZE_LEGEND = 13;
FONT_SIZE_AXIS = 15;
FONT_SIZE_LABEL = 16;
FONT_SIZE_TITLE = 18;

% axis
LINE_WIDTH_AXIS = 1;
LABEL_X = 'NA';
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


%X = [1,2,3,4,5,6]

Y = [0.809 0.81384 0.82646 0.84136 0.83940 0.85215 0.85658 0.86695 0.89437 0.90761 ;0 0 0 0 0 0 0 0 0 0];


%E = [2 2;2 2; 3 2; 4 2; 4 3;4 3]./200





%% =====================================================================
% create a new figure window
fig = figure();
set(fig, 'Position', [1 1 640 480]);
hold on;
h = bar(Y);
set(h(1),'facecolor',LINE_COLOR_1) 
set(h(2),'facecolor',LINE_COLOR_2) 
set(h(3),'facecolor',LINE_COLOR_3) 
set(h(4),'facecolor',LINE_COLOR_4) 
set(h(5),'facecolor',LINE_COLOR_6)






for i=1:10
  text(0.6+(i-1)*0.08,Y(1,i)+0.005,num2str(Y(1,i))) ;
end



%% =====================================================================
% conigure legend
hL= legend('Feature #1','Feature #2','Feature #3','Feature #4','#2+#3','#2+#4','#3+#4','#2+#3+#4', '#5+#6','All','location','northwest')
legend(hL, 'boxoff');


%% =====================================================================
% configure axis

axis([0.5,1.5,0.8,0.95])

hA = gca;
set(hA, 'FontSize', FONT_SIZE_AXIS);
set(hA, 'LineWidth', LINE_WIDTH_AXIS);
set(hA, 'YGrid', FLAG_GRID_Y);
% set(hA, 'Color', [1,0,1]); % background
% set(hA, 'XColor', [1,1,0]);
% set(hA, 'YColor', [1,0,1]);

% set(hA, 'XTickLabel',{'one';'two';'three'});
set(gca,'XTickLabel',{'','','',' ','Logistic', '',''})
%hX = xlabel(LABEL_X);
hY = ylabel(LABEL_Y);
%set(hX, 'FontSize', FONT_SIZE_LABEL);
%set(hX, 'Color', 'k');
set(hY, 'FontSize', FONT_SIZE_LABEL);
set(hY, 'Color', 'k');


hT = title(LABEL_TITLE);
set(hT, 'FontSize', FONT_SIZE_TITLE);

box on;
hold off;
export_fig feature -pdf -transparent;

%% =====================================================================
% end
