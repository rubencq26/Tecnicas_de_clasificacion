function representa_NGB3(X,Y);
    clases = unique(Y);
    numClases = length(clases);
    simbolo = ["ro", "bo", "go", "co", "mo", "yo", "ko"];
    
    

    

    for i = 1 : numClases
        indices = Y == clases(i);
        hold on;
        plot3(X(indices, 1), X(indices, 2), X(indices,3), simbolo(i));
        
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