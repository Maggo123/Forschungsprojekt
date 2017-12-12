N = 200; 
plot_grid_lines = 0; % number of grid lines for better 3D visualization
topview = 1; % 1=true, 0=false

M=zeros(N+1, N+1);
for k=0:1:99  % plotte i = 0, 100, 200, 300, ... bis 100000
    M = csvread(['C:\Users\Maggo\Documents\HTW\FuE-Projekt\Data\', int2str(k),'.csv']);
    [X,Y] = meshgrid(1:size(M,2),1:size(M,1));    
    hold off %bevor ein neuer Plot gezeichnet wird, wird der Alte gelöscht. Könnte später interessant werden
    surf(X,Y,M, 'LineStyle', 'none'); %Plot zeichnen
    zlim([min(min(M)),max(max(M))]); %Z-Achsen-Limit setzen
    hold on
    view([0 -90])
    axis equal;
    cmap = colormap(summer);
    cmap_mod = cmap;
    cmap_mod(any(cmap'==0),:)=1;
    colormap(cmap_mod)
        
    k % i ausgeben
    pause(0.1); 
end