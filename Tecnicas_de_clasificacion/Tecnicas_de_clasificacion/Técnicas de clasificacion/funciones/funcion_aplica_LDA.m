function [Y_LDA,d] = funcion_aplica_LDA(X, vectorMedias, matrizCovarianza, probabilidadPriori, valoresClases)
    numDatos = size(X,1);
    numClases = length(valoresClases);
    
    dx = zeros(numDatos, numClases, 'double');
    invCov = pinv(matrizCovarianza);
   

    for k = 1 : numClases
        mu_k = vectorMedias(:, k);
        
        pp_k = log(probabilidadPriori(k));
        
        for j =  1 : numDatos
            x = X(j, :)';
            
            dx(j,k) = - 0.5 * (x - mu_k)' * invCov * (x - mu_k) + pp_k;

        end
    end
    
    [d, indice_maximo] = max(dx, [], 2);

    Y_LDA = valoresClases(indice_maximo);

end