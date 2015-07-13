%% This plots the measured and project energy generattion from 
%% February 20th
%% Projective data assume higher R_theta and higher optical eta

clc;
clear all;

% ***** INIT
% Color Log
Turquoise = [0.301960796117783 0.745098054409027 0.933333337306976];
Purple = [0.494117647409439 0.184313729405403 0.556862771511078];
Grey = [0.7 0.7 0.7];

mean_eta_combined = [0,0];

% 20-Feb Measured Qgen & Egen 

load('ICSolar.ICS_Skeleton_20_Feb_2015.mat','eta_Qgen_mods',...
    'eta_Egen_mods','Start','End','day');

figure('Color',[1 1 1]);
hold on;

% Set X and Y AXIS
axis([0 360 0 0.8]);

%Create Title
% title({strcat(day,': Module Efficiency'),...
%     '6 Modules of PV & 12 Modules of Thermal Collection',...
%     'Modeled vs Projected'},...
%     'FontName','Arial Narrow',...
%     'FontSize',18);

%Create xlabel
xlabel('Time (minutes)','FontName','Arial Narrow',...
    'FontSize',20,... % 15.4
    'FontWeight','bold');
set(gca,'XTickLabel',{'0','15','30','45','60'},...
    'FontName','arial narrow',...
    'FontSize',18,... % 14
    'FontWeight','bold'); 
set(gca,'XTick',[0 90 190 270 360]);
set(gca,'XGrid','on');

% Create ylabel
ylabel('\eta','FontName','Arial Narrow',...
    'FontSize',20,...
    'FontWeight','bold');
set(gca,'YGrid','on',...
    'FontName','arial narrow',...
    'FontSize',18,...
    'FontWeight','bold');


%Plot 

t_s_eta_Qgen = eta_Qgen_mods(:,Start:End); 
t_s_eta_Egen = eta_Egen_mods(:,Start:End);
t_s_eta_Com = t_s_eta_Qgen + t_s_eta_Egen;

mean_eta_combined(1) = mean(t_s_eta_Com);

plot(t_s_eta_Qgen,'Color',[1 0 0],...
    'LineWidth',2);
plot(t_s_eta_Egen,'Color',Turquoise,...
    'LineWidth',2);
plot(t_s_eta_Com,'Color',Purple,...
    'LineWidth',2);


%Plot Projected ...
%clc;
%clear all;

load('PROJECTED_ICSolar.ICS_Skeleton_20_Feb_2015.mat','eta_Qgen_mods',...
    'eta_Egen_mods','Start','End','day');
Turquoise = [0.301960796117783 0.745098054409027 0.933333337306976];
Purple = [0.494117647409439 0.184313729405403 0.556862771511078];

t_s_eta_Qgen = eta_Qgen_mods(:,Start:End);
t_s_eta_Egen = eta_Egen_mods(:,Start:End);
t_s_eta_Com = t_s_eta_Qgen + t_s_eta_Egen;

mean_eta_combined(2) = mean(t_s_eta_Com);

plot(t_s_eta_Qgen,'Color',[1 0 0],...
    'LineWidth',3,...
    'LineStyle',':');
plot(t_s_eta_Egen,'Color',Turquoise,...
    'LineWidth',3,...
    'LineStyle',':');
plot(t_s_eta_Com,'Color',Purple,...
    'LineWidth',3,...
    'LineStyle',':');

legend('Modeled \eta_Q_{gen}',...
    'Modeled \eta_E_{gen}',...
    'Modeled \eta Combined',...
    'Projected \eta_Q_{gen}',...
    'Projected \eta_E_{gen}',...
    'Projected \eta Combined',...
    'Location','eastoutside');    %'southeast'
set(legend,'FontName','Arial Narrow');

filename = strcat(day,'Projected Eta');
savefig(filename);
print(filename,'-dpng');

