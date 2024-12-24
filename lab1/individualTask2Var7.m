parameters = {'Страна', 'Стоимость тура', 'Сезон', 'Продолжительность тура'};
weights = [
    0.3,  0.15, 0.25, 0.3;  % Страна
    0.4,  0.30, 0.30, 0.4;  % Стоимость тура
    0.15, 0.40, 0.25, 0.2;  % Сезон
    0.15, 0.15, 0.20, 0.1   % Продолжительность тура
];

% Шаг 1: Перевод коэффициентов весомости в ранги
% Для каждого эксперта (столбца) сортируем по убыванию весомости
[num_parameters, num_experts] = size(weights);
ranks = zeros(size(weights));
for j = 1:num_experts
    [~, rank_idx] = sort(weights(:, j), 'descend');
    ranks(rank_idx, j) = 1:num_parameters;
end

disp('Ранги параметров для каждого эксперта:');
disp(array2table(ranks, 'VariableNames', strcat('Эксперт_', string(1:num_experts)), 'RowNames', parameters));

% Шаг 2: Средние ранги для параметров -> среднее значение рангов
average_ranks = mean(ranks, 2);
disp('Средние ранги параметров:');
disp(array2table(average_ranks, 'RowNames', parameters, 'VariableNames', {'Средний_рейтинг'}));

% Шаг 3: Вычисление коэффициента конкордации (согласованности мнений экспертов)
% Конкордация рассчитывается как:
% W = (12 * S) / (m^2 * (n^3 - n)),
% где S = сумма квадратов отклонений средних рангов от среднего значения
S = sum((average_ranks - mean(average_ranks)).^2) * num_experts;
m = num_experts;
n = num_parameters;
W = (12 * S) / (m^2 * (n^3 - n));

disp(['Коэффициент конкордации W: ', num2str(W)]);

% Шаг 4: Статистическая проверка значимости W
% Хи-квадрат тест: X^2 = m * (n - 1) * W
%m — количество экспертов;
%n — количество параметров (объектов ранжирования);
%W — коэффициент конкордации Кендала.
chi_square = m * (n - 1) * W;
p_value = 1 - chi2cdf(chi_square, n - 1);

disp(['Хи-квадрат: ', num2str(chi_square)]);
disp(['P-значение: ', num2str(p_value)]);

if p_value < 0.05
    disp('Согласованность мнений экспертов статистически значима (p < 0.05).');
else
    disp('Согласованность мнений экспертов не статистически значима (p >= 0.05).');
end

% Построение графика средних рангов
figure;
bar(average_ranks);
set(gca, 'XTickLabel', parameters, 'XTickLabelRotation', 45);
title('Средние ранги параметров');
ylabel('Средний ранг');
grid on;
