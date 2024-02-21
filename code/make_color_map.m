function color_param = make_color_map(param,range,color)
    width = range(2) - range(1);
    param = param - range(1);
    param(param <= 0) =10^-15;
    param(param > width) = width;
    ind = ceil(param * size(color, 1) / width);
    color_param = color(ind, :);
end

