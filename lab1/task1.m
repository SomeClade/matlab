% Задача 1: Нечеткие множества для дней недели
U = {'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'};

% Функции принадлежности
mu_A = [1, 0.8, 0.6, 0.4, 0.2, 0, 0]; % Начало недели
mu_B = [0, 0.2, 0.4, 0.6, 0.8, 1, 0]; % Середина недели
mu_C = [0, 0, 0.2, 0.4, 0.6, 0.8, 1]; % Конец недели
mu_D = [0.5, 0.4, 0.3, 0.2, 0.1, 0, 0]; % Не начало и не конец

% Проверка унимодальности
is_unimodal = @(x) all(diff(x(1:find(x==max(x), 1, 'first'))) > 0) && ...
                   all(diff(x(find(x==max(x), 1, 'last'):end)) < 0);
disp('Унимодальность функций принадлежности:');
disp(['A: ', num2str(is_unimodal(mu_A))]);
disp(['B: ', num2str(is_unimodal(mu_B))]);
disp(['C: ', num2str(is_unimodal(mu_C))]);
disp(['D: ', num2str(is_unimodal(mu_D))]);

% Графики
figure;
plot(1:7, mu_A, '-o', 'DisplayName', 'Начало недели');
hold on;
plot(1:7, mu_B, '-o', 'DisplayName', 'Середина недели');
plot(1:7, mu_C, '-o', 'DisplayName', 'Конец недели');
plot(1:7, mu_D, '-o', 'DisplayName', 'Не начало и не конец');
xticks(1:7);
xticklabels(U);
legend;
title('Функции принадлежности для дней недели');
xlabel('Дни недели');
ylabel('Принадлежность');
grid on;
