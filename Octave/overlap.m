%graphics_toolkit("gnuplot")
figure(1,"position",get(0,"screensize"))
hold on
    M = csvread(['C:\Users\Maggo\Documents\HTW\FuE-Projekt\Data\', int2str(90),'.csv']);
    M(M>0) = 1;
    M(M==0) = nan;
    [X,Y] = meshgrid(1:size(M,2),1:size(M,1));    
    a = surf(X,Y,M, 'LineStyle', 'none'); %Plot zeichnen
    set(a,'FaceColor',[0 1 1],'FaceAlpha',1);
    view([0 -90])

    M = csvread(['C:\Users\Maggo\Documents\HTW\FuE-Projekt\Data\', int2str(70),'.csv']);
    M(M>0) = -1;
    M(M==0) = nan;
    [X,Y] = meshgrid(1:size(M,2),1:size(M,1));    
    b = surf(X,Y,M, 'LineStyle', 'none'); %Plot zeichnen
    set(b,'FaceColor',[0 0.8 0.8],'FaceAlpha',1);
    
    M = csvread(['C:\Users\Maggo\Documents\HTW\FuE-Projekt\Data\', int2str(50),'.csv']);
    M(M>0) = -2;
    M(M==0) = nan;
    [X,Y] = meshgrid(1:size(M,2),1:size(M,1));    
    c = surf(X,Y,M, 'LineStyle', 'none'); %Plot zeichnen
    set(c,'FaceColor',[0 0.6 0.6],'FaceAlpha',1);
    
    M = csvread(['C:\Users\Maggo\Documents\HTW\FuE-Projekt\Data\', int2str(30),'.csv']);
    M(M>0) = -3;
    M(M==0) = nan;
    [X,Y] = meshgrid(1:size(M,2),1:size(M,1));    
    d = surf(X,Y,M, 'LineStyle', 'none'); %Plot zeichnen
    set(d,'FaceColor',[0 0.4 0.4],'FaceAlpha',1);
    
    M = csvread(['C:\Users\Maggo\Documents\HTW\FuE-Projekt\Data\', int2str(0),'.csv']);
    M(M>0) = -4;
    M(M==0) = nan;
    [X,Y] = meshgrid(1:size(M,2),1:size(M,1));    
    d = surf(X,Y,M, 'LineStyle', 'none'); %Plot zeichnen
    set(d,'FaceColor',[0 0.2 0.2],'FaceAlpha',1);
