clear
close all
clc
addpath("funciones\")
addpath("Datos\")

load("datos2dim.mat");

K = 13;
Y_Test_P = funcion_knn(XTrain, XTrain, YTrain, K);
Acc_K13 = funcion_calcula_Acc(YTrain, YTest_P);


valoresK = [1 12 49]
valoresAcc = zeros(size(valoresK));
for i = 1 : length(valoresK)
    K = valoresK(i);
    Y_Test_P = funcion_knn(XTrain, XTrain, YTrain, K);
    valoresAcc(i) = funcion_calcula_Acc(YTrain, Y_Test_P);
end