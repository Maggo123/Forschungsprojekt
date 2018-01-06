#figure(1,"position",get(0,"screensize"))
for k=0:20:4799  % plotte i = 0, 100, 200, 300, ... bis 100000
    M = csvread(['C:\Users\Maggo\Documents\HTW\FuE-Projekt\Data\', int2str(k),'.csv']);
    [X,Y] = meshgrid(1:size(M,2),1:size(M,1));    
    %hold off %bevor ein neuer Plot gezeichnet wird, wird der Alte gelöscht. Könnte später interessant werden
    surf(X,Y,M, 'LineStyle', 'none'); %Plot zeichnen
    colorbar
    %hold on
    view([0 -90])
    title(['Vergangene Tage: ', int2str(k/240)]);
    %axis equal;
    #cmap = colormap(default);
    #cmap_mod = cmap;
    #cmap_mod(any(cmap'==0),:)=1;
    #colormap(cmap_mod)
        
    #k % i ausgeben
    #pause(0.05); 
    filename=sprintf('output/%05d.png',k);
    print(filename);
end