%% Задание по NumPy
% Сформировать 50 файлов, в каждый из которых записать матрицу 100х100 из 
% случайных целых чисел в диапазоне от -100 до 100. Для матриц сравнить время 
% работы алгоритмов (согласно номеру варианта), реализованных в MATLAB и Python (Numpay).
% Результаты записать во вновь созданные 50 файлов.

%% 9 вариант

clc, clear

% открытие файла для записи времени
f3 = fopen('time_Matlab.txt', "w");

for i = 1:50
    tic;
    
    % открытие матриц
    filename = "item_" + i + ".txt";
    f = fopen(filename, "r");
    
    % чтение файла
    result = readmatrix(filename);

    % создание файлов для записи результата разложения
    filename1 = "res_" + i + "_1.txt";
    filename2 = "res_" + i + "_2.txt";
    f1 = fopen(filename1, "w");
    f2 = fopen(filename2, "w");

    % вычисление разложения
    [Q, R] = qr(result);

    % запись в файлы
    writematrix(Q, filename1)
    writematrix(R, filename2)

    % подсчет времени и запись в файл time_Matlab.txt
    t = toc;
    fprintf(f3, '%f\n', t);

    fclose(f);
    fclose(f1);
    fclose(f2);
end

fclose(f3);


