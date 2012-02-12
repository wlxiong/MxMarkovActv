[util0 png0 flow0]= enumDepart(0.1, 5.0, 1000, num_act_util, times);
% mplot(util0)
plotAllUtil(util0)
export_fig('over_all_util', '-pdf')
plotActUtil(num_act_util, times, 5.0)
export_fig('marginal_util', '-pdf')
plotPassenger(png0)
export_fig('traffic_flow', '-pdf')
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
