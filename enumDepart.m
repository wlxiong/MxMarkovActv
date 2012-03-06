function [these_util passengers0 flows0] = enumDepart(THE, ALP, population0, num_act_util, T)
% this function simply enumerate all the possible departure times
% time 13:00 -- 23:59
% 1: home, 2:work
theta = THE;
alpha = ALP;
act_util = num_act_util;
times = int32(T);
passengers0 = zeros(12,2);
these_util = zeros(11,1);

for t = 1:11
    if t == 1
        total_act_util = act_util(t,2) + sum(act_util(t+times(2,1,t)+1:12,1));
    elseif t+times(2,1,t)+1 >= 13
		total_act_util = sum(act_util(1:t,2));
    else
        total_act_util = sum(act_util(1:t,2)) + sum(act_util(t+times(2,1,t)+1:12,1));
    end
    travel_disutil = alpha * times(2,1,t);
    these_util(t) = total_act_util - travel_disutil;
end
diff_util = theta*(these_util);
prob = exp(diff_util)./sum(exp(diff_util));
passengers0(1,2) = population0;
flows0 = passengers0(1,2).*prob;
for t = 2:12
    passengers0(t,2) = passengers0(t-1,2) - flows0(t-1);
	if t+times(2,1,t)+1 <= 12
		passengers0(t+times(2,1,t)+1,1) = passengers0(t+times(2,1,t)+1,1) + flows0(t);
	end
    passengers0(t,1) = passengers0(t,1) + passengers0(t-1,1);
end
% save sym_results0 flows0 passengers0 these_util
disp('enumeration')
disp('utility')
disp(these_util)
disp('flows')
disp(flows0)
disp('passengers')
disp(passengers0)
% figure
% hold on
% plot(flows0, '--')
% plot(passengers0)
