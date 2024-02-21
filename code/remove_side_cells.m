function [c,newIndex]  = remove_side_cells( c , v , minX , maxX , minY , maxY )
    x = v(:, 1);
    y = v(:, 2);
    %find list of particle out of bounds
    badVerts = find(x <= minX | x >= maxX | y <= minY | y >= maxY);
    badCells = zeros(size(c, 1), 1,'logical');
    newIndex = zeros(size(c, 1), 1);
    %find the cells that have particle out of bounds
    for i = 1:size(c, 1)
        if any(ismember(badVerts, c{i})) || size(c, 1) < 1 || size(c, 2) < 1
            badCells(i) = true;
        end
    end
    %  remove bad cells and make reverse dictionary
    oldIndex = [1:length(c)]';
    c(badCells) = [];
    oldIndex(badCells) = [];
    
    for i=1:length(oldIndex) 
        newIndex(oldIndex(i))=i;
    end
end

