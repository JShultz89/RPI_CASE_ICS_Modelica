% Chart out homogeneous (3module) eta vs T_HTFin
% begat: back circa 2015
% author: Kenton Phillips, Nick Novelli
% Changelog
% 20180330 reconfigured to output just etas since exergy is left out of
% results

nthElement = 50; %reduce the number of output datapoints on chart
%for exergy uncertainty
T_ref = 20; % (c)

%%figure out some colors
clear all;

Blueish = [0 0.45 0.74];
Yellowish = [0.75 0.75 0];
Redish = [0.85 0.33 0.1];
Grey = [.5 .5 .5];
Color_Cgen = [75/255,0/255,130/255]; %purple
Color_Egen = [0 0.45 0.74];
Color_Qgen = [1 0.15 0.15] ;




%% get single figure going
figure('Color',[1 1 1]);
% hold on;

MarkerSize = 4;

% Create axes
axes1 = axes;
hold(axes1,'on');

% title({'\chi vs \epsilon','Measured Total Array'},...
%     'FontSize',18,...
%     'FontName','Arial Narrow');

xlabel('T_{HTF,in}(�C)','FontWeight','bold','FontName','arial narrow');
set(gca,'XGrid','on',...
    'FontName','arial narrow',...
    'FontSize',12,...
    'FontWeight','bold');

%ylabel('\epsilon_{Cogen} and \eta_{Cogen}',...
ylabel('\eta',...
    'FontName','Arial Narrow',...
    'FontSize',12,...
    'FontWeight','bold');
set(gca,'YGrid','on',...
    'FontName','arial narrow',...
    'FontSize',12,...
    'FontWeight','bold');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[50 90]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0 0.801]);

axis([50 90 0 0.801]);

set(axes1,'FontName','arial narrow','FontWeight','bold','OuterPosition',...
    [0 0.2098341856499 1 0.7901658143501],'XGrid','on','XTick',...
    [50 55 60 65 70 75 80 85 90],'XTickLabel',...
    {'50','','60','','70','','80','','90'},'YGrid','on','YTick',...
    [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8]);


%% Plot Feb 20th

load('ICSolar.ICS_Skeleton_20_Feb_2015_v20180330.mat','chi_arrayTotal',...
    'dataset_Start','dataset_End','day','measured_T_HTFin',...
    'measured_T_cavAvg','G_DN_6mods','eta_Cgen_6mods',...
    'measured_eta_Cgen_arrayTotal','measured_Ex_epsilon','measured_Egen_arrayTotal',...
    'measured_Qgen_arrayTotal','measured_vFlow','measured_T_HTFout',...
    'GN_arrayTotal','measured_T_s3m5in','measured_T_s3m3in', 'measured_T_s3m1in')

dataset_Start = 36
% Modeled
Color = Grey;

% Modeled Extropaltated Ex Epsilon Array total 
% T_HTFin = [40 50 60 75 85];
% predict_eps = [0.1425 0.146 0.1477 0.146 0.1425];
% T_HTFin = [350-273 300-273 325-273 375-273];
% predict_eps = [0.1492 0.1414 .152 .1355];

% f=fit(T_HTFin',predict_eps','poly2');
% x=0:5:100;
% y=f(x);
% indexmax = find(max(y) == y);
% xmax = x(indexmax);
% ymax = y(indexmax);
% 
% plot(x,y,'LineStyle',':',...
%     'DisplayName','Extrapolated Modeled Results',...
%     'Color',Color,...
%     'LineWidth',3);

Color = Blueish;

% t_o_ = trim and groom the observed data into the right length for charting
t_o_vFlow = measured_vFlow(:,dataset_Start:dataset_End); 
t_s_Tref = (T_ref+273).*ones(1,length(t_o_vFlow));

t_o_Tin =  measured_T_HTFin(:,dataset_Start:dataset_End) - 273;
t_o_Ts3m5in = measured_T_s3m5in(:,dataset_Start:dataset_End) - 273;
t_o_Ts3m3in = measured_T_s3m3in(:,dataset_Start:dataset_End) - 273;
t_o_Ts3m1in = measured_T_s3m1in(:,dataset_Start:dataset_End) - 273;

t_o_Gdn_mod = G_DN_6mods(:,dataset_Start:dataset_End)./6;
t_o_Egen_mod = measured_Egen_arrayTotal(:,dataset_Start:dataset_End)./6;
t_o_Gdn_mod23 = G_DN_6mods(:,dataset_Start:dataset_End)./3;
t_o_Egen_mod23 = measured_Egen_arrayTotal(:,dataset_Start:dataset_End)./3;
 
% calc how much Qgen and Egen
t_o_Qgen6 = 4190 * 974.9 * t_o_vFlow .* (t_o_Ts3m5in - t_o_Tin);
t_o_Qgen23 = 4190 * 974.9 * t_o_vFlow .* (t_o_Ts3m1in - t_o_Ts3m3in);

t_o_Qgen = t_o_Qgen23 + t_o_Qgen6;
t_o_Egen = t_o_Egen_mod + t_o_Egen_mod23; 
t_o_GDN = t_o_Gdn_mod+t_o_Gdn_mod23

% do straight eta_Qgen and eta_Egen
t_o_eta_Egen = t_o_Egen./t_o_GDN;
t_o_eta_Qgen = t_o_Qgen./t_o_GDN;


% calc uncertainty for Qgen
[s_Qgen_mod6] = UQ_Qgen(t_o_vFlow,t_o_Tin,t_o_Ts3m5in);
[s_Qgen_mod23] = UQ_Qgen(t_o_vFlow,t_o_Ts3m3in,t_o_Ts3m1in);
s_Qgen = sqrt( (s_Qgen_mod6).^2 + (s_Qgen_mod23).^2);

% calc uncertainty for eta_Qgen
[ s_eta_Qgen ] = UQ_eta_Qgen( t_o_Qgen, s_Qgen, t_o_GDN)

% calc uncertainty for eta_Egen
s_Egen = 0.73; % check BITCOPT1 appendix for value
[ s_eta_Egen ] = UQ_eta_Qgen( t_o_Egen, s_Egen, t_o_GDN)

% calc uncertainty for eta_Cgen
[t_o_eta_Cgen6, s_eta_Cgen_mod6] = UQ_eta_Cgen(t_o_Qgen6,s_Qgen_mod6,...
    t_o_Egen_mod,t_o_Gdn_mod);
[t_o_eta_Cgen23, s_eta_Cgen_mod23] = UQ_eta_Cgen(t_o_Qgen23,s_Qgen_mod23,...
    t_o_Egen_mod23,t_o_Gdn_mod23);

s_eta_Cgen = sqrt((2/3)^2.*(s_eta_Cgen_mod23).^2 + (1/3)^2.*(s_eta_Cgen_mod6).^2);
t_o_eta_Cgen = (2/3)*t_o_eta_Cgen23 + (1/3)*t_o_eta_Cgen6;

% uncertainty for exergy
[s_ex_epsilon_mod6,t_o_epsilon_mod6] = UQ_ex_epsilon(...
    t_o_vFlow,t_s_Tref,t_o_Tin,t_o_Ts3m5in,t_o_Egen_mod,t_o_Gdn_mod,0.5);
[s_ex_epsilon_mod23,t_o_epsilon_mod23] = UQ_ex_epsilon(...
    t_o_vFlow,t_s_Tref,t_o_Ts3m3in,t_o_Ts3m1in,t_o_Egen_mod23,t_o_Gdn_mod23,0.5);


% exergy:
s_ex_epsilon =  sqrt( ((1/3)^2).* s_ex_epsilon_mod6.^2  + ((2/3)^2).* s_ex_epsilon_mod23.^2);
t_o_epsilon = (t_o_epsilon_mod6 + 2.*t_o_epsilon_mod23 )./3;

%format error data to fit in the chart format
%error = 0.03.*ones(length(t_o_Tin(1:nthElement:end)'),1);
error_eta_Cgen = s_eta_Cgen(1:nthElement:end);
error_eta_Qgen = s_eta_Qgen(1:nthElement:end);
error_eta_Egen = s_eta_Egen(1:nthElement:end);
error_ex = s_ex_epsilon(1:nthElement:end);
% error_eta_Cgen = s_eta_Cgen(1:nthElement:end);
% error_ex = s_ex_epsilon(1:nthElement:end);

error_eta_Cgen_mod23 = s_eta_Cgen_mod23(1:nthElement:end);
error_ex_mod23 = s_ex_epsilon_mod23(1:nthElement:end);

error_eta_Cgen_mod6 = s_eta_Cgen_mod6(1:nthElement:end);
error_ex_mod6 = s_ex_epsilon_mod6(1:nthElement:end);

%add the zero point
f=fit(t_o_Tin',t_o_eta_Cgen','poly1');
x=0:5:100;
y=f(x);


% plot(x,y,'LineStyle',':',...
%     'Color',Grey,...
%     'LineWidth',3);

% Graph Stuff
errorbar(t_o_Tin(1:nthElement:end)',t_o_eta_Cgen(1:nthElement:end)',error_eta_Cgen,...
    'Marker','o',...
    'MarkerSize',MarkerSize,...
    'LineStyle','-',...
    'Color',Color_Cgen,...
    'MarkerFaceColor','w',...
    'MarkerEdgeColor',Color_Cgen,...
    'DisplayName','20 Feb \eta_{cogen}');

errorbar(t_o_Tin(1:nthElement:end)',t_o_eta_Qgen(1:nthElement:end)',error_eta_Qgen,...
    'Marker','s',...
    'MarkerSize',MarkerSize,...
    'LineStyle','-',...
    'Color',Color_Qgen,...
    'MarkerFaceColor','w',...
    'MarkerEdgeColor',Color_Qgen,...
    'DisplayName','20 Feb \eta_{Qgen}');

errorbar(t_o_Tin(1:nthElement:end)',t_o_eta_Egen(1:nthElement:end)',error_eta_Egen,...
    'Marker','s',...
    'MarkerSize',MarkerSize,...
    'LineStyle','-',...
    'Color',Color_Egen,...
    'MarkerFaceColor','w',...
    'MarkerEdgeColor',Color_Egen,...
    'DisplayName','20 Feb \eta_{Egen}');

% errorbar(t_o_Tin(1:nthElement:end)',t_o_epsilon(1:nthElement:end)',error_ex,...
%     'Marker','o',...
%     'MarkerSize',8,...
%     'LineStyle','-',...
%     'Color',Color,....
%     'MarkerFaceColor',Color,...
%     'MarkerEdgeColor',Color,...
%     'DisplayName','20 Feb \epsilon');

% errorbar(t_o_Ts3m3in(1:nthElement:end)',t_o_epsilon_mod23(1:nthElement:end)',error_ex_mod23,...
%     'Marker','o',...
%     'MarkerSize',8,...
%     'LineStyle','none',...
%     'Color',Color,....
%     'MarkerFaceColor',Color,...
%     'MarkerEdgeColor',Color,...
%     'DisplayName','20 Feb \epsilon');
% 
% errorbar(t_o_Ts3m3in(1:nthElement:end)',t_o_eta_Cgen23(1:nthElement:end)',error_eta_Cgen_mod23,...
%     'Marker','o',...
%     'MarkerSize',8,...
%     'LineStyle','none',...
%     'Color',Color,...
%     'MarkerFaceColor','w',...
%     'MarkerEdgeColor',Color,...
%     'DisplayName','20 Feb \eta');
% 
% errorbar(t_o_Tin(1:nthElement:end)',t_o_epsilon_mod6(1:nthElement:end)',error_ex_mod6,...
%     'Marker','o',...
%     'MarkerSize',8,...
%     'LineStyle','none',...
%     'Color',Color,....
%     'MarkerFaceColor',Color,...
%     'MarkerEdgeColor',Color,...
%     'DisplayName','20 Feb \epsilon');
% 
% errorbar(t_o_Tin(1:nthElement:end)',t_o_eta_Cgen6(1:nthElement:end)',error_eta_Cgen_mod6,...
%     'Marker','o',...
%     'MarkerSize',8,...
%     'LineStyle','none',...
%     'Color',Color,...
%     'MarkerFaceColor','w',...
%     'MarkerEdgeColor',Color,...
%     'DisplayName','20 Feb \eta');



% scatter(t_o_Tin(1:nthElement:end)',t_o_eta(1:nthElement:end)',...
%     markerSize,'o',...
%     'MarkerFaceColor','w',...
%     'MarkerEdgeColor',Color,...
%     'DisplayName','20 Feb \eta');


% scatter(t_o_chi',t_o_epsilon_arrayTotal',...
%     'MarkerFaceColor',Color,...
%     'MarkerEdgeColor',Color,...
%     'DisplayName',strcat(...z
%     day,' \chi vs \epsilon'));

% x=0:.01:.2;
% y=f(x);

% plot(x,y,'LineStyle',':',...
%     'DisplayName',strcat(day, ' Linear Bestfit'),...
%     'Color',Color,...
%     'LineWidth',3);





 %% Plot Mar 19th
% load('ICSolar.ICS_Skeleton_19_Mar_2015_v20180330.mat','chi_arrayTotal',...
%     'dataset_Start','dataset_End','day','measured_T_HTFin',...
%     'measured_T_cavAvg','G_DN_6mods','eta_Cgen_6mods',...
%     'measured_eta_Cgen_arrayTotal','measured_Ex_epsilon','measured_Egen_arrayTotal',...
%     'measured_Qgen_arrayTotal','measured_vFlow','measured_T_HTFout',...
%     'GN_arrayTotal','measured_T_s3m5in','measured_T_s3m3in', 'measured_T_s3m1in')
% 
% nthElement = 100;
% % Modeled
% Color = Yellowish;
% 
% %Get rid of the tail end of the dat
% dataset_End = 402;
% %trimmed obseverd 
% t_o_vFlow = measured_vFlow(:,dataset_Start:dataset_End); 
% t_s_Tref = (T_ref+273).*ones(1,length(t_o_vFlow));
% 
% t_o_Tin =  measured_T_HTFin(:,dataset_Start:dataset_End) - 273;
% t_o_Ts3m5in = measured_T_s3m5in(:,dataset_Start:dataset_End) - 273;
% t_o_Ts3m3in = measured_T_s3m3in(:,dataset_Start:dataset_End) - 273;
% t_o_Ts3m1in = measured_T_s3m1in(:,dataset_Start:dataset_End) - 273;
% 
% t_o_Gdn_mod = G_DN_6mods(:,dataset_Start:dataset_End)./6;
% t_o_Egen_mod = measured_Egen_arrayTotal(:,dataset_Start:dataset_End)./6;
% t_o_Gdn_mod23 = G_DN_6mods(:,dataset_Start:dataset_End)./3;
% t_o_Egen_mod23 = measured_Egen_arrayTotal(:,dataset_Start:dataset_End)./3;
%  
% t_o_Qgen6 = 4190 * 974.9 * t_o_vFlow .* (t_o_Ts3m5in - t_o_Tin);
% t_o_Qgen23 = 4190 * 974.9 * t_o_vFlow .* (t_o_Ts3m1in - t_o_Ts3m3in);
% 
% t_o_Qgen = t_o_Qgen23 + t_o_Qgen6;
% t_o_Egen = t_o_Egen_mod + t_o_Egen_mod23; 
% 
% [s_Qgen_mod6] = UQ_Qgen(t_o_vFlow,t_o_Tin,t_o_Ts3m5in);
% [s_Qgen_mod23] = UQ_Qgen(t_o_vFlow,t_o_Ts3m3in,t_o_Ts3m1in);
% s_Qgen = sqrt( (s_Qgen_mod6).^2 + (s_Qgen_mod23).^2);
% 
% [t_o_eta_Cgen6, s_eta_Cgen_mod6] = UQ_eta_Cgen(t_o_Qgen6,s_Qgen_mod6,...
%     t_o_Egen_mod,t_o_Gdn_mod);
% [t_o_eta_Cgen23, s_eta_Cgen_mod23] = UQ_eta_Cgen(t_o_Qgen23,s_Qgen_mod23,...
%     t_o_Egen_mod23,t_o_Gdn_mod23);
% 
% s_eta_Cgen = sqrt((2/3)^2.*(s_eta_Cgen_mod23).^2 + (1/3)^2.*(s_eta_Cgen_mod6).^2);
% t_o_eta_Cgen = (2/3)*t_o_eta_Cgen23 + (1/3)*t_o_eta_Cgen6;
% 
% 
% [s_ex_epsilon_mod6,t_o_epsilon_mod6] = UQ_ex_epsilon(...
%     t_o_vFlow,t_s_Tref,t_o_Tin,t_o_Ts3m5in,t_o_Egen_mod,t_o_Gdn_mod,0.5);
% [s_ex_epsilon_mod23,t_o_epsilon_mod23] = UQ_ex_epsilon(...
%     t_o_vFlow,t_s_Tref,t_o_Ts3m3in,t_o_Ts3m1in,t_o_Egen_mod23,t_o_Gdn_mod23,0.5);
% 
% % Exergy
% s_ex_epsilon =  sqrt( ((1/3)^2).* s_ex_epsilon_mod6.^2  + ((2/3)^2).* s_ex_epsilon_mod23.^2);
% t_o_epsilon = (t_o_epsilon_mod6 + 2.*t_o_epsilon_mod23 )./3;
% 
% % do straight eta_Qgen and eta_Egen
% t_o_eta_Egen = t_o_Egen./(t_o_Gdn_mod+t_o_Gdn_mod23);
% t_o_eta_Qgen = t_o_Qgen./(t_o_Gdn_mod+t_o_Gdn_mod23);
% 
% %error = 0.03.*ones(length(t_o_Tin(1:nthElement:end)'),1);
% error_eta_Cgen = s_eta_Cgen(1:nthElement:end);
% error_ex = s_ex_epsilon(1:nthElement:end);
% 
% error_eta_Cgen_mod23 = s_eta_Cgen_mod23(1:nthElement:end);
% error_ex_mod23 = s_ex_epsilon_mod23(1:nthElement:end);
% 
% error_eta_Cgen_mod6 = s_eta_Cgen_mod6(1:nthElement:end);
% error_ex_mod6 = s_ex_epsilon_mod6(1:nthElement:end);
% 
% %add the zero point
% f=fit(t_o_Tin',t_o_eta_Cgen','poly1');
% x=0:5:100;
% y=f(x);
% 
% 
% % plot(x,y,'LineStyle',':',...
% %     'Color',Grey,...
% %     'LineWidth',3);
% 
% % Graph Stuff
% errorbar(t_o_Tin(1:nthElement:end)',t_o_eta_Cgen(1:nthElement:end)',error_eta_Cgen,...
%     'Marker','square',...
%     'MarkerSize',8,...
%     'LineStyle','none',...
%     'Color',Color,...
%     'MarkerFaceColor','w',...
%     'MarkerEdgeColor',Color,...
%     'DisplayName','19 Mar \eta');
% 
% % errorbar(t_o_Tin(1:nthElement:end)',t_o_epsilon(1:nthElement:end)',error_ex,...
% %     'Marker','square',...
% %     'MarkerSize',8,...
% %     'LineStyle','none',...
% %     'Color',Color,....
% %     'MarkerFaceColor',Color,...
% %     'MarkerEdgeColor',Color,...
% %     'DisplayName','19 Mar \epsilon');
% 
% % errorbar(t_o_Ts3m3in(1:nthElement:end)',t_o_epsilon_mod23(1:nthElement:end)',error_ex_mod23,...
% %     'Marker','o',...
% %     'MarkerSize',8,...
% %     'LineStyle','none',...
% %     'Color',Color,....
% %     'MarkerFaceColor',Color,...
% %     'MarkerEdgeColor',Color,...
% %     'DisplayName','20 Feb \epsilon');
% % 
% % errorbar(t_o_Ts3m3in(1:nthElement:end)',t_o_eta_Cgen23(1:nthElement:end)',error_eta_Cgen_mod23,...
% %     'Marker','o',...
% %     'MarkerSize',8,...
% %     'LineStyle','none',...
% %     'Color',Color,...
% %     'MarkerFaceColor','w',...
% %     'MarkerEdgeColor',Color,...
% %     'DisplayName','20 Feb \eta');
% % 
% % errorbar(t_o_Tin(1:nthElement:end)',t_o_epsilon_mod6(1:nthElement:end)',error_ex_mod6,...
% %     'Marker','o',...
% %     'MarkerSize',8,...
% %     'LineStyle','none',...
% %     'Color',Color,....
% %     'MarkerFaceColor',Color,...
% %     'MarkerEdgeColor',Color,...
% %     'DisplayName','20 Feb \epsilon');
% % 
% % errorbar(t_o_Tin(1:nthElement:end)',t_o_eta_Cgen6(1:nthElement:end)',error_eta_Cgen_mod6,...
% %     'Marker','o',...
% %     'MarkerSize',8,...
% %     'LineStyle','none',...
% %     'Color',Color,...
% %     'MarkerFaceColor','w',...
% %     'MarkerEdgeColor',Color,...
% %     'DisplayName','20 Feb \eta');
% 
% 
% 
% % scatter(t_o_Tin(1:nthElement:end)',t_o_eta(1:nthElement:end)',...
% %     markerSize,'o',...
% %     'MarkerFaceColor','w',...
% %     'MarkerEdgeColor',Color,...
% %     'DisplayName','20 Feb \eta');
% 
% 
% % scatter(t_o_chi',t_o_epsilon_arrayTotal',...
% %     'MarkerFaceColor',Color,...
% %     'MarkerEdgeColor',Color,...
% %     'DisplayName',strcat(...z
% %     day,' \chi vs \epsilon'));
% 
% % x=0:.01:.2;
% % y=f(x);
% 
% % plot(x,y,'LineStyle',':',...
% %     'DisplayName',strcat(day, ' Linear Bestfit'),...
% %     'Color',Color,...
% %     'LineWidth',3);
% 
% %% Plot 23-Mar
% load('ICSolar.ICS_Skeleton_23_Mar_2015_v20180330.mat','chi_arrayTotal',...
%     'dataset_Start','dataset_End','day','measured_T_HTFin',...
%     'measured_T_cavAvg','G_DN_6mods','eta_Cgen_6mods',...
%     'measured_eta_Cgen_arrayTotal','measured_Ex_epsilon','measured_Egen_arrayTotal',...
%     'measured_Qgen_arrayTotal','measured_vFlow','measured_T_HTFout',...
%     'GN_arrayTotal','measured_T_s3m5in','measured_T_s3m3in', 'measured_T_s3m1in')
% 
% 
% nthElement = 80;
% Color = Redish;
% 
% %trimmed obseverd 
% t_o_vFlow = measured_vFlow(:,dataset_Start:dataset_End); 
% t_s_Tref = (T_ref+273).*ones(1,length(t_o_vFlow));
% 
% t_o_Tin =  measured_T_HTFin(:,dataset_Start:dataset_End) - 273;
% t_o_Ts3m5in = measured_T_s3m5in(:,dataset_Start:dataset_End) - 273;
% t_o_Ts3m3in = measured_T_s3m3in(:,dataset_Start:dataset_End) - 273;
% t_o_Ts3m1in = measured_T_s3m1in(:,dataset_Start:dataset_End) - 273;
% 
% t_o_Gdn_mod = G_DN_6mods(:,dataset_Start:dataset_End)./6;
% t_o_Egen_mod = measured_Egen_arrayTotal(:,dataset_Start:dataset_End)./6;
% t_o_Gdn_mod23 = G_DN_6mods(:,dataset_Start:dataset_End)./3;
% t_o_Egen_mod23 = measured_Egen_arrayTotal(:,dataset_Start:dataset_End)./3;
%  
% t_o_Qgen6 = 4190 * 974.9 * t_o_vFlow .* (t_o_Ts3m5in - t_o_Tin);
% t_o_Qgen23 = 4190 * 974.9 * t_o_vFlow .* (t_o_Ts3m1in - t_o_Ts3m3in);
% 
% t_o_Qgen = t_o_Qgen23 + t_o_Qgen6;
% t_o_Egen = t_o_Egen_mod + t_o_Egen_mod23; 
% 
% [s_Qgen_mod6] = UQ_Qgen(t_o_vFlow,t_o_Tin,t_o_Ts3m5in);
% [s_Qgen_mod23] = UQ_Qgen(t_o_vFlow,t_o_Ts3m3in,t_o_Ts3m1in);
% s_Qgen = sqrt( (s_Qgen_mod6).^2 + (s_Qgen_mod23).^2);
% 
% [t_o_eta_Cgen6, s_eta_Cgen_mod6] = UQ_eta_Cgen(t_o_Qgen6,s_Qgen_mod6,...
%     t_o_Egen_mod,t_o_Gdn_mod);
% [t_o_eta_Cgen23, s_eta_Cgen_mod23] = UQ_eta_Cgen(t_o_Qgen23,s_Qgen_mod23,...
%     t_o_Egen_mod23,t_o_Gdn_mod23);
% 
% s_eta_Cgen = sqrt((2/3)^2.*(s_eta_Cgen_mod23).^2 + (1/3)^2.*(s_eta_Cgen_mod6).^2);
% t_o_eta_Cgen = (2/3)*t_o_eta_Cgen23 + (1/3)*t_o_eta_Cgen6;
% 
% 
% [s_ex_epsilon_mod6,t_o_epsilon_mod6] = UQ_ex_epsilon(...
%     t_o_vFlow,t_s_Tref,t_o_Tin,t_o_Ts3m5in,t_o_Egen_mod,t_o_Gdn_mod,0.5);
% [s_ex_epsilon_mod23,t_o_epsilon_mod23] = UQ_ex_epsilon(...
%     t_o_vFlow,t_s_Tref,t_o_Ts3m3in,t_o_Ts3m1in,t_o_Egen_mod23,t_o_Gdn_mod23,0.5);
% 
% 
% % Exergy
% s_ex_epsilon =  sqrt( ((1/3)^2).* s_ex_epsilon_mod6.^2  + ((2/3)^2).* s_ex_epsilon_mod23.^2);
% t_o_epsilon = (t_o_epsilon_mod6 + 2.*t_o_epsilon_mod23 )./3;
% 
% % do straight eta_Qgen and eta_Egen
% t_o_eta_Egen = t_o_Egen./(t_o_Gdn_mod+t_o_Gdn_mod23);
% t_o_eta_Qgen = t_o_Qgen./(t_o_Gdn_mod+t_o_Gdn_mod23);
% 
% %error = 0.03.*ones(length(t_o_Tin(1:nthElement:end)'),1);
% error_eta_Cgen = s_eta_Cgen(1:nthElement:end);
% error_ex = s_ex_epsilon(1:nthElement:end);
% 
% error_eta_Cgen_mod23 = s_eta_Cgen_mod23(1:nthElement:end);
% error_ex_mod23 = s_ex_epsilon_mod23(1:nthElement:end);
% 
% error_eta_Cgen_mod6 = s_eta_Cgen_mod6(1:nthElement:end);
% error_ex_mod6 = s_ex_epsilon_mod6(1:nthElement:end);
% 
% %add the zero point
% f=fit(t_o_Tin',t_o_eta_Cgen','poly1');
% x=0:5:100;
% y=f(x);
% 
% 
% % plot(x,y,'LineStyle',':',...
% %     'Color',Grey,...
% %     'LineWidth',3);
% 
% % Graph Stuff
% errorbar(t_o_Tin(1:nthElement:end)',t_o_eta_Cgen(1:nthElement:end)',error_eta_Cgen,...
%     'Marker','v',...
%     'MarkerSize',8,...
%     'LineStyle','none',...
%     'Color',Color,...
%     'MarkerFaceColor','w',...
%     'MarkerEdgeColor',Color,...
%     'DisplayName','23 Mar \eta');
% 
% % errorbar(t_o_Tin(1:nthElement:end)',t_o_epsilon(1:nthElement:end)',error_ex,...
% %     'Marker','v',...
% %     'MarkerSize',8,...
% %     'LineStyle','none',...
% %     'Color',Color,....
% %     'MarkerFaceColor',Color,...
% %     'MarkerEdgeColor',Color,...
% %     'DisplayName','23 Mar \epsilon');
% 
% % errorbar(t_o_Ts3m3in(1:nthElement:end)',t_o_epsilon_mod23(1:nthElement:end)',error_ex_mod23,...
% %     'Marker','o',...
% %     'MarkerSize',8,...
% %     'LineStyle','none',...
% %     'Color',Color,....
% %     'MarkerFaceColor',Color,...
% %     'MarkerEdgeColor',Color,...
% %     'DisplayName','20 Feb \epsilon');
% % 
% % errorbar(t_o_Ts3m3in(1:nthElement:end)',t_o_eta_Cgen23(1:nthElement:end)',error_eta_Cgen_mod23,...
% %     'Marker','o',...
% %     'MarkerSize',8,...
% %     'LineStyle','none',...
% %     'Color',Color,...
% %     'MarkerFaceColor','w',...
% %     'MarkerEdgeColor',Color,...
% %     'DisplayName','20 Feb \eta');
% % 
% % errorbar(t_o_Tin(1:nthElement:end)',t_o_epsilon_mod6(1:nthElement:end)',error_ex_mod6,...
% %     'Marker','o',...
% %     'MarkerSize',8,...
% %     'LineStyle','none',...
% %     'Color',Color,....
% %     'MarkerFaceColor',Color,...
% %     'MarkerEdgeColor',Color,...
% %     'DisplayName','20 Feb \epsilon');
% % 
% % errorbar(t_o_Tin(1:nthElement:end)',t_o_eta_Cgen6(1:nthElement:end)',error_eta_Cgen_mod6,...
% %     'Marker','o',...
% %     'MarkerSize',8,...
% %     'LineStyle','none',...
% %     'Color',Color,...
% %     'MarkerFaceColor','w',...
% %     'MarkerEdgeColor',Color,...
% %     'DisplayName','20 Feb \eta');
% 
% 
% 
% % scatter(t_o_Tin(1:nthElement:end)',t_o_eta(1:nthElement:end)',...
% %     markerSize,'o',...
% %     'MarkerFaceColor','w',...
% %     'MarkerEdgeColor',Color,...
% %     'DisplayName','20 Feb \eta');
% 
% 
% % scatter(t_o_chi',t_o_epsilon_arrayTotal',...
% %     'MarkerFaceColor',Color,...
% %     'MarkerEdgeColor',Color,...
% %     'DisplayName',strcat(...z
% %     day,' \chi vs \epsilon'));
% 
% % x=0:.01:.2;
% % y=f(x);
% 
% % plot(x,y,'LineStyle',':',...
% %     'DisplayName',strcat(day, ' Linear Bestfit'),...
% %     'Color',Color,...
% %     'LineWidth',3);

%% Legending
legend('show');
set(legend,'FontName','Arial Narrow',...
    'Location','southoutside',...
    'Orientation','vertical');

%% save file
% % filename = 'etas vs T_HTFin - Whole Array for 3 datasets';
% % savefig(filename);
% % print(filename,'-dpng');
% 
 %% fin
 
hold(axes1,'off');
