% Первая функция принадлежности (треугольная)
x1 = 3:0.1:7;
mu1 = max(0, 1 - abs(x1 - 5) / 2);

% Вторая функция принадлежности (трапецеидальная)
x2 = 1:0.1:6;
mu2 = max(0, min((x2 - 1) / 1, (6 - x2) / 2));

% Приведение массивов к одному диапазону
x_common = linspace(min([x1, x2]), max([x1, x2]), 100); % Общий диапазон
mu1_interp = interp1(x1, mu1, x_common, 'linear', 0); % Интерполяция mu1
mu2_interp = interp1(x2, mu2, x_common, 'linear', 0); % Интерполяция mu2

% Нечеткая импликация
implication = min(mu1_interp, mu2_interp);

% Построение графиков
figure;
plot(x_common, mu1_interp, 'r', 'LineWidth', 2); hold on;
plot(x_common, mu2_interp, 'b', 'LineWidth', 2);
plot(x_common, implication, 'g', 'LineWidth', 2);
grid on;
legend('mu1', 'mu2', 'implication');
title('Нечеткая импликация');
xlabel('x');
ylabel('μ(x)');
