function calc_voronoi_param(all_parts, save_path, experiment, mask_calc)

frames = length(all_parts);


for frame = 1 : frames
    parts = all_parts{frame};

    % Get size of the system
    minX = min(parts(:, 1));
    minY = min(parts(:, 2));
    maxX = max(parts(:, 1));
    maxY = max(parts(:, 2));

    %% Build Voronoi cells

    [v, c] = voronoin(parts);

    %% Remove side cells and get dict for indexes

    [c,dict] = remove_side_cells( c , v , minX , maxX , minY , maxY );
    num = size(c, 1);

    %% Find centers

    [parts_new_cur, vertex_coord_cur] = find_centres( c , v , parts, num );

    %% Find neighbor

    neig_cur  = find_neighbors( parts , dict, num);

    %% Order parametr
    if mask_calc(1) || mask_calc(2)
        [psi6_cur,angle_cur] = find_psi6( parts_new_cur , neig_cur , num );
    end
    %% Area,density and number particle in cell 
    if mask_calc(4) || mask_calc(3)
        [density_cur,number_cur] = density_number( c , v , num );
    end
    %% RG parametr
    if mask_calc(5)
        rgTemp = find_rg( parts_new_cur , neig_cur);
        rgTemp = sqrt(rgTemp.^2.*density_cur.*pi);
        % find mean rg for neigbors cells  
        rg_cur = find_mean( neig_cur , rgTemp, num  );
    end
    %% Save parametrs

    save_parametrs(parts_new_cur, "parts_new", experiment, frame, save_path);
    save_parametrs(neig_cur, "neig", experiment, frame, save_path);
    save_parametrs(vertex_coord_cur, "vertex_coord", experiment, frame, save_path);
    if mask_calc(2)
        save_parametrs(angle_cur, "angle", experiment, frame, save_path);
    end
    if mask_calc(1)
        save_parametrs(psi6_cur, "psi6", experiment, frame, save_path);
    end

    if mask_calc(3)
        save_parametrs(number_cur, "number", experiment, frame, save_path);
    end
    if mask_calc(4)
        save_parametrs(density_cur, "density", experiment, frame, save_path);
    end
    if mask_calc(5)
        save_parametrs(rg_cur, "rg", experiment, frame, save_path);
    end
end

end

