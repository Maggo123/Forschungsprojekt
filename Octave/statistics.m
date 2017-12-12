pkg load statistics

M = csvread(['C:\Users\Maggo\Documents\HTW\FuE-Projekt\Statistics\Statistics.csv']);

config = M(1,:);
MCS = config(1);
movementProbability = config(2)
divisionProbability = config(3)
growthProbability = config(4)
growthPercentage = config(5)
M = M(2:end, :);

t = zeros(MCS, 1);
t(1) = 0;
for i = 2 : length(t)
  t(i) = t(i-1)+1;
end
  

my_median = zeros(MCS,1);
cellCounts = zeros(MCS,1);

for i = 1 : length(my_median)
  nonzeroIndizes = find(M(i,:)~=0);
  my_median(i) = median(M(i,:)(nonzeroIndizes));
  cellCounts(i) = nnz(M(i,:));
end

descr = ['Genutzte Parameter:' char(10)...
    'Bewegungswahrscheinlichkeit:' char(10) ...
    num2str(movementProbability) char(10) ...
    'Teilungswahrscheinlichkeit:' char(10) ...
    num2str(divisionProbability) char(10) ...
    'Wachstumswahrscheinlichkeit:' char(10) ...
    num2str(growthProbability) char(10) ...
    'Wachstumszuwachs:' char(10) ...
    num2str(growthPercentage)];
    
figure('Position',get(0,'ScreenSize'))
subplot(2,5,1:4);
plot(t, my_median);
xlabel('Anzal der MCS') % x-axis label
ylabel('Zellgröße') % y-axis label
#set(gca, 'YScale', 'log')
title('Median der Zellgrößen');

subplot(2,5, 6:9);
plot(t, cellCounts);
xlabel('Anzahl der MCS') % x-axis label
ylabel('Zellanzahl') % y-axis label
title('Zellanzahl');

subplot(2,5,5); axis off
textField = text(.025,0.6, descr)
set(textField, "fontsize", 16);
