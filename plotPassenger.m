function plotPassenger(png)
% plot number of passengers in each zone
figure
hold on
box on
png = png(1:12,:);
flows = 1000-sum(png,2);
x1 = genTimes(13, 12+size(png,1));
h1 = bar(x1, [png(:,1) flows png(:,2)], 'stacked');
pbaspect([1.8 1 1])
datetick('x','HHPM')
colormap summer
set(get(h1(1),'BaseLine'),'LineWidth',1,'LineStyle',':')
x2 = genTimes(12, 12+size(png,1)+1);
xlim([min(x2), max(x2)])
ylim([0 max(png(:))])
legend('Home', 'Travel', 'Work', 'Location', 'NorthWest')
ylabel('Activity participation by population')
xlabel('Time of the day')