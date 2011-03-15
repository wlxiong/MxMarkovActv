function [num_opt_util num_passengers1 num_flows1] = stochActivity(THE, ALP, DISC, population0, U, num_act_util, T)
% time 13:00 -- 23:59
% 1: home, 2:work
theta = sym(THE);
alpha = sym(ALP);
act_util = sym(U);
times = sym(T);
% time = T;
opt_util = sym(-ones(13,2));
opt_util(13,1) = sym(0);
passengers1 = sym(zeros(13,2));
passengers1(1,2) = sym(population0);
flows1 = sym(zeros(12,2,2));
this_util = sym([0,0]);
discount = sym(DISC);

for t = 12:-1:1
    for s = 1:2
        opt_util(t,s) = 0;
        for a = 1:2
            if a<=s && t+int32(times(s,a,t))+1<=13
                if opt_util(t+int32(times(s,a,t))+1,a) ~= sym(-1)
                    this_util(a) = theta*(act_util(t,s) - ...
                        alpha*times(s,a,t) + discount*opt_util(t+int32(times(s,a,t))+1,a) );
                    opt_util(t,s) = opt_util(t,s) + exp(this_util(a));
                end
            end
        end
        if opt_util(t,s) ~= 0
            opt_util(t,s) = log(opt_util(t,s) )/theta;
        else
            opt_util(t,s) = sym(-1);
        end
    end
end

for t = 1:12
    for s = 1:2
        for a = 1:2
            if a<=s && t+int32(times(s,a,t))+1<=13
                if opt_util(t+int32(times(s,a,t))+1,a) ~= sym(-1)
                    this_util(a) = theta*(act_util(t,s) - ...
                        alpha*times(s,a,t) + discount*opt_util(t+int32(times(s,a,t))+1,a));
                    flows1(t,s,a) = exp(this_util(a) ) / exp(opt_util(t,s)*theta );
                end
            end
        end
        for a = 1:2
            if a<=s && t+int32(times(s,a,t))+1<=13
                if opt_util(t+int32(times(s,a,t))+1,a) ~= sym(-1)
                    flows1(t,s,a) = passengers1(t,s)*flows1(t,s,a);
                    passengers1(t+times(s,a,t)+1,a) = ...
                        passengers1(t+times(s,a,t)+1,a) + flows1(t,s,a);
                end
            end
        end
    end
end

num_flows1 = zeros(12,2,2);
for t = 1:12
    for s = 1:2
        for a = 1:2
            num_flows1(t,s,a) = subs(flows1(t,s,a), act_util, num_act_util);
        end
    end
end
num_passengers1 = zeros(13,2);
for t = 1:13
    for s = 1:2
        num_passengers1(t,s) = subs(passengers1(t,s), act_util, num_act_util);
    end
end
num_opt_util = -ones(13,2);
for t = 1:13
    for s = 1:2
        if opt_util(t,s) == sym(-1)
            num_opt_util(t,s) = -inf;
        else
            num_opt_util(t,s) = subs(opt_util(t,s), act_util, num_act_util);
        end
    end
end
save sym_results1 flows1 passengers1 opt_util

disp('dynamic programming')
disp('optimal utilty')
disp(num_opt_util)
disp('flows')
disp(num_flows1)
disp('passengers')
disp(num_passengers1)

% figure
% hold on
% plot(flows1(:,2,1), '--')
% plot(passengers1)