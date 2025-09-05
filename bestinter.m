function [mejorinter, ERRORES] = bestinter(A)
%[row, col] = size(A) ;
data = errorNaN(A) ; % A pero con NaN en vez de -9999

anno = data(:,1) ;
counter = 0 ;

% 2 columna
for i = 1:length(anno) % columna años
    for j = 1:length(data(1,2:end)) % datos sin años
        counter = counter + 1 ;
        mes = (j-1)/length(data(1,2:end)) ; % genera 12 alteraciones
        time(counter) = anno(i) + mes ; % counter genera que se vayan agregando
        datos(counter) = data(i,j+1) ;
        % c = c + ((i-0.5)/12) ;
    end
end
time = time' ;
datos = datos' ;

 B(:,1) = time ;
 B(:,2) = datos ; % con NaN

 % 1. escoger aleatoriamente 5% de datos de co2 
k = round(length(datos)*(0.05)); % 0.05 para el 5% !
    % randperm(n,k) n: valor máximo de datos, k: cantidad de números
R = randperm(length(datos),k); 
R= R';

 % 2. convertir a NaN
datos_005 = B(R,:); 
B(R,2) = NaN ;

 % 3. INTERPOLAR
dnnan = find(~isnan(B(:,2)));         % donde NO hay NaN   
d_nn = B(dnnan,2);                 % datos donde NO hay NaN  
f_nn = time(dnnan);                      % fecha donde NO hay NaN   

intL = interp1(f_nn, d_nn, time, 'linear');  
intN = interp1(f_nn, d_nn, time, 'nearest');
intNx = interp1(f_nn, d_nn, time, 'next');
intS = interp1(f_nn, d_nn, time, 'spline'); 
intC = interp1(f_nn, d_nn, time, 'cubic');
intM = interp1(f_nn, d_nn, time, 'makima');

 % 4. Calcular error
err_L = (datos_005(:,2) - intL(R,:));
err_N = (datos_005(:,2) - intN(R,:));
err_Nx =(datos_005(:,2) - intNx(R,:));
err_S = (datos_005(:,2) - intS(R,:));
err_C = (datos_005(:,2) - intC(R,:));
err_M = (datos_005(:,2) - intM(R,:)); 

% 4.1 media de vector de errores para comparar
error_L = mean(err_L,'omitnan'); 
error_N = mean(err_N,'omitnan'); 
error_Nx= mean(err_Nx, 'omitnan');
error_S = mean(err_S,'omitnan');
error_C = mean(err_C,'omitnan');
error_M = mean(err_M,'omitnan');
ERRORES = [error_L, error_N, error_Nx, error_M, error_S, error_C, error_M];

% 5. Elegir mejor interpolación
    %  el método con menor valor de error es el mejor !!
mejorinter = min(abs(ERRORES));


end


