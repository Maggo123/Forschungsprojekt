MCS = 4800;
M = csvread(['C:\Users\Maggo\Documents\HTW\FuE-Projekt\ColonySize\colony.csv']);
t = zeros(MCS, 1);
t(1) = 0;
for i = 2 : length(t)
  t(i) = t(i-1)+1;
end

semilogy(t, M, 'LineWidth', 1.0);
xlim([0 2000])
ylim([10^4 10^7])
set(gca,'fontsize',16)
#Hilfslinien
#hold on 
#plot([1920, 1920],[1000,100000000]);