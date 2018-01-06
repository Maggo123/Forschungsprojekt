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
subplot(2,9,1:3);
plot(t, my_median);
xlabel('Number of MCS') % x-axis label
ylabel('Cellsize in \mum^2') % y-axis label
#set(gca, 'YScale', 'log')
title('Median of Cellsizes');

#Hilfslinien
hold on 
plot([0,MCS],[170,170]);
plot([0,MCS],[225,225]);
plot([0,MCS],[415,415]);
legend('Median','Minimum Divisionsize','Average Cellsize','Maximum Cellsize');

subplot(2,9, 10:12);
plot(t, cellCounts);
xlabel('Number of MCS') % x-axis label
ylabel('Cellcount') % y-axis label
title('Cellcount');

subplot(2,9, [4:9 13:18]);
for k=0:100:MCS 
    M = csvread(['C:\Users\Maggo\Documents\HTW\FuE-Projekt\Data\', int2str(k),'.csv']);
    [X,Y] = meshgrid(1:size(M,2),1:size(M,1));    
    surf(X,Y,M, 'LineStyle', 'none'); %Plot zeichnen
    colorbar
    view([0 -90])
    pause(0.1); 
    filename=sprintf('output/%05d.png',k);
    print(filename);
end

