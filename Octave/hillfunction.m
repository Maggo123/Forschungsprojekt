x = zeros(500, 1);
x(1) = 0;
for i = 2 : length(x)
  x(i) = x(i-1)+1;
end

y = zeros(length(x),1);
for i = 1 : length(y)
  y(i) = x(i)^4/(x(i)^4+170^4)/120;
end

plot(x,y, 'LineWidth', 2.0)
xlabel('Cellsize in \mum^2','FontSize',14) % x-axis label
ylabel('Divisionprobability','FontSize',14) % y-axis label
set(gca,'fontsize',16)
hold on
plot(170, y(170),'r*', 'LineWidth', 2.0)