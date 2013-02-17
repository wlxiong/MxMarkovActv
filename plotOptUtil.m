function plotOptUtil(opt_util)

figure
grid on
hold on

x = genTimes(13, 12+size(opt_util,1));
colors = lines(2);
plot(x, opt_util(:,2), ...
    'LineStyle', '--', ...
    'Marker', '^', ...
    'Color', colors(1,:), ...
    'MarkerFaceColor', colors(1,:));
plot(x, opt_util(:,1),...
    'LineStyle', '-', ...
    'Marker', 'v', ...
    'Color', colors(2,:), ...
    'MarkerFaceColor', colors(2,:));

pbaspect([2 1 1])
datetick('x','HHPM');
% ylim([-10, max(opt_util(:))*1.2])
% xlim([12 25])
legend('Work', 'Home')
xlabel('Time of the day')
ylabel('Expected maximum future utility')
