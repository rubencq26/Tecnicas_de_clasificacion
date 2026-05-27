function [Y_QDA,d] = funcion_aplica_QDA(X, vectorMedias, matricesCovarianzas, probabilidadPriori, valoresClases)
    numDatos = size(X,1);
    numClases = length(valoresClases);
    
    dx = zeros(numDatos, numClases, 'double');

    for k = 1 : numClases
        mu_k = vectorMedias(:, k);
        matriz_k = matricesCovarianzas(:,:,k);
        pp_k = probabilidadPriori(k);

        for j =  1 : numDatos
            x = X(j, :)';
            
            dx(j,k) = - 0.5 * (x - mu_k)' * pinv(matriz_k) * (x - mu_k) - 0.5 * log(det(matriz_k)) + log(pp_k);

        end
    end
    
    [d, indice_maximo] = max(dx, [], 2);

    Y_QDA = valoresClases(indice_maximo);

end