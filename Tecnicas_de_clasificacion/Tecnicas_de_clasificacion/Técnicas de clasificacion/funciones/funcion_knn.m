function YTest = funcion_knn(XTest, XTrain, YTrain, k)
    nDatosTest = size(XTest, 1);
    clases = unique(YTrain);
    nClases = length(clases);
    YTest = zeros(nDatosTest, 1, 'double');
    for i = 1 : nDatosTest
        x = XTest(i, :);
        
        MD = funcion_calcula_distancias_euclideas(x, XTrain);
        [~, indices] = sort(MD, 'ascend');
        
        yx = zeros(1, nClases, 'double');
        for j = 1 : k
            y = YTrain(indices(j));
            yx(clases == y) = yx(clases == y) + 1;
        end
        
        valorMax = max(yx);
        index = find(yx == valorMax);
        
        if length(index) > 1
            clasesEmpatadas = clases(index);

            for v = 1 : k
                claseVecinoActual = YTrain(indices(v));
                
                if any(clasesEmpatadas == claseVecinoActual)
                    YTest(i) = claseVecinoActual; 
                    break; 
                end
            end
          
        else
            YTest(i) = clases(index(1)); 
        end
    end
    
   
end