function funcion_representa_datos3dim(X, Y)
    
    clases = unique(Y);
    numClases = length(clases);
    simbolo = ["r*", "b*", "g*", "c*", "m*", "y*", "k*"];
    
    

    

    for i = 1 : numClases
        indices = Y == clases(i);

        plot3(X(indices, 1), X(indices, 2), X(indices,3), simbolo(i));
        hold on;
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
        hold off;
end