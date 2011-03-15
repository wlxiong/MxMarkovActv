function plotOptUtil(opt_util)
figure
grid on
hold on
x = 13:12+size(opt_util,1);
colors = lines(2);
plot(x, opt_util(:,1),...
    'LineStyle', '--', ...
    'Marker', '^', ...
    'Color', colors(1,:), ...
    'LineWidth', 2, ...
    'MarkerSize', 6, ...
    'MarkerFaceColor', colors(1,:));
plot(x, opt_util(:,2), ...
    'LineStyle', '--', ...
    'Marker', 'v', ...
    'Color', colors(2,:), ...
    'LineWidth', 2, ...
    'MarkerSize', 6, ...
    'MarkerFaceColor', colors(2,:));
set(gca,'XTick',13:24)
ylim([-10, max(opt_util(:))*1.2])
xlim([12 25])
legend('Home', 'Work')
xlabel('Time (o''clock)')
ylabel('Expected Maximum Utiliy')