function [b] = errorNaN(a)
[row, col] = size(a); %row y col del tamaño de la matriz
b = a ; %reasignar la matriz a otra para editarla y alterar original
[row , col] = find(a == -9999); % busca este tipo de dato en matriz

for i=1:length(row)
    b(row(i) , col(i)) = NaN; %parte del 1 y termina en el largo de a1
end
end
