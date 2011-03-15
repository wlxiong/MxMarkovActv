function plotPassenger(png, flows)
% plot number of passengers in each zone
figure
hold on
wid = .4;
x = 13:12+size(png,1);
colors = summer(2);
h1 = bar(x-wid/2.0, png(:,1), .4);
h2 = bar(x+wid/2.0, png(:,2), .4);
set(h1, 'FaceColor', colors(1,:))
set(h2, 'FaceColor', colors(2,:))
set(get(h1(1),'BaseLine'),'LineWidth',2,'LineStyle',':')
set(get(h2(1),'BaseLine'),'LineWidth',2,'LineStyle',':')
xlim([12 25])
ylim([0 max(png(:))*1.2])
set(gca,'XTick',13:24)
legend('Home', 'Work', 'Location', 'NorthWest')
xlabel('Time (o''clock)')
ylabel('Number of Passengers')

% plot passegner flows
ax1 = gca;
set(ax1,'XColor','k','YColor','k')
ax2 = axes('Position',get(ax1,'Position'),...
           'XAxisLocation','top',...
           'XTick', [], ...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','r','YColor','r');
line(x, flows, 'LineStyle', '--', ...
               'Color', 'r', ...
               'LineWidth', 2, ...
               'Marker','o', ...
               'MarkerSize', 6,...
               'MarkerFaceColor', 'r', ...
               'Parent',ax2)
xlim([12 25])
ylim([0 max(png(:))*1.2])
ylabel('Passenger Flows (passengers/hour)')
legend_h = legend('Flows (W to H)', 'Location', 'NorthEast');
set(legend_h, 'Color', 'none')
