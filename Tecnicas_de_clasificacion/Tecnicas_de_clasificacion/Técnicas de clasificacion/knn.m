clear
close all
clc
addpath("funciones\")
addpath("Datos\")

% 2 dimensiones
load("datos2dim.mat");

nDatos = size(XTrain,1);

n70 = nDatos * 0.7;

XT = XTrain(1:n70, :);
XV = XTrain(n70+1:end, :);
YT = YTrain(1:n70, :);
YV = YTrain(n70+1:end, :);

k = funcion_ajusta_knn(XV,YV, XT, YT);

Y_KNN = funcion_knn(XTest, XTrain, YTrain, k);

    % ver algoritmo
    figure;
    funcion_representa_datos2dim(XTrain, YTrain);
    hold on;
    funcion_representa_knn(XTrain, YTrain,k);
    title(k);
    hold off;
    % ver resultados
    figure;
    funcion_representa_datos2dim(XTest, Y_KNN);
    hold on;
    ac = sum(YTest == Y_KNN)
    aciertos = ac/length(YTest)
    title("k: " + k + "  aciertos:" + aciertos);
    funcion_representa_knn(XTrain, YTrain, k);
    hold off;

    figure;
    funcion_representa_datos2dim(XTest, YTest);
    title("YTest Real");
    hold on;
    funcion_representa_knn(XTrain, YTrain, k);
    hold off;

% 3 dimensiones

load("datos3dim.mat");

nDatos = size(XTrain,1);

n70 = nDatos * 0.7;

XT = XTrain(1:n70, :);
XV = XTrain(n70+1:end, :);
YT = YTrain(1:n70, :);
YV = YTrain(n70+1:end, :);

k = funcion_ajusta_knn(XV,YV, XT, YT);

Y_KNN = funcion_knn(XTest, XTrain, YTrain, k);

    % ver algoritmo
    figure;
    funcion_representa_datos3dim(XTrain, YTrain);
    hold on;
    funcion_representa_knn(XTrain, YTrain,k);
    title(k);
    hold off;
    % ver resultados
    figure;
    funcion_representa_datos3dim(XTest, Y_KNN);
    hold on;
    aciertos = double(sum(YTest == Y_KNN)/length(YTest));
    title("k: " + k + "  aciertos: " + aciertos);
    funcion_representa_knn(XTrain, YTrain, k);
    hold off;

    figure;
    funcion_representa_datos3dim(XTest, YTest);
    title("YTest Real");
    hold on;
    funcion_representa_knn(XTrain, YTrain, k);
    hold off;


