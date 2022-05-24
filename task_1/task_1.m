%% Задание по SYMPY 
% Вычислить неопределенный интеграл. В цикле вычислить определенные интегралы для ста вариантов 
% верхнего и нижнего пределов (пределы и константы (a,b,...) задать самостоятельно). 
% Результаты записать в текстовый файл. 
% Сравнить результаты вычисления и время вычислений в MATLAB и Python. 
% Оформить отчет в Microsoft Word.

%% ВАРИАНТ 9
clc, clear

syms x 
a = 5;

% функция
func = a^x;

% неопределенный интеграл
int(func)

% определенные интегралы 
upp = [1:10];
down = [10:19];

% открыли файл на чтение
f = fopen('task_1_matlab.txt','w');

tic;

for u = upp
    for d = down
        fprintf(f,'%f\n',double(int(func, u, d)));
    end
end

time_end = toc

% закрыли файл
fclose(f); 

%%  проверка двух файлов
clc
file_P = fopen('task_1_matlab.txt','r');
file_M = fopen('task_1_matlab.txt','r');

formatSpec = '%f';

size = [1 Inf];
result_MatLab = fscanf(file_M ,formatSpec, size);
result_Python = fscanf(file_P ,formatSpec, size);

fclose(file_M); 
fclose(file_P);

% сравнение результатов 
all(result_MatLab == result_Python)
