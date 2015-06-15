
figure('Color',[1 1 1]);
hold on;


title({'\chi vs \epsilon','Measured Total Array'},'FontName','Arial Narrow');
xlabel('\chi_{combined} = (T_{HTF,in} - T_{cav}) / (G_{DN} / 12 modules * A_{POE})','FontName','Arial Narrow');
set(gca,'XGrid','on');
ylabel('\epsilon = Ex_{Array Total} / (G_{DN Array Total} * \psi_{solar})','FontName','Arial Narrow');
set(gca,'YGrid','on');
axis([0 0.14 0 0.8]);


%Plot 20-Feb
load('ICSolar.ICS_Skeleton_20_Feb_2015.mat','chi_arrayTotal',...
    'measured_Ex_epsilon','Start','End','day');

%trimmed obseverd chi and epsilon
t_o_chi = chi_arrayTotal(:,Start:End);
t_o_epsilon_arrayTotal = measured_Ex_epsilon(:,Start:End);

%need to transpose in order to scatter plot
chi_trans = transpose(t_o_chi);
Ex_epsilon_trans = transpose(t_o_epsilon_arrayTotal);

f=fit(chi_trans,Ex_epsilon_trans,'poly1');

scatter(chi_trans,Ex_epsilon_trans,'MarkerFaceColor','blue','Marker','.','DisplayName',strcat(...
    day,' \chi vs \epsilon'));

x=0:.01:.2;
y=f(x);

plot(x,y,'LineStyle',':','DisplayName',strcat(day, ' Linear Bestfit'),'Color','blue');



%Plot 19-Mar

load('ICSolar.ICS_Skeleton_19_Mar_2015.mat','chi_arrayTotal',...
    'measured_Ex_epsilon','Start','End','day');

%trimmed obseverd chi and epsilon
t_o_chi = chi_arrayTotal(:,Start:End);
t_o_epsilon_arrayTotal = measured_Ex_epsilon(:,Start:End);

%need to transpose in order to scatter plot
chi_trans = transpose(t_o_chi);
Ex_epsilon_trans = transpose(t_o_epsilon_arrayTotal);

f=fit(chi_trans,Ex_epsilon_trans,'poly1');

scatter(chi_trans,Ex_epsilon_trans,'Marker','.','DisplayName',strcat(...
    day,' \chi vs \epsilon'));

x=0:.01:.2;
y=f(x);

plot(x,y,'LineStyle',':','DisplayName',strcat(day, ' Linear Bestfit'),'Color',[0 0.5 0]);





%Plot 23-Mar

load('ICSolar.ICS_Skeleton_23_Mar_2015.mat','chi_arrayTotal',...
    'measured_Ex_epsilon','Start','End','day');

%trimmed obseverd chi and epsilon
t_o_chi = chi_arrayTotal(:,Start:End);
t_o_epsilon_arrayTotal = measured_Ex_epsilon(:,Start:End);

%need to transpose in order to scatter plot
chi_trans = transpose(t_o_chi);
Ex_epsilon_trans = transpose(t_o_epsilon_arrayTotal);

f=fit(chi_trans,Ex_epsilon_trans,'poly1');

scatter(chi_trans,Ex_epsilon_trans,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0],...
    'Marker','.','DisplayName',strcat(...
    day,' \chi vs \epsilon'));

x=0:.01:.2;
y=f(x);

plot(x,y,'LineStyle',':','DisplayName',strcat(day, ' Linear Bestfit'),...
    'Color',[1 0 0]);




legend('show');
set(legend,'FontName','Arial Narrow');

filename = 'Chi vs Epsilon - Whole Array for 3 datasets' 
savefig(filename);
