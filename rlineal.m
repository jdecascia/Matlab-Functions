function [pf1, pf2, pf3, pf4, pv1, pv2, pv3, pv4] = rlineal(B)
B1=B;
datnan = isnan(B(:,2)) ;

donde_nan = find(datnan == 1) ;  %encuentra los NaN(1)
B1(donde_nan,:)=[] ;  % B1(:,1)=year sinNaN ; B1(:,2)=datos sin NaN   

%POLYFITS: genera recta o polinomio ajustado a la serie
pf1 = polyfit(B1(:,1), B1(:,2), 1) ; % grado 1  
pf2 = polyfit(B1(:,1), B1(:,2), 2) ; % grado 2
pf3 = polyfit(B1(:,1), B1(:,2), 3) ; % grado 3
pf4 = polyfit(B1(:,1), B1(:,2), 4) ; % grado 4

%POLYVALS: genera gráfico del polinomio creado con polyfit
pv1 = polyval(pf1, B1(:,1)) ; % (polyfit, año)
pv2 = polyval(pf2, B1(:,1)) ;
pv3 = polyval(pf3, B1(:,1)) ;
pv4 = polyval(pf4, B1(:,1)) ;
end