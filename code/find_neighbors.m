function [neig,number]  = find_neighbors( parts_new , dict, num)
    tr = delaunay(parts_new(:,1),parts_new(:,2));
    neig = cell(num,1);
    list = find(dict~=0);
    number = zeros(num,1);
    parfor i = 1:length(list)
         ind = list(i);
         [q,~] = find(tr==ind);
         L = unique(tr(q,:));
         L(L==ind) = [];
         neig{i} = nonzeros(dict(L));
     end
    
end

