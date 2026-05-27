close all, clear,  clc;

addpath("Datos\");
addpath("funciones\");

% dos dimensiones
load("datos2dim.mat");

[medias, desviaciones, probabilidadPriori] = funcion_ajusta_NBG(XTest, YTest);

[Y_NGB, d] = funcion_aplica_NBG(XTest, medias, desviaciones, probabilidadPriori, unique(YTrain));
    
 
 [X1grid, X2grid] = meshgrid(X1min:paso:X1max, X2min:paso:X2max);

 XGrid = [X1grid(:), X2grid(:)];

 YN = funcion_aplica_NBG(XGrid, medias, desviaciones,  probabilidadPriori, unique(YTrain));

 representa_NBG(XGrid, YN)

 YAcierto = Y_NGB == YTest;

 NAcierto = sum(YAcierto(:));
 accuracy = NAcierto/size(YTest,1);
 
 
 % 3 dimensiones
 load("datos3dim.mat");
 
 [medias, desviaciones, probabilidadPriori] = funcion_ajusta_NBG(XTest, YTest);
 [Y_NGB, d] = funcion_aplica_NBG(XTest, medias, desviaciones, probabilidadPriori, unique(YTrain));

 x1min = min(XTrain(:,1));
 x1max = max(XTrain(:, 1));
 x2min = min(XTrain(:, 2));
 x2max = max(XTrain(:, 2));
 x3min = min(XTrain(:,3));
 X3max = max(XTrain(:, 3));
 paso =0.33;
 
 [X1Grid, X2Grid, X3Grid] = meshgrid(x1min:paso:x1max, x2min:paso:x2max, x3min:paso:X3max);

 XGrid = [X1Grid(:), X2Grid(:), X3Grid(:)];
 
 YN = funcion_aplica_NBG(XGrid, medias, desviaciones, probabilidadPriori, unique(YTrain));

 [Y_NGB, d] = funcion_aplica_NBG(XTest, medias, desviaciones, probabilidadPriori, unique(YTrain));

 %representar datos Train
 funcion_representa_datos3dim(XTrain, YTrain);
 representa_NGB3(XGrid, YN);

 %representar datos Test
 funcion_representa_datos3dim(XTest, Y_NGB);
 YAcierto = Y_NGB == YTest;

 NAcierto = sum(YAcierto(:));
 accuracy = NAcierto/size(YTest,1)
 title(accuracy);
  
% Pagina 95
% isMember()