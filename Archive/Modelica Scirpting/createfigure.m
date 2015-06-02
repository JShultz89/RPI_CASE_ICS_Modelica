function createfigure(YMatrix1)
%CREATEFIGURE(YMATRIX1)
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 01-Jun-2015 19:07:14

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,'XTickLabel',{'0','','','30','','','60'});
%% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0 100]);
box(axes1,'on');
hold(axes1,'all');

% Create multiple lines using matrix input to plot
plot1 = plot(YMatrix1,'Parent',axes1,'LineWidth',2);
set(plot1(1),'DisplayName','t_o_Egen','LineWidth',0.5);
set(plot1(2),...
    'Color',[0.494117647409439 0.184313729405403 0.556862771511078],...
    'DisplayName','t_o_Egen');
set(plot1(3),'Color',[1 0 0],'DisplayName','t_o_Qgen');
set(plot1(4),'LineStyle',':',...
    'Color',[0.494117647409439 0.184313729405403 0.556862771511078],...
    'DisplayName','t_s_Egen');
set(plot1(5),'LineStyle',':','Color',[1 0 0],'DisplayName','t_s_Qgen');

% Create title
title({'23 March 2015: Array Total Energy Generation','6 Modules of PV & 12 Modules of Thermal Collection'},...
    'FontWeight','bold',...
    'FontSize',16);

% Create xlabel
xlabel('Time (minutes)','FontSize',16);

% Create ylabel
ylabel('Power (Watts)','FontSize',16);

% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Location','SouthEast');

