% Метод анализа иерархий (AHP) для выбора лучшего телефона

% Названия критериев и альтернатив
criteria = {'Стоимость', 'Качество экрана', 'Производительность', ...
            'Камера', 'Батарея', 'Дизайн'};
alternatives = {'Телефон 1', 'Телефон 2', 'Телефон 3', 'Телефон 4', ...
                'Телефон 5', 'Телефон 6'};

% Матрица парных сравнений для критериев
criteria_matrix = [
    1     3     5     7     9     2;   % Стоимость
    1/3   1     3     5     7     1/2; % Качество экрана
    1/5   1/3   1     3     5     1/7; % Производительность
    1/7   1/5   1/3   1     3     1/9; % Камера
    1/9   1/7   1/5   1/3   1     1/9; % Батарея
    1/2   2     7     9     9     1    % Дизайн
];

% Нормализация матрицы критериев
criteria_sum = sum(criteria_matrix, 1);
normalized_matrix = criteria_matrix ./ criteria_sum;

% Расчет весов критериев
criteria_weights = mean(normalized_matrix, 2);

disp('Веса критериев:');
disp(array2table(criteria_weights, 'RowNames', criteria, 'VariableNames', {'Вес'}));

% Матрицы парных сравнений для альтернатив по каждому критерию
alternatives_matrices = {
    % Стоимость
    [1, 1/3, 1/5, 1/7, 1/9, 1/2;
     3, 1, 1/3, 1/5, 1/7, 2;
     5, 3, 1, 1/3, 1/5, 7;
     7, 5, 3, 1, 1/3, 9;
     9, 7, 5, 3, 1, 9;
     2, 1/2, 1/7, 1/9, 1/9, 1],
    % Качество экрана
    [1, 1/2, 1/3, 1/5, 1/7, 1/4;
     2, 1, 1/2, 1/3, 1/5, 1/2;
     3, 2, 1, 1/2, 1/3, 1;
     5, 3, 2, 1, 1/2, 2;
     7, 5, 3, 2, 1, 3;
     4, 2, 1, 1/2, 1/3, 1],
    % Производительность
    [1, 1/3, 1/5, 1/7, 1/9, 1/2;
     3, 1, 1/3, 1/5, 1/7, 2;
     5, 3, 1, 1/3, 1/5, 7;
     7, 5, 3, 1, 1/3, 9;
     9, 7, 5, 3, 1, 9;
     2, 1/2, 1/7, 1/9, 1/9, 1],
    % Камера
    [1, 1/2, 1/3, 1/5, 1/7, 1/4;
     2, 1, 1/2, 1/3, 1/5, 1/2;
     3, 2, 1, 1/2, 1/3, 1;
     5, 3, 2, 1, 1/2, 2;
     7, 5, 3, 2, 1, 3;
     4, 2, 1, 1/2, 1/3, 1],
    % Батарея
    [1, 1/2, 1/3, 1/5, 1/7, 1/4;
     2, 1, 1/2, 1/3, 1/5, 1/2;
     3, 2, 1, 1/2, 1/3, 1;
     5, 3, 2, 1, 1/2, 2;
     7, 5, 3, 2, 1, 3;
     4, 2, 1, 1/2, 1/3, 1],
    % Дизайн
    [1, 1/2, 1/3, 1/5, 1/7, 1/4;
     2, 1, 1/2, 1/3, 1/5, 1/2;
     3, 2, 1, 1/2, 1/3, 1;
     5, 3, 2, 1, 1/2, 2;
     7, 5, 3, 2, 1, 3;
     4, 2, 1, 1/2, 1/3, 1]
};

% Расчет весов альтернатив для каждого критерия
alternative_weights = zeros(length(alternatives), length(criteria));
for i = 1:length(criteria)
    % Матрица парных сравнений для текущего критерия
    current_matrix = alternatives_matrices{i};
    
    % Нормализация
    current_sum = sum(current_matrix, 1);
    normalized_current_matrix = current_matrix ./ current_sum;
    
    % Вес для альтернатив
    alternative_weights(:, i) = mean(normalized_current_matrix, 2);
end

% Итоговые веса альтернатив
final_weights = alternative_weights * criteria_weights;

% Определение лучшего варианта
[best_score, best_alternative] = max(final_weights);

% Вывод результатов
disp('Итоговые веса альтернатив:');
disp(array2table(final_weights, 'RowNames', alternatives, 'VariableNames', {'Оценка'}));
disp(['Лучший телефон: ', alternatives{best_alternative}, ' с оценкой ', num2str(best_score)]);

% Построение графика
figure;
bar(final_weights);
set(gca, 'XTickLabel', alternatives, 'XTickLabelRotation', 45);
title('Итоговые оценки телефонов');
ylabel('Оценка');
grid on;
