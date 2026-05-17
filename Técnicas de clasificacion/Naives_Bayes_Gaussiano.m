close all, clear,  clc;

addpath("Datos\");
addpath("funciones\");

% dos dimensiones
load("datos2dim.mat");

[medias, desviaciones, probabilidadPriori] = funcion_ajusta_NBG(XTest, YTest);

[Y_NGB, d] = funcion_aplica_NBG(XTest, medias, desviaciones, probabilidadPriori, unique(YTrain));




% Pagina 95