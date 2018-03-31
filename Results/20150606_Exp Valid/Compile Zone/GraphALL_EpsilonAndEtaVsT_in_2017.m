clear all;

Blueish = [0 0.45 0.74];
Yellowish = [0.75 0.75 0];
Redish = [0.85 0.33 0.1];
Grey = [.5 .5 .5];

nthElement = 50;
markerSize = 100;


T_ref = 20; % (c)



ffigure = figure('Color',[1 1 1]);
hold on;

% title({'\chi vs \epsilon','Measured Total Array'},...
%     'FontSize',18,...
%     'FontName','Arial Narrow');

xlabel(strcat('T_{HTF,in}',sprintf('(%cC)',char(176))),...
    'FontName','Arial Narrow',...
     'FontSize',22,...
    'FontWeight','bold');
set(gca,'XGrid','on',...
    'FontName','arial narrow',...
    'FontSize',18,...
    'FontWeight','bold');

ylabel('\epsilon_{Cogen} and \eta_{Cogen}',...
    'FontName','Arial Narrow',...
    'FontSize',26,...
    'FontWeight','bold');
set(gca,'YGrid','on',...
    'FontName','arial narrow',...
    'FontSize',18,...
    'FontWeight','bold');

axis([50 90 0 0.8]);


%% Plot Feb 20th
load('ICSolar.ICS_Skeleton_20_Feb_2015_v5.mat','chi_arrayTotal',...
    'Start','End','day','measured_T_HTFin',...
    'measured_T_cavAvg','G_DN_6mods','eta_Cgen_6mods',...
    'measured_eta_Cgen_arrayTotal','measured_Ex_epsilon','measured_Egen_arrayTotal',...
    'measured_Qgen_arrayTotal','measured_vFlow','measured_T_HTFout',...
    'GN_arrayTotal');
% taken out: 'Ex_epsilon_Cgen_6mods',

% Modeled
Color = Grey;

% Modeled Extropaltated Ex Epsilon Array total 
% T_HTFin = [40 50 60 75 85];
% predict_eps = [0.1425 0.146 0.1477 0.146 0.1425];
T_HTFin = [350-273 300-273 325-273 375-273];
predict_eps = [0.1492 0.1414 .152 .1355];

%20171222 f=fit(T_HTFin',predict_eps','poly2');
x = 0:5:100;
%20171222 y=f(x);
%20171222 indexmax = find(max(y) == y);
%20171222 xmax = x(indexmax);
%20171222 ymax = y(indexmax);
y = 0:0.1:1;

x = -pi:.1:pi;
y = sin(x);
plot(x,y)

% plot(x,y,'DisplayName','Extrapolated Modeled Results','Color',Color,'LineWidth',3);
% taken out: 'LineStyle',':',

Color = Blueish;

%trimmed obseverd chi and epsilon
t_o_Gdn = G_DN_6mods(:,Start:End);
t_o_epsilon = measured_Ex_epsilon(:,Start:End); % assumes Tcav as ref
t_o_Tin =  measured_T_HTFin(:,Start:End) - 273;
t_o_Tcav = measured_T_cavAvg(:,Start:End);
t_s_Tref = (T_ref+273).*ones(1,length(t_o_Tcav));
t_o_eta = measured_eta_Cgen_arrayTotal(:,Start:End);
t_o_Egen = measured_Egen_arrayTotal(:,Start:End);
t_o_Qgen = measured_Qgen_arrayTotal(:,Start:End); 
t_o_vFlow = measured_vFlow(:,Start:End); 
t_o_Tout = measured_T_HTFout(:,Start:End) - 273; 

%trimmed simulated
t_s_Gdn = GN_arrayTotal(:,Start:End);

s_Qgen = UQ_Qgen(t_o_vFlow,t_o_Tin,t_o_Tout);
s_eta_Cgen = UQ_eta_Cgen(t_o_Qgen,s_Qgen,t_o_Egen,t_s_Gdn);
% Returns based on fixed T ref
[s_ex_epsilon,t_o_epsilon] = UQ_ex_epsilon(t_o_vFlow,t_s_Tref,t_o_Tin,...
    t_o_Tout,t_o_Egen,t_s_Gdn,0.5);
%error = 0.03.*ones(length(t_o_Tin(1:nthElement:end)'),1);
error_eta = s_eta_Cgen(1:nthElement:end);
error_ex = s_ex_epsilon(1:nthElement:end);


%add the zero point
f=fit(t_o_Tin',t_o_eta','poly1');
x=0:5:100;
y=f(x);


% plot(x,y,'LineStyle',':',...
%     'Color',Grey,...
%     'LineWidth',3);

% Graph Stuff
errorbar(t_o_Tin(1:nthElement:end)',t_o_epsilon(1:nthElement:end)',error_ex,...
    'Marker','o',...
    'MarkerSize',8,...
    'LineStyle','none',...
    'Color',Color,....
    'MarkerFaceColor',Color,...
    'MarkerEdgeColor',Color,...
    'DisplayName','20 Feb \epsilon');

% scatter(t_o_Tin(1:nthElement:end)',t_o_eta(1:nthElement:end)',...
%     markerSize,'o',...
%     'MarkerFaceColor','w',...
%     'MarkerEdgeColor',Color,...
%     'DisplayName','20 Feb \eta');

errorbar(t_o_Tin(1:nthElement:end)',t_o_eta(1:nthElement:end)',error_eta,...
    'Marker','o',...
    'MarkerSize',8,...
    'LineStyle','none',...
    'Color',Color,...
    'MarkerFaceColor','w',...
    'MarkerEdgeColor',Color,...
    'DisplayName','20 Feb \eta');


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
load('ICSolar.ICS_Skeleton_19_Mar_2015_v5.mat','chi_arrayTotal',...
    'Ex_epsilon_Cgen_6mods','Start','End','day','measured_T_HTFin',...
    'measured_T_cavAvg','G_DN_6mods','eta_Cgen_6mods',...
    'measured_eta_Cgen_arrayTotal','measured_Ex_epsilon','measured_Egen_arrayTotal',...
    'measured_Qgen_arrayTotal','measured_vFlow','measured_T_HTFout',...
    'GN_arrayTotal');
nthElement = 50;
% Modeled
Color = Yellowish;

%Get rid of the tail end of the dat
End = 402;

%trimmed obseverd chi and epsilon
t_o_Gdn = G_DN_6mods(:,Start:End);
t_o_epsilon = measured_Ex_epsilon(:,Start:End);
t_o_Tin =  measured_T_HTFin(:,Start:End) - 273;
t_o_Tcav = measured_T_cavAvg(:,Start:End);
t_s_Tref = (T_ref+273).*ones(1,length(t_o_Tcav));
t_o_eta = measured_eta_Cgen_arrayTotal(:,Start:End);
t_o_Egen = measured_Egen_arrayTotal(:,Start:End);
t_o_Qgen = measured_Qgen_arrayTotal(:,Start:End); 
t_o_vFlow = measured_vFlow(:,Start:End); 
t_o_Tout = measured_T_HTFout(:,Start:End) - 273; 
%trimmed simulated
t_s_Gdn = GN_arrayTotal(:,Start:End);

% trim the bad data point
% t_o_Gdn(19) = [];
% t_o_epsilon 
% t_o_Tin(19) = [];
% t_o_chi(19) = [];
% t_o_epsilon(19) = [];


% t_o_chi = [t_o_chi 0];
% t_o_epsilon_arrayTotal = [t_o_epsilon_arrayTotal 0.138];

%need to transpose in order to scatter plot

s_Qgen = UQ_Qgen(t_o_vFlow,t_o_Tin,t_o_Tout);
s_eta_Cgen = UQ_eta_Cgen(t_o_Qgen,s_Qgen,t_o_Egen,t_s_Gdn);
% Returns based on fixed T ref
[s_ex_epsilon,t_o_epsilon] = UQ_ex_epsilon(t_o_vFlow,t_s_Tref,t_o_Tin,...
    t_o_Tout,t_o_Egen,t_s_Gdn,0.5);
%error = 0.03.*ones(length(t_o_Tin(1:nthElement:end)'),1);

t_o_eta=t_o_eta(1:nthElement:end);
t_o_epsilon = t_o_epsilon(1:nthElement:end);
t_o_Tin = t_o_Tin(1:nthElement:end);

[a,max_eta] = max(t_o_eta);
[b,min_eta] = min(t_o_eta);
error_eta = s_eta_Cgen([min_eta max_eta])';
[a,max_ex] = max(t_o_epsilon);
[b,min_ex] = min(t_o_epsilon);
error_ex = s_ex_epsilon([min_ex max_ex])';

scatter(t_o_Tin',t_o_epsilon',...
     markerSize,'o',...
    'MarkerFaceColor',Color,...
    'MarkerEdgeColor',Color,...
    'Marker','square',...
    'DisplayName','19 Mar \epsilon');

scatter(t_o_Tin',t_o_eta',...
     markerSize,'o',...
    'MarkerFaceColor','w',...
    'MarkerEdgeColor',Color,...
    'Marker','square',...
    'DisplayName','19 Mar \eta');

errorbar(t_o_Tin([min_eta max_eta])',t_o_eta([min_eta max_eta])',error_eta,...
    'MarkerSize',10,...
    'LineStyle','none',...
    'Color',Color,....
    'MarkerFaceColor','w',...
    'MarkerEdgeColor',Color,...
    'Marker','square')

errorbar(t_o_Tin([min_ex max_ex])',t_o_epsilon([min_ex max_ex])',error_ex,...
    'MarkerSize',10,...
    'LineStyle','none',...
    'Color',Color,....
    'MarkerFaceColor',Color,...
    'MarkerEdgeColor',Color,...
    'Marker','square')

x=0:.01:.2;
y=f(x);

% plot(x,y,'LineStyle',':',...
%     'DisplayName',strcat(day, ' Linear Bestfit'),...
%     'Color',Color,...
%     'LineWidth',3);

%% Plot 23-Mar
load('ICSolar.ICS_Skeleton_23_Mar_2015_v5.mat','chi_arrayTotal',...
    'Ex_epsilon_Cgen_6mods','Start','End','day','measured_T_HTFin',...
    'measured_T_cavAvg','G_DN_6mods','eta_Cgen_6mods',...
    'measured_eta_Cgen_arrayTotal','measured_Ex_epsilon','measured_Egen_arrayTotal',...
    'measured_Qgen_arrayTotal','measured_vFlow','measured_T_HTFout',...
    'GN_arrayTotal');

nthElement = 80;
Color = Redish;

%trimmed obseverd chi and epsilon
t_o_Gdn = G_DN_6mods(:,Start:End);
t_o_epsilon = measured_Ex_epsilon(:,Start:End);
t_o_Tin =  measured_T_HTFin(:,Start:End) - 273;
t_o_Tcav = measured_T_cavAvg(:,Start:End);
t_s_Tref = (T_ref+273).*ones(1,length(t_o_Tcav));
t_o_eta = measured_eta_Cgen_arrayTotal(:,Start:End);
t_o_Egen = measured_Egen_arrayTotal(:,Start:End);
t_o_Qgen = measured_Qgen_arrayTotal(:,Start:End); 
t_o_vFlow = measured_vFlow(:,Start:End); 
t_o_Tout = measured_T_HTFout(:,Start:End) - 273; 
%trimmed simulated
t_s_Gdn = GN_arrayTotal(:,Start:End);



s_Qgen = UQ_Qgen(t_o_vFlow,t_o_Tin,t_o_Tout);
s_eta_Cgen = UQ_eta_Cgen(t_o_Qgen,s_Qgen,t_o_Egen,t_s_Gdn);
% Returns based on fixed T ref
[s_ex_epsilon,t_o_epsilon] = UQ_ex_epsilon(t_o_vFlow,t_s_Tref,t_o_Tin,...
    t_o_Tout,t_o_Egen,t_s_Gdn,0.5);
%error = 0.03.*ones(length(t_o_Tin(1:nthElement:end)'),1);

t_o_eta=t_o_eta(1:nthElement:end);
t_o_epsilon = t_o_epsilon(1:nthElement:end);
t_o_Tin = t_o_Tin(1:nthElement:end);


[a,max_eta] = max(t_o_eta);
[b,min_eta] = min(t_o_eta);
error_eta = s_eta_Cgen([min_eta max_eta])';
[a,max_ex] = max(t_o_epsilon);
[b,min_ex] = min(t_o_epsilon);
error_ex = s_ex_epsilon([min_ex max_ex])';


scatter(t_o_Tin',t_o_epsilon',...
    markerSize,...
    'MarkerFaceColor',Color,...
    'MarkerEdgeColor',Color,...
    'Marker','v',...
    'DisplayName','23 Mar \epsilon');

scatter(t_o_Tin',t_o_eta',...
    markerSize,'o',...
    'MarkerFaceColor','w',...
    'MarkerEdgeColor',Color,...
    'Marker','v',...
    'DisplayName','23 Mar \eta');

errorbar(t_o_Tin([min_eta max_eta])',t_o_eta([min_eta max_eta])',error_eta,...
    'MarkerSize',10,...
    'LineStyle','none',...
    'Color',Color,....
    'MarkerFaceColor','w',...
    'MarkerEdgeColor',Color,...
    'Marker','v')

errorbar(t_o_Tin([min_ex max_ex])',t_o_epsilon([min_ex max_ex])',error_ex,...
    'MarkerSize',10,...
    'LineStyle','none',...
    'Color',Color,....
    'MarkerFaceColor',Color,...
    'MarkerEdgeColor',Color,...
    'Marker','v')



% x=0:.01:.2;
% y=f(x);
% 
% plot(x,y,'LineStyle',':',...
%     'DisplayName',strcat(day, ' Linear Bestfit'),...
%     'Color',Color,...
%     'LineWidth',3);


%3 ml/s
predict_chi = [0, 0.086, 0.17];
predict_eps = [0.1324, 0.1485, 0.123];


f=fit(predict_chi',predict_eps','poly2');
x=0:.01:.2;
y=f(x);

% plot(x,y,'LineStyle','--',...
%     'DisplayName','3 ml/s Fit',...
%     'Color',Color,...
%     'LineWidth',3);

legend('show');
set(legend,'FontName','Arial Narrow',...
    'Location','southoutside',...
    'Orientation','horizontal');

filename = 'Chi vs Epsilon - Whole Array for 3 datasets';
savefig(filename);
print(filename,'-dpng');