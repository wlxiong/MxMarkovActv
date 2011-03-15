function [num_these_util num_passengers0 num_flows0] = enumDepart(THE, ALP, population0, U, num_act_util, T)
% time 13:00 -- 23:59
% 1: home, 2:work
theta = sym(THE);
alpha = sym(ALP);
act_util = sym(U);
times = sym(T);
passengers0 = sym(zeros(13,2));
passengers0(1,2) = sym(population0);
flows0 = sym(zeros(12,1));
these_util = sym(zeros(11,1));

for t = 1:11
    if t == 1
        total_act_util = act_util(1:t,2) + sum(act_util(t+times(2,1,t)+1:12,1));
    elseif t+times(2,1,t)+1 == 12
		total_act_util = sum(act_util(1:t,2)) + act_util(t+times(2,1,t)+1:12,1);
    elseif t+times(2,1,t)+1>12
        total_act_util = sum(act_util(1:t,2));
    else
        total_act_util = sum(act_util(1:t,2)) + sum(act_util(t+times(2,1,t)+1:12,1));
    end
    travel_disutil = alpha * times(2,1,t);
    these_util(t) = total_act_util - travel_disutil;
end
diff_util = theta*(these_util);
prob = exp(diff_util(1:11))./sum(exp(diff_util(1:11)));
flows0(1:11) = passengers0(1,2).*prob;
passengers0(1+times(2,1,1)+1,1) = flows0(1);
passengers0(1+1,2) = passengers0(1,2) - flows0(1);
for t = 2:11
    passengers0(t+times(2,1,t)+1,1) = sum(flows0(1:t));
    passengers0(t+1,2) = passengers0(t,2) - flows0(t);
end
for t = 2:13
    if passengers0(t,1) == 0
        passengers0(t,1) = passengers0(t-1,1);
    end
end

num_flows0 = zeros(12,1);
for t = 1:12
    num_flows0(t) = subs(flows0(t), act_util, num_act_util);
end
num_passengers0 = zeros(13,2);
for t = 1:13
    for s = 1:2
        num_passengers0(t,s) = subs(passengers0(t,s), act_util, num_act_util);
    end
end
num_these_util = zeros(11,1);
for t = 1:11
	num_these_util(t) = subs(these_util(t), act_util, num_act_util);
end
save sym_results0 flows0 passengers0 these_util

disp('enumeration')
disp('utility')
disp(num_these_util)
disp('flows')
disp(num_flows0)
disp('passengers')
disp(num_passengers0)
% figure
% hold on
% plot(flows0, '--')
% plot(passengers0)
