% Задача 3: Дисциплины
U = {'Math', 'Physics', 'Chemistry', 'Biology', 'Computer Science'};

% Функции принадлежности
mu_A = [1, 0.8, 0.6, 0.4, 0.2]; % Мне нравится
mu_B = [0.2, 0.4, 0.6, 0.8, 1]; % Не понимаю
mu_C = [0.4, 0.6, 0.8, 1, 0.8]; % Не нравится
mu_D = [0.6, 0.8, 1, 0.8, 0.6]; % Хочу изучать глубже

% Разложение по уровням
% раз
alpha_levels = 0:0.2:1;
disp('Разложение по уровням:');
for alpha = alpha_levels
    disp(['Alpha = ', num2str(alpha)]);
    disp(['A: ', num2str(find(mu_A >= alpha))]);
    disp(['B: ', num2str(find(mu_B >= alpha))]);
    disp(['C: ', num2str(find(mu_C >= alpha))]);
    disp(['D: ', num2str(find(mu_D >= alpha))]);
end