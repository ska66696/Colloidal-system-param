function save_figure(I, param_name, experiment, frame, path)
    I=imshow(I);
    colormap('jet');
    c = colorbar;
    c.Ticks = [0 0.5 1];
    if param_name == "psi6"
        c.TickLabels = {'1','0.5','0'};
    else
        c.TickLabels = {'0\circ','30\circ','60\circ'};
    end
    
    experiment = num2str(experiment);
    
    % Создание пути к папке эксперимента
    experiment_folder = fullfile(path, experiment);
    
    % Создание папки эксперимента, если она не существует
    if ~exist(experiment_folder, 'dir')
        mkdir(experiment_folder);
    end
    
    % Создание пути к папке с параметром
    parameter_folder = fullfile(experiment_folder, strcat(experiment, '_', param_name, '_', "pictures"));
    
    % Создание папки с параметром, если она не существует
    if ~exist(parameter_folder, 'dir')
        mkdir(parameter_folder);
    end
    
    % Формирование имени файла для сохранения данных
    file_name = sprintf('%s_%s_frame_%d', experiment, param_name, frame);

    print(fullfile(parameter_folder, file_name), '-dpng', '-r1000');
end

