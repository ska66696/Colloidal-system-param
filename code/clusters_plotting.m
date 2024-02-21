function clusters_plotting (cluster_cur, parts_new_cur, angle_cur, vertex_coord_cur, save_path, frame, experiment)
% Инициализация массива для хранения средних углов в кластерах
mean_angles = zeros(max(cluster_cur), 1);

% Подсчет средних углов в каждом кластере
for i = 1:max(cluster_cur)
    % Выбор углов только для частиц в текущем кластере
    cluster_angles = angle_cur(cluster_cur == i);
    % Вычисление среднего угла
    mean_angles(i) = mean(cluster_angles);
end



% Удаление границ кластеров
valid_indices = cluster_cur ~= -1;
cluster_cur = cluster_cur(valid_indices);
angle_cur = angle_cur(valid_indices);
parts_new_cur = parts_new_cur(valid_indices, :);
vertex_coord_cur = vertex_coord_cur(valid_indices);

% Запись среднего угла для каждой частицы в исходном массиве angle
for i = 1:length(angle_cur)
    % Записываем средний угол для частицы, используя ее номер кластера
    angle_cur(i) = mean_angles(cluster_cur(i));
end

image_plotting(angle_cur,"clusters", parts_new_cur, vertex_coord_cur, experiment, frame, save_path);
end

