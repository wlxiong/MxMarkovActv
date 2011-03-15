function plotUtilBar(act_util, times, alpha)
tt=times(2,1,:);
% plot activity utility
figure
x = 13:12+size(act_util,1);
h = bar(x, [act_util, -tt(:)*alpha]);
set(get(h(1),'BaseLine'),'LineWidth',2,'LineStyle',':')
colormap summer % Change the color scheme
set(gca,'XTick',13:24)
ylim([min(-tt(:).*alpha)*1.2 max(act_util(:))*1.2])
legend('Home', 'Work', 'Travel')
xlabel('Time (o''clock)')
ylabel('Utiliy')
