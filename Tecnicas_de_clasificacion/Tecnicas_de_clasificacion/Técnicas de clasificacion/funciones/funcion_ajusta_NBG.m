function [medias, desviaciones, probabilidadPriori] = funcion_ajusta_NBG(X, Y)
    numPredictores = size(X,2);
    numClases = length(unique(Y));
    medias = zeros(numPredictores, numClases, 'double');
    desviaciones = zeros(numPredictores, numClases, 'double');
    probabilidadPriori = zeros(1, numClases, 'double');
    for i = 1 : numClases
        medias(:, i) = mean(X(Y==i, :))';
        desviaciones(:, i) = std(X(Y==i, :))';
        probabilidadPriori(i) = sum(Y == i) / length(Y);
    end
end