function [Y_NBG, d] = funcion_aplica_NBG(X, medias, desviaciones, probabilidadPriori, valoresClases)
    numClases = length(valoresClases);
    numDatos = size(X, 1);
    numPredictores = size(X, 2);

    d = zeros(numDatos, numClases, 'double');
    
    for c = 1 : numClases
        suma_predictores = zeros(numDatos, 1);
        log_prob_clase = log(probabilidadPriori(c));

        for i = 1 : numPredictores
            mu = medias(i, c);
            sigma = desviaciones(i, c);
            
            gaussiana = (1 / (sqrt(2 * pi) * sigma)) * exp(-((X(:, i) - mu).^2) / (2 * sigma^2));
            suma_predictores = suma_predictores + log(gaussiana + eps);
        end
        d(:, c) = log_prob_clase + suma_predictores;
    end

    [~, indiceMaximo] = max(d, [], 2);
    Y_NBG = valoresClases(indiceMaximo);

    Y_NBG = Y_NBG(:);

end