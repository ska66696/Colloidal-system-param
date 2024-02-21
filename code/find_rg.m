function Rg = find_rg( parts_new , neig  )
    num = length(parts_new);
    Rg = zeros(num,1);
        for i = 1:num
        temp = 0;
        neigNum = length(neig{i});
        S = zeros(neigNum,1);
        distance = zeros(neigNum,2);
        distance = [ones(neigNum,1).*parts_new(i,1),ones(neigNum,1).*parts_new(i,2)]-...
            parts_new(neig{i},:);
        
        S = sqrt(sum(distance.^2,2));
        
            for  j = 1:neigNum
                for k = j+1:neigNum
                    temp = temp+(S(j)-S(k))^2;
                end
            end
        Rg(i) = 0.5.*sqrt(2*temp)/neigNum;
        end

end

