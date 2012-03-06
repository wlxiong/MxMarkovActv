function [opt_util passengers1 flows1] = stochActivity(THE, ALP, DISC, population0, num_act_util, T)
% this is an implementation of the MDP model for departure time choice
% time 13:00 -- 23:59
% 1: home, 2:work
theta = THE;
alpha = ALP;
act_util = num_act_util;
times = T;
opt_util = NaN(13,2);
opt_util(13,1) = 0.0;
passengers1 = zeros(13,2);
passengers1(1,2) = population0;
flows1 = zeros(12,2,2);
this_util = [0,0];
discount = DISC;

for t = 12:-1:1
    for s = 1:2
        opt_util(t,s) = 0;
        for a = 1:2
            if a<=s && t+int32(times(s,a,t))+1<=13
                if ~isnan(opt_util(t+int32(times(s,a,t))+1,a))
                    this_util(a) = theta*(act_util(t,s) - ...
                        alpha*times(s,a,t) + discount*opt_util(t+times(s,a,t)+1,a) );
                    opt_util(t,s) = opt_util(t,s) + exp(this_util(a));
                end
            end
        end
        if opt_util(t,s) ~= 0
            opt_util(t,s) = log(opt_util(t,s) )/theta;
        else
            opt_util(t,s) = NaN;
        end
    end
end

for t = 1:12
    for s = 1:2
        for a = 1:2
            if a<=s && t+times(s,a,t)+1<=13
                if ~isnan(opt_util(t+int32(times(s,a,t))+1,a))
                    this_util(a) = theta*(act_util(t,s) - ...
                        alpha*times(s,a,t) + discount*opt_util(t+times(s,a,t)+1,a));
                    flows1(t,s,a) = exp(this_util(a) ) / exp(opt_util(t,s)*theta );
                end
            end
        end
        for a = 1:2
            if a<=s && t+times(s,a,t)+1<=13
                if ~isnan(opt_util(t+int32(times(s,a,t))+1,a))
                    flows1(t,s,a) = passengers1(t,s)*flows1(t,s,a);
                    passengers1(t+times(s,a,t)+1,a) = ...
                        passengers1(t+times(s,a,t)+1,a) + flows1(t,s,a);
                end
            end
        end
    end
end

save MDP_results1 flows1 passengers1 opt_util

disp('dynamic programming')
disp('optimal utilty')
disp(opt_util)
disp('flows')
disp(flows1)
disp('passengers')
disp(passengers1)

% figure
% hold on
% plot(flows1(:,2,1), '--')
% plot(passengers1)