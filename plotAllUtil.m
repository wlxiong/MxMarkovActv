function plotAllUtil(opt_util)
figure
box on

x = genTimes(13, 12+size(opt_util,1));
colors = lines(2);
plot(x, opt_util(:,1),...
	'LineStyle', '-', ...
	'Marker', 'o', ...
	'Color', colors(1,:), ...
	'MarkerFaceColor', colors(1,:));
pbaspect([2 1 1])
datetick('x','HHPM');
xlabel('Time of the day')
ylabel('Overall utility')
