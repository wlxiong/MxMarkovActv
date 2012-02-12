function plotPassenger(png)
% plot number of passengers in each zone
figure
hold on
box on
flows = 1000-sum(png,2);
x1 = genTimes(13, 12+size(png,1));
h1 = bar(x1, [png(:,2) flows png(:,1)], 'stacked');
datetick('x','HHPM')
colormap summer
set(get(h1(1),'BaseLine'),'LineWidth',1,'LineStyle',':')
x2 = genTimes(12, 12+size(png,1)+1);
xlim([min(x2), max(x2)])
ylim([0 max(png(:))])
legend('Work', 'Travel', 'Home', 'Location', 'NorthWest')
ylabel('Number of Travelers')
xlabel('Time of the day')