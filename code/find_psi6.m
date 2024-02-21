function [psi6,orderAngle] = find_psi6( parts_new , neig , num )
   
    psi6 = zeros(num,1);
    orderAngle = zeros(num,1);
    parfor i = 1:num
        coords  = parts_new(neig{i}, 1:2) - repmat(parts_new(i, 1:2), size(neig{i}));
        dots = coords(:,1) ./ sqrt(sum(coords.^2, 2));
        fl   = coords(:,2) > 0;

        theta = 2*pi.*fl + acos(dots) .* ((-1).^(fl+1));
        arr   = exp(6 * 1i * theta);
        psi6(i) = abs( sum(arr) )/size(neig{i}, 1);
        orderAngle(i) = mean(theta);
    end
    orderAngle = mod(rad2deg(orderAngle),60);

end



