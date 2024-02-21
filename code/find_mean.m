function [ RG ] = find_mean( neig , Rg , num )
    RG = zeros(num,1); 
    for i = 1:num
        RG(i) = mean( [Rg(neig{i});Rg(i)]); %
    end
end

