function [B] = bigmatrix(A, annoi, annof)
c = 0;
B(:,1) = [annoi:annof];
for i=1:length(B(:,1))
% Haremos que traspase la columna 2 a 2:13 con un salto de 12 datos (1 año)
    B(i,2:13) = A(1+c:12+c, 2);
c = c + 12 ; %Para hacer el ciclo de salto
end
end