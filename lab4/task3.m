% Входная функция принадлежности (трапецеидальная)
x = 1:0.1:6;
mu = max(0, min((x - 1) / 1, (6 - x) / 2));

% Метод центра тяжести
numerator = sum(x .* mu);
denominator = sum(mu); 
center_of_gravity = numerator / denominator; % Центр тяжести

% Вывод результата
disp(['Центр тяжести: ', num2str(center_of_gravity)]);
