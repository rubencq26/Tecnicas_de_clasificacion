function representa_NBG(X,Y)
    numDatos = size(X, 1);
    clases = unique(Y);
    numClases = length(clases);
    simbolo = ["r|", "b|", "g|", "c|", "m|", "y|", "k|"];
    
    

    

    for i = 1 : numClases
        indices = Y == clases(i);
        hold on;
        plot(X(indices, 1), X(indices, 2), simbolo(i));
        
    end
        
        xlabel('Predictor x1');
        ylabel('Predictor x2');

        texto = strings(1, numClases);

        for i = 1 : numClases
            texto(i) = "Clase " + clases(i);
        end

        legend(texto);
        title('Representación de Datos en 2 Dimensiones');
        grid on;
end