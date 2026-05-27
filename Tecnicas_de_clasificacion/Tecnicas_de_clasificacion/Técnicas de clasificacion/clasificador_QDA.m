clear, close all, clc;

addpath("Datos\");
addpath("funciones\");

% 2 dimensiones
load("datos2dim.mat");

[vectorMedias, matrizCovarianzas, probabilidadPriori] = funcion_ajusta_QDA(XTrain, YTrain);

[Y_QDA, d] = funcion_aplica_QDA(XTest, vectorMedias, matrizCovarianzas, probabilidadPriori, unique(YTrain));
[d1, d2, d12] = funcion_calcula_d1_d2_d12_QDA_2Clases_2_3_Dim(XTrain, YTrain);
vpa(d12, 4)

    % visualizar datos de entrenamiento
    
    funcion_representa_datos2dim(XTrain, YTrain);
    hold on;
    fimplicit(d12);
    hold off;
    % Visualizar resultados de la clasificación
    
    funcion_representa_datos2dim(XTest, Y_QDA);
    hold on;
    fimplicit(d12);

    MAccuracy = YTest == Y_QDA;
    accuracy = sum(MAccuracy(:))/size(Y_QDA,1);
    title(accuracy);

    hold off;
    figure;
    funcion_representa_datos2dim(XTest, YTest);
    hold on;
    fimplicit(d12);
    title("Representacion real de los datos de prueba")
    hold off;

% 3 dimensiones
load("datos3dim.mat");
[vectorMedias, matrizCovarianzas, probabilidadPriori] = funcion_ajusta_QDA(XTrain, YTrain);

[Y_QDA, d] = funcion_aplica_QDA(XTest, vectorMedias, matrizCovarianzas, probabilidadPriori, unique(YTrain));
[d1, d2, d12] = funcion_calcula_d1_d2_d12_QDA_2Clases_2_3_Dim(XTrain, YTrain);
vpa(d12, 4)

    % visualizar datos de entrenamiento
    
    funcion_representa_datos3dim(XTrain, YTrain);
    hold on;
    fimplicit3(d12);
    hold off;
    % Visualizar resultados de la clasificación
    
    funcion_representa_datos3dim(XTest, Y_QDA);
    hold on;
    fimplicit3(d12);

    MAccuracy = YTest == Y_QDA;
    accuracy = sum(MAccuracy(:))/size(Y_QDA,1);
    title(accuracy);

    hold off;
    figure;
    funcion_representa_datos3dim(XTest, YTest);
    hold on;
    fimplicit3(d12);
    title("Representacion real de los datos de prueba")
    hold off;