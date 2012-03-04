function plotActUtil(act_util, times)
tt=times(2,1,:);
% plot activity utility
% 1: home, 2:work
figure
box on

% subplot(2,1,1)
grid on
hold on
x = genTimes(13, 12+size(act_util,1));
colors = lines(2);

u1 = flipud(cumsum(flipud(act_util(:,1))));
u2 = cumsum(act_util(:,2));
[AX,H1,H2] = plotyy(x,u2,x,u1,'plot');

set(H1,'LineStyle','--', ...
    'Marker', '^', ...
    'Color', colors(1,:), ...
    'MarkerFaceColor', colors(1,:));
set(H2,'LineStyle',':', ...
    'Marker', 'v', ...
    'Color', colors(2,:), ...
    'MarkerFaceColor', colors(2,:));

set(get(AX(1),'Ylabel'),'String','Cummulative utility (Work)')
set(get(AX(2),'Ylabel'),'String','Cummulative utility (In-Home)')

pbaspect(AX(1), [2 1 1])
pbaspect(AX(2), [2 1 1])

datetick(AX(1), 'x','HHPM')
datetick(AX(2), 'x','HHPM')
ylim(AX(1), [0 150])
ylim(AX(2), [0 150])
legend('Work', 'Home')
xlabel('Time of the day')
ylabel('Future Utility')
% ylim([0 max(cumsum(act_util(:)))*1.5])

% legend('Home', 'Work', 'Location', 'NorthWest')

% % plot travel time
% subplot(2,1,2)
% hold on
% line(x, -tt(:).*alpha, 'LineStyle', ':', ...
%                'Color', 'r', ...
%                'Marker','o', ...
%                'MarkerFaceColor', 'r');
% % datetick('x','HHPM');
% datetick('x','HHPM');
% xlabel('Time of the day')
% ylim([min(-tt(:).*alpha)*1.5 0])
% ylabel('Travel disutility')
% legend_h = legend('Travel from W to H', 'Location', 'NorthEast');
% set(legend_h, 'Color', 'none')
