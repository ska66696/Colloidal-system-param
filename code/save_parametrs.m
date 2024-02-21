function save_parametrs(param, param_name, experiment, frame, path)

    experiment = num2str(experiment);
    
    % Создание пути к папке эксперимента
    experiment_folder = fullfile(path, experiment);
    
    % Создание папки эксперимента, если она не существует
    if ~exist(experiment_folder, 'dir')
        mkdir(experiment_folder);
    end
    
    % Создание пути к папке с параметром
    parameter_folder = fullfile(experiment_folder, strcat(experiment, '_', param_name));
    
    % Создание папки с параметром, если она не существует
    if ~exist(parameter_folder, 'dir')
        mkdir(parameter_folder);
    end
    
    % Формирование имени файла для сохранения данных
    file_name = sprintf('%s_%s_frame_%d.mat', experiment, param_name, frame);
    
    % Сохранение данных в файл
    save(fullfile(parameter_folder, file_name), 'param');
end

