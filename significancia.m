function [Tc, alpha_95, alpha_98, alpha_99] = significancia(x, y)
    % Inputs:
    % x, y = vectores numéricos (base de datos) del mismo tamaño
    % nombre_x/y = strings con nombres de las series (para mostrar en la consola)
    % Ej: El Manzano, La Rufina
    % nombre_x, nombre_y

    % 1) Eliminar NaN
    valid_idx = ~isnan(x) & ~isnan(y);
    x_valid = x(valid_idx);
    y_valid = y(valid_idx);
    N = length(x_valid);

    % 2) Correlación de Pearson
    R = corr(x_valid, y_valid, 'Type','Pearson');
%    fprintf('Correlación entre %s y %s: %.4f\n', nombre_x, nombre_y, R);

    % 3) Calcular Tc
    Tc = (R * sqrt(N - 2)) / sqrt(1 - R^2);
    
  %  fprintf('Estadístico Tc: %.4f (N=%d)\n', Tc, N);
% 3.1) Calcular nivel de significancia (95%)
alpha_95 = 1 - (95/100) ;
% 3.2) Calcular nivel de significancia (98%)
alpha_98 = 1 - (98/100) ;
% 3.3) Calcular nivel de significancia (99%)
alpha_99 = 1 - (99/100) ;

    % fprintf('Nivel de significancia para 95%%: alpha = %.4f\n', alpha_95);
    % fprintf('Nivel de significancia para 98%%: alpha = %.4f\n', alpha_98);
    % fprintf('Nivel de significancia para 99%%: alpha = %.4f\n', alpha_99);
end
