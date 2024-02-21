function [parts_new, vertexCoord ] = find_centres(c, v, parts, num)
parts_new = zeros(num, 2);

partsX = parts(:, 1);
partsY = parts(:, 2);
vertexCoord = cell(num,1);
parfor i = 1:num
    r = v(c{i},:);
    vertexCoord{i}  = reshape(r',1,[]);
    xq = r(:,1);
    yq = r(:,2);
    
    x_min=min(xq);
    x_max=max(xq);
    y_min=min(yq);
    y_max=max(yq);
    
    ind=find( partsX > x_min & partsY > y_min & partsX < x_max & partsY < y_max);
    if length(ind)>1
        P = find(inpolygon(partsX(ind),partsY(ind),xq,yq));
        ind=ind(P);
    end
    parts_new(i,:) = [partsX(ind) , partsY(ind)];
 end
 
end

