% Задача 9: Нечеткие множества на интервале [0; 3]
U = 0:0.1:3;

% Определение функций принадлежности
A = U.^2 / 9;
B = (U.^2 - 1).^2 / 9;

% Операции
intersection_AB = min(A, B); % Пересечение
union_AB = max(A, B); % Объединение
complement_A = 1 - A; % Дополнение

% Графики
figure;
plot(U, A, 'DisplayName', 'A'); hold on;
plot(U, B, 'DisplayName', 'B');
plot(U, intersection_AB, 'DisplayName', 'A \cap B');
plot(U, union_AB, 'DisplayName', 'A \cup B');
legend;
title('Операции с множествами A и B');
xlabel('U');
ylabel('\mu(U)');
grid on;
