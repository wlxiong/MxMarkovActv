function plotActUtil(act_util, times, alpha)
tt=times(2,1,:);
% plot activity utility
figure
box on

subplot(2,1,1)
grid on
hold on
x = genTimes(13, 12+size(act_util,1));
colors = lines(2);
plot(x, act_util(:,1),...
    'LineStyle', ':', ...
    'Marker', '^', ...
    'Color', colors(1,:), ...
    'MarkerFaceColor', colors(1,:));
plot(x, act_util(:,2), ...
    'LineStyle', ':', ...
    'Marker', 'v', ...
    'Color', colors(2,:), ...
    'MarkerFaceColor', colors(2,:));
datetick('x','HHPM');
xlabel('Time of the day')
ylim([0 max(act_util(:))*1.5])
legend('Home', 'Work', 'Location', 'NorthWest')
ylabel('Marginal activity utiliy')

% plot travel time
subplot(2,1,2)
hold on
line(x, -tt(:).*alpha, 'LineStyle', ':', ...
               'Color', 'r', ...
               'Marker','o', ...
               'MarkerFaceColor', 'r');
% datetick('x','HHPM');
datetick('x','HHPM');
xlabel('Time of the day')
ylim([min(-tt(:).*alpha)*1.5 0])
ylabel('Travel disutility')
legend_h = legend('Travel from W to H', 'Location', 'NorthEast');
set(legend_h, 'Color', 'none')
