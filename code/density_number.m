function [density, number] = density_number(c, v, len)
   
    number = zeros(len, 1);
    area   = zeros(len, 1);

    parfor i = 1:len
        ind = c{i}';
        area(i)   = polyarea( v(ind, 1), v(ind, 2) );
        number(i) = size(c{i}, 2);
    end
    density = 1./area;
end

