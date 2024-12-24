% Задача 7: Функция принадлежности
U = 0:0.1:5;

% Определение функции принадлежности
mu_A = zeros(size(U));
for i = 1:length(U)
    if U(i) <= 2
        mu_A(i) = 0.5 - 0.5 * sin(pi * (U(i) - 1));
    end
end

% Концентрация и дилатация
CON_A = mu_A.^2; % Концентрация
DIL_A = sqrt(mu_A); % Дилатация

% Графики
figure;
plot(U, mu_A, 'DisplayName', 'A'); hold on;
plot(U, CON_A, 'DisplayName', 'CON(A)');
plot(U, DIL_A, 'DisplayName', 'DIL(A)');
legend;
title('Функции принадлежности A, CON(A), DIL(A)');
xlabel('U');
ylabel('\mu(U)');
grid on;
