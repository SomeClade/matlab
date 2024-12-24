% Данные из таблицы
x = [-1, -0.5, 0, 0.2, 1]; % Значения переменной x
y = [1, 0.25, 0, 0.4, 1];  % Значения переменной y

% Создание нечеткой системы типа Mamdani
fis = mamfis('Name', 'NeyctkayaSistema');

% Добавление входной переменной x
fis = addInput(fis, [-1 1], 'Name', 'x');
fis = addMF(fis, 'x', 'gaussmf', [0.3 -1], 'Name', 'Low');      % Sigma=0.3, Center=-1
fis = addMF(fis, 'x', 'gaussmf', [0.3 0], 'Name', 'Medium');    % Sigma=0.3, Center=0
fis = addMF(fis, 'x', 'gaussmf', [0.3 1], 'Name', 'High');      % Sigma=0.3, Center=1

% Добавление выходной переменной y
fis = addOutput(fis, [0 1], 'Name', 'y');
fis = addMF(fis, 'y', 'gaussmf', [0.1 0], 'Name', 'Low');       % Sigma=0.1, Center=0
fis = addMF(fis, 'y', 'gaussmf', [0.1 0.5], 'Name', 'Medium');  % Sigma=0.1, Center=0.5
fis = addMF(fis, 'y', 'gaussmf', [0.1 1], 'Name', 'High');      % Sigma=0.1, Center=1

% Добавление правил
ruleList = [...
    1 1 1 1;  % Если x Low, то y Low
    2 2 1 1;  % Если x Medium, то y Medium
    3 3 1 1;  % Если x High, то y High
];
fis = addRule(fis, ruleList);

% Построение FIS
figure;
plotfis(fis);

% Симуляция системы
inputX = linspace(-1, 1, 100); % Плавные значения x
outputY = zeros(size(inputX)); % Массив для выхода y

for i = 1:length(inputX)
    outputY(i) = evalfis(fis, inputX(i)); % Вычисление выхода
end

% Построение графика зависимости
figure;
plot(inputX, outputY, 'LineWidth', 2);
grid on;
title('Зависимость y от x');
xlabel('x');
ylabel('y');

% Анализ результата
disp('Тип кривой: на основании графика можно сделать вывод, что зависимость нелинейная.');
