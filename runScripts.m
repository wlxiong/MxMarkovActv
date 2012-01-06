close all
figure
% [util0 png0 flow0]= enumDepart(.1, 5.0, 1000, act_util, num_act_util, times);
[util1 png1 flow1]= stochActivity(.1, 5.0, 1.0, 1000, act_util, num_act_util, times);
plotOptUtil(util1(1:12,:))
[util1 png1 flow1]= stochActivity(.1, 5.0, 0.9, 1000, act_util, num_act_util, times);
plotOptUtil(util1(1:12,:))
[util1 png1 flow1]= stochActivity(.1, 5.0, 0.8, 1000, act_util, num_act_util, times);
plotOptUtil(util1(1:12,:))
% [util1 png1 flow1]= stochActivity(.1, 5.0, 0.5, 1000, act_util, num_act_util, times);
% plotOptUtil(util1(1:12,:))
% [util1 png1 flow1]= stochActivity(.1, 5.0, 0.1, 1000, act_util, num_act_util, times);
% plotOptUtil(util1(1:12,:))
[util1 png1 flow1]= stochActivity(.1, 5.0, 0.0, 1000, act_util, num_act_util, times);
plotOptUtil(util1(1:12,:))

plotActUtil(num_act_util, times, 5.0)
% plotUtilBar(num_act_util, times, 5.0)
% plotPassenger(png0(1:12,:), flow0)
% plotPassenger(png1(1:12,:), flow1(:,2,1))

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
