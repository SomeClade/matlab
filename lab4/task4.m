% Создание нечеткой системы типа Mamdani
fis = mamfis('Name', 'ControlSystem');

% Добавление входных переменных
fis = addInput(fis, [-1 1], 'Name', 'Error');
fis = addInput(fis, [-1 1], 'Name', 'DeltaError');

% Добавление выходной переменной
fis = addOutput(fis, [-1 1], 'Name', 'ControlSignal');

% Установка функций принадлежности для Error
fis = addMF(fis, 'Error', 'trimf', [-1 -1 -0.5], 'Name', 'BN');
fis = addMF(fis, 'Error', 'trimf', [-1 -0.5 0], 'Name', 'N');
fis = addMF(fis, 'Error', 'trimf', [-0.5 0 0.5], 'Name', 'Z');
fis = addMF(fis, 'Error', 'trimf', [0 0.5 1], 'Name', 'P');
fis = addMF(fis, 'Error', 'trimf', [0.5 1 1], 'Name', 'BP');

% Установка функций принадлежности для DeltaError
fis = addMF(fis, 'DeltaError', 'trimf', [-1 -1 -0.5], 'Name', 'BN');
fis = addMF(fis, 'DeltaError', 'trimf', [-1 -0.5 0], 'Name', 'N');
fis = addMF(fis, 'DeltaError', 'trimf', [-0.5 0 0.5], 'Name', 'Z');
fis = addMF(fis, 'DeltaError', 'trimf', [0 0.5 1], 'Name', 'P');
fis = addMF(fis, 'DeltaError', 'trimf', [0.5 1 1], 'Name', 'BP');

% Установка функций принадлежности для ControlSignal
fis = addMF(fis, 'ControlSignal', 'trimf', [-1 -1 -0.5], 'Name', 'BN');
fis = addMF(fis, 'ControlSignal', 'trimf', [-1 -0.5 0], 'Name', 'N');
fis = addMF(fis, 'ControlSignal', 'trimf', [-0.5 0 0.5], 'Name', 'Z');
fis = addMF(fis, 'ControlSignal', 'trimf', [0 0.5 1], 'Name', 'P');
fis = addMF(fis, 'ControlSignal', 'trimf', [0.5 1 1], 'Name', 'BP');

% Добавление правил
ruleList = [...
    1 1 1 1 1; % BN + BN -> BN
    1 2 1 1 1; % BN + N -> BN
    1 3 2 1 1; % BN + Z -> N
    1 4 3 1 1; % BN + P -> Z
    1 5 4 1 1; % BN + BP -> P
    
    2 1 1 1 1; % N + BN -> BN
    2 2 2 1 1; % N + N -> N
    2 3 3 1 1; % N + Z -> Z
    2 4 4 1 1; % N + P -> P
    2 5 4 1 1; % N + BP -> P

    3 1 2 1 1; % Z + BN -> N
    3 2 3 1 1; % Z + N -> Z
    3 3 3 1 1; % Z + Z -> Z
    3 4 4 1 1; % Z + P -> P
    3 5 5 1 1; % Z + BP -> BP

    4 1 3 1 1; % P + BN -> Z
    4 2 4 1 1; % P + N -> P
    4 3 4 1 1; % P + Z -> P
    4 4 5 1 1; % P + P -> BP
    4 5 5 1 1; % P + BP -> BP

    5 1 4 1 1; % BP + BN -> P
    5 2 4 1 1; % BP + N -> P
    5 3 5 1 1; % BP + Z -> BP
    5 4 5 1 1; % BP + P -> BP
    5 5 5 1 1; % BP + BP -> BP
];
fis = addRule(fis, ruleList);

% Визуализация системы
figure;
plotfis(fis);
title('Структура FIS');

% Эксперименты с различными методами дефаззификации
inputData = [-0.7, 0.3]; % Пример входных значений
methods = {'centroid', 'bisector', 'lom', 'mom', 'som'};
results = zeros(1, length(methods));

fprintf('Метод дефаззификации и результаты:\n');
for i = 1:length(methods)
    fis.DefuzzificationMethod = methods{i};
    results(i) = evalfis(fis, inputData);
    fprintf('Метод: %s, Результат: %.3f\n', methods{i}, results(i));
end

% Построение графика поверхности вывода
figure;
gensurf(fis);
title('Поверхность вывода для FIS');
xlabel('Ошибка');
ylabel('Изменение ошибки');
zlabel('Управляющий сигнал');
