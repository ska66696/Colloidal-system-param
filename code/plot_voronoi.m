function I = plot_voronoi(param,partsNew,vertexCoord,range,settings)

    I = ones(range(2), range(1), 3, 'uint8') * 256;
    
    color = make_color_map(param,settings.ColorAxis,settings.ColorMap);

    if settings.plotType == 1 

        I = insertShape(I, 'FilledPolygon', vertexCoord, 'Color', color, 'Opacity', 1);
        I = insertShape(I, 'Polygon', vertexCoord, 'Color', settings.cells, 'Opacity', 1 );


    elseif settings.plotType == 2

        I(:,:,:) = settings.background;
        radius = [partsNew.*settings.imageScale,ones(length(partsNew),1)*settings.dotsSize];
        I = insertShape(I, 'FilledCircle', radius, 'Color', color, 'Opacity', 1);

    elseif settings.plotType == 3

        I(:,:,:) = settings.background;
        radius = [partsNew.*settings.imageScale,ones(length(partsNew),1)*settings.dotsSize];
        I = insertShape(I, 'FilledCircle', radius, 'Color', color, 'Opacity', 1);
        I = insertShape(I, 'Polygon', vertexCoord, 'Color', settings.cells, 'Opacity', 1);
    end
end