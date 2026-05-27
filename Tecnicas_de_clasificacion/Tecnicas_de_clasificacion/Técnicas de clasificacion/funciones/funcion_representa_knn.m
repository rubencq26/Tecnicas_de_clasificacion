function funcion_representa_knn(XTrain, YTrain, k)
    nPredictores = size(XTrain,2);
    clases = unique(YTrain);
    nClases = length(clases);

    if nPredictores == 2
        x1Min = min(XTrain(:,1));
        x1Max = max(XTrain(:,1));
        x2min = min(XTrain(:,2));
        x2max = max(XTrain(:,2));
        paso = 0.1;

        [X1Grid, X2Grid] = meshgrid(x1Min:paso:x1Max,x2min:paso:x2max);
        XGrid = [X1Grid(:), X2Grid(:)];
        
        simbolo = ["r|", "b|", "g|", "c|", "m|", "y|", "k|"];

        YGrid = funcion_knn(XGrid, XTrain, YTrain, k);
        
        for i = 1 : nClases
            B = YGrid == clases(i);
            plot(XGrid(B,1),XGrid(B,2), simbolo(i));
        end

    elseif nPredictores == 3
        x1Min = min(XTrain(:,1));
        x1Max = max(XTrain(:,1));
        x2min = min(XTrain(:,2));
        x2max = max(XTrain(:,2));
        x3min = min(XTrain(:,3));
        x3max = max(XTrain(:,3));
        paso = 0.33;
        [X1Grid, X2Grid, X3Grid] = meshgrid(x1Min:paso:x1Max, x2min:paso:x2max, x3min:paso:x3max);
        XGrid = [X1Grid(:), X2Grid(:), X3Grid(:)];
        
        YGrid = funcion_knn(XGrid, XTrain, YTrain, k);
        
        simbolo = ["ro", "bo", "go", "co", "mo", "yo", "ko"];

        for i = 1 : nClases
            B = YGrid == clases(i);
            plot3(XGrid(B,1),XGrid(B,2), XGrid(B,3), simbolo(i));
        end

    end
   
end