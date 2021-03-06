% What to run
%win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\'
%system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar.mos.'])
%omimport(modelname, saveName)

cd 'C:\Users\Justin\Documents\GitHub\RPI_CASE_ICS_Modelica\Archive\Modelica Scirpting'

clear

%SOUTH
%Roof tilted 60 degrees (0 being vertical)
display('South, 60 degrees')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_S60.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_S60Tilt.mat');

clear

%South, Vertical
display('South, vertical')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_S0.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_S0Tilt.mat');

clear


%South, 20 degrees
display('South, 20 degrees')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_S20.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_S20Tilt.mat');

clear


%South, 45 degrees
display('South, 45 degrees')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_S45.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_S45Tilt.mat');

clear


%Roof Horizontal
display('South, Horizontal')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_S90.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_S90Tilt.mat');

clear


%WEST West, Vertical
display('West, vertical')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_W0.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_W0Tilt.mat');

clear

%West, 20 degree tilt
display('West, 20 degrees')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_W20.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_W20Tilt.mat');

clear

%West, 45 degree tilt
display('West, 45 degrees')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_W45.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_W45Tilt.mat');

clear

%EAST East, Vertical
display('East, vertical')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_E0.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_E0Tilt.mat');

clear

%East, 20 degree tilt
display('East, 20 degrees')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_E20.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_E20Tilt.mat');

clear

%East, 45 degree tilt
display('East, 45 degrees')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_E45.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_E45Tilt.mat');

clear

%SOUTHWEST Southwest, Vertical
display('Southwest, vertical')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_SW0.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_SW0Tilt.mat');

clear

%Southwest, 20 degree tilt
display('Southwest, 20 degrees')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_SW20.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_SW20Tilt.mat');

clear

%Southwest, 45 degree tilt
display('Southwest, 45 degrees')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_SW45.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_SW45Tilt.mat');

clear


%SOUTHEAST Southeast, Vertical
display('Southeast, vertical')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_SE0.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_SE0Tilt.mat');

clear

%Southeast, 20 degree tilt
display('Southeast, 20 degrees')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_SE20.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_SE20Tilt.mat');

clear

%Southeast, 45 degree tilt
display('Southeast, 45 degrees')
win_om_path = 'C:\OpenModelica1.9.1Beta2\bin\';
system([win_om_path,'omc.exe +d=failtrace +s simulate-ICSolar_SE45.mos.']);
omimport('ICSolar.ICS_Skeleton');
save('NYC_SE45Tilt.mat');

clear

