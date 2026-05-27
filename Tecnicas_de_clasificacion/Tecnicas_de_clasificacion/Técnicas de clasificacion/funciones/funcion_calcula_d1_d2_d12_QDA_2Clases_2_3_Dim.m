function [d1, d2, d12] = funcion_calcula_d1_d2_d12_QDA_2Clases_2_3_Dim(X, Y)
    [medias, covarianzas, probabilidadPriori] = funcion_ajusta_QDA(X,Y);
    
    numPredictores = size(X,2);
    mu_1 = medias(:, 1);
    mu_2 = medias(:,2);

    mat_1 = covarianzas(:,:,1);
    mat_2 = covarianzas(:,:,2);

    pp_1 = probabilidadPriori(1);
    pp_2 = probabilidadPriori(2);

    if numPredictores == 2
        x1 = sym('x1', 'real');
        x2 = sym('x2', 'real');
        
        x = [x1 ; x2];
    elseif numPredictores == 3
        x1 = sym('x1', 'real');
        x2 = sym('x2', 'real');
        x3 = sym('x3', 'real');
        x = [x1 ; x2; x3];

    end

    dato1 = -0.5 *(x - mu_1)' * pinv(mat_1) * (x - mu_1);
    lmat1 = -0.5 *log(det(mat_1));
    lpp1 = log(pp_1);
    d1 = expand(dato1 + lmat1 + lpp1);
    
    dato2 = -0.5 *(x - mu_2)' * pinv(mat_2) * (x - mu_2);
    lmat2 = -0.5 *log(det(mat_2));
    lpp2 = log(pp_2);
    d2 = expand(dato2 + lmat2 + lpp2);

    d12 = d1 - d2;
end