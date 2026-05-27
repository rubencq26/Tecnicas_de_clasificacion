function [k] = funcion_ajusta_knn(XTest,YTest, XTrain, YTrain)
    clases = unique(YTrain);
    nClases = length(clases);
    nDatos = size(XTest,1);
    nDatosClase = zeros(1, nClases, 'double');

    for i = 1 : nClases
        B = YTrain == clases(i);
        nDatosClase(i) = sum(B);
    end

    maxDatos  = max(nDatosClase);
    
    vectork = 2:2:maxDatos;
    resultados = zeros(1, length(vectork), 'double');


    for i = 1 : length(vectork)
        K = vectork(i);
        Y = funcion_knn(XTest,XTrain, YTrain,K);
        
        resultados(i) = sum(Y == YTest)/nDatos;

    end
    
    [~, indice] = max(resultados);
    k = vectork(indice);
    
end