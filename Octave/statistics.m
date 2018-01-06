pkg load statistics

M = csvread(['C:\Users\Maggo\Documents\HTW\FuE-Projekt\Statistics\Statistics.csv']);

config = M(1,:);
MCS = config(1);
movementProbability = config(2);
divisionProbability = config(3);
growthProbability = config(4);
growthPercentage = config(5);

M = M(2:end, :); #configzeile aus der Matrix entfernen

t = zeros(MCS, 1);
t(1) = 0;
for i = 2 : length(t)
  t(i) = t(i-1)+1;
end
  
my_median = zeros(MCS,1);
cellCounts = zeros(MCS,1);
divisions = [];

for i = 1 : length(my_median)
  nonzeroIndizes = find(M(i,:)~=0);
  my_median(i) = median(M(i,:)(nonzeroIndizes));
  if(i > 1 && my_median(i) < my_median(i-1))
    divisions = [divisions, i];
  end
  cellCounts(i) = nnz(M(i,:));
end
    
figure('Position',get(0,'ScreenSize'))
subplot(2,5,1:4);
plot(t, my_median, 'LineWidth', 1.0);
ylim([0,420])
xlabel('Number of MCS','FontSize',14) % x-axis label
ylabel('Cellsize in \mum^2','FontSize',14) % y-axis label
#set(gca, 'YScale', 'log')
title('Median of Cellsizes');

#Hilfslinien
hold on 
#plot([0,MCS],[170,170]);
#plot([0,MCS],[225,225], 'LineWidth', 2.0);
#plot([0,MCS],[800,800], 'LineWidth', 2.0);
plot([1920, 1920],[0,800], 'LineWidth', 2.0); 
#legend('Median','Average Cellsize','Maximum Cellsize');

set(gca,'fontsize',16)

subplot(2,5, 6:9);
plot(t, cellCounts, 'LineWidth', 1.0);
#set(gca, 'ytick', [1000, 2000, 5000, 10000])
xlabel('Number of MCS','FontSize',14) % x-axis label
ylabel('Cellcount','FontSize',14) % y-axis label
title('Cellcount');
hold on 
plot([2400, 2400],[0,3000], 'LineWidth', 2.0);
set(gca,'fontsize',16)

divisionDiff = [];
for i = 2 : length(divisions)
  divisionDiff = [divisionDiff, divisions(i) - divisions(i-1)]; 
end

averageDivisionTime = mean(divisionDiff)*0.1

descr = ['Parameter:' char(10)...
    'Movementprobability:' char(10) ...
    num2str(movementProbability) char(10) ...
    'Divisionprobability:' char(10) ...
    '-'#num2str(divisionProbability) char(10) ...
    'Growthprobability:' char(10) ...
    num2str(growthProbability) char(10) ...
    'Growthpercentage:' char(10) ...
    num2str(growthPercentage) char(10)...
    char(10) 'Results:' char(10) ...
    'Average Celldivisiontime:' char(10)...
    num2str(averageDivisionTime) char(10) ...
    'Average Cellsize:' char(10)...
    num2str(mean(my_median))];
    
subplot(2,5,5); axis off
textField = text(.025,0.6, descr);
set(textField, "fontsize", 16);


