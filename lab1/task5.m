% Задача 5: Цены на автомобили
U = linspace(4, 5000, 1000); % Цены от 4 до 5000

% Функции принадлежности
mu_A = exp(-((U - 1000) / 200).^2); % Средний класс
mu_B = exp(-((U - 4000) / 500).^2); % Богатые
mu_C = exp(-((U - 500) / 100).^2);  % Небогатые

% Графики
figure;
plot(U, mu_A, 'DisplayName', 'Средний класс');
hold on;
plot(U, mu_B, 'DisplayName', 'Для богатых');
plot(U, mu_C, 'DisplayName', 'Для небогатых');
legend;
title('Функции принадлежности цен автомобилей');
xlabel('Цена');
ylabel('Принадлежность');
grid on;
