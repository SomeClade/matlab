% Критерии
criteria = {'Качество зерна', 'Цена зерна', 'Транспортные расходы', ...
            'Форма оплаты', 'Минимальная партия', 'Надежность поставки'};

% Ранги критериев (по таблице задания)
ranks = [1, 2, 5, 4, 3, 6];

% Построение матрицы парных сравнений
n = length(ranks);
comparison_matrix = zeros(n);

% Заполнение матрицы парных сравнений
for i = 1:n
    for j = 1:n
        comparison_matrix(i, j) = ranks(i) / ranks(j);
    end
end

disp('Матрица парных сравнений:');
disp(comparison_matrix);

% Проведение итерационного процесса
iterations = 3; % Количество итераций
weights = ones(n, 1) / n; % Начальная инициализация весов (равномерные)
disp('Начальные веса:');
disp(weights);

for iter = 1:iterations
    % Умножение матрицы парных сравнений на текущие веса
    new_weights = comparison_matrix * weights;
    
    % Нормализация новых весов
    weights = new_weights / sum(new_weights);
    
    % Вывод результатов на каждой итерации
    disp(['Итерация ', num2str(iter), ':']);
    disp(weights);
end

% Результат: итерированная сила критериев
disp('Итоговая итерированная сила критериев(относительная важность критериев):');
disp(array2table(weights, 'RowNames', criteria, 'VariableNames', {'Итерированная сила'}));

% Значимость критериев
significance = weights / sum(weights) * 100;
disp('Значимость критериев (в %):');
disp(array2table(significance, 'RowNames', criteria, 'VariableNames', {'Значимость (%)'}));

% Построение графика значимости критериев
figure;
bar(significance);
set(gca, 'XTickLabel', criteria, 'XTickLabelRotation', 45);
title('Значимость критериев');
ylabel('Значимость (%)');
grid on;
