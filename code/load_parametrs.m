function param = load_parametrs(param_name, experiment, frame, path)
    % Преобразование номера эксперимента в строку
    experiment = num2str(experiment);

    % Создание пути к папке с параметром
    parameter_folder = fullfile(path, experiment, strcat(experiment, '_', param_name));

    % Формирование имени файла для загрузки данных
    file_name = sprintf('%s_%s_frame_%d.mat', experiment, param_name, frame);

    % Загрузка данных из файла
    data = load(fullfile(parameter_folder, file_name));
    % Извлечение параметра из структуры данных
    param = data.param;
end
