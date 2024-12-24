% Задача 10: Нечеткое множество
U = {'a', 'b', 'c', 'd', 'e'};
A = [0.8, 0.6, 0.9, 0.1, 0];

% Концентрация и дилатация
B = A.^2; % CON(A)
C = sqrt(A); % DIL(A)

% Результаты
disp('CON(A):');
disp(B);
disp('DIL(A):');
disp(C);