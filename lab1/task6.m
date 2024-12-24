% Задача 6: Нечеткие множества A и B
A = [0.4/5, 0.7/6, 1/7, 0.8/8, 0.6/9];
B = [0.8/1, 0.8/3, 0.5/4];

% Концентрация множества (CON)
CON_A = A.^2; % Повышение степени принадлежности
CON_B = B.^2;

% Дилатация множества (DIL)
DIL_A = sqrt(A); % Уменьшение степени принадлежности
DIL_B = sqrt(B);

% Графики
figure;
subplot(2, 1, 1);
stem(1:length(A), A, 'DisplayName', 'A'); hold on;
stem(1:length(CON_A), CON_A, 'DisplayName', 'CON(A)');
stem(1:length(DIL_A), DIL_A, 'DisplayName', 'DIL(A)');
legend;
title('График множеств A, CON(A), DIL(A)');
grid on;

subplot(2, 1, 2);
stem(1:length(B), B, 'DisplayName', 'B'); hold on;
stem(1:length(CON_B), CON_B, 'DisplayName', 'CON(B)');
stem(1:length(DIL_B), DIL_B, 'DisplayName', 'DIL(B)');
legend;
title('График множеств B, CON(B), DIL(B)');
grid on;
