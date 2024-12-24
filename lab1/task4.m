U = 0:0.1:5;

% Функции принадлежности
mu_A = double(U <= 5); % Пример: значение 1 при U <= 5
mu_B = (U - 5) / 5 .* (U >= 5 & U <= 10);
mu_C = max(0, 1 - abs(U - 2)); % Треугольная функция
mu_D = 1 ./ (1 + 2 * U); % Сигмоидная функция

% Графики
figure;
plot(U, mu_A, 'DisplayName', 'A');
hold on;
plot(U, mu_B, 'DisplayName', 'B');
plot(U, mu_C, 'DisplayName', 'C');
plot(U, mu_D, 'DisplayName', 'D');
legend;
title('Функции принадлежности');
xlabel('U');
ylabel('Принадлежность');
grid on;
