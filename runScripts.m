clear
load mix_inputs

[util1 png1 flow1] = stochActivity(.1, 5.0, 1.0, 1000, num_act_util, times);
plotOptUtil(util1(1:12,:))
export_fig('exp_max_util', '-pdf')
plotPassenger(png1)
export_fig('traffic_flow1', '-pdf')

[util0 png0 flow0] = enumDepart(0.1, 5.0, 1000, num_act_util, times);
plotAllUtil(util0)
export_fig('over_all_util', '-pdf')
plotActUtil(num_act_util, times)
export_fig('cumm_util', '-pdf')
plotPassenger(png0)
export_fig('traffic_flow0', '-pdf')

% act_util =[
%    10.0000   20.0000
%    10.0000   20.0000
%    10.0000   20.0000
%    10.0000   20.0000
%    12.5000   18.0000
%    15.0000   16.0000
%    17.5000   14.0000
%    20.0000   12.0000
%    20.0000   10.0000
%    20.0000   10.0000
%    20.0000   10.0000
%    20.0000   10.0000
%    ];
% times = [0, 1; 1, 0];
% times(:,:,2) = [0, 1; 1, 0];
% times(:,:,3) = [0, 1; 1, 0];
% times(:,:,4) = [0, 1; 1, 0];
% times(:,:,5) = [0, 1; 1, 0];
% times(:,:,6) = [0, 2; 2, 0];
% times(:,:,7) = [0, 2; 2, 0];
% times(:,:,8) = [0, 2; 2, 0];
% times(:,:,9) = [0, 1; 1, 0];
% times(:,:,10) = [0, 1; 1, 0];
% times(:,:,11) = [0, 1; 1, 0];
% times(:,:,12) = [0, 1; 1, 0];
