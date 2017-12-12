deltaT = 1;
a = 0;
b = 99;
margin = 50;

t = zeros(b+1, 1);
t(1) = 0;
for i = 2 : length(t)
  t(i) = t(i-1)+1;
end
  
cellCounts = zeros(b+1, 1);
cellDensities = zeros(b+1,1);

for k=a:deltaT:b  
    M = csvread(['C:\Users\Maggo\Documents\HTW\FuE-Projekt\Data\', int2str(k),'.csv']);
    [m,n] = size(M);
    FieldOfView = M(margin+1:m-margin,margin+1:n-margin);
    [m,n] = size(FieldOfView);
    cellCounts(k+1) = sum(sum(FieldOfView));
    cellDensities(k+1) = nnz(FieldOfView)/(m*n);
end

subplot(2,1,1);
plot(t,cellCounts);
title('Zellanzahl');
subplot(2,1,2);
plot(t, cellDensities);
title('Zelldichte');