function [vectorMedias, matrizCovarianza, probabilidadPriori] = funcion_ajusta_LDA(X,Y)
    clases = unique(Y);
    numClases = length(clases);
    numPredictores = size(X,2);
    numDatos = size(X,1);
    vectorMedias = zeros(numPredictores, numClases, 'double');
    probabilidadPriori = zeros(1, numClases);
    matricesCovarianzas = zeros(numPredictores, numPredictores, numClases);

    for i = 1 : numClases
        indice = clases(i);
        
        indices = Y == indice;
        
        vectorMedias(:, i) = mean(X(indices,:))';
        
        mat = cov(X(indices,:));
        matricesCovarianzas(:,:,i) = (sum(indices(:)) - 1) * mat;

        probabilidadPriori(i) = sum(indices) / numDatos;
    end
    
    matrizCovarianza = sum(matricesCovarianzas, 3) / (numDatos- numClases);
end