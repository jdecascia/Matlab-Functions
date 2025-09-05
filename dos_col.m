function [B] = dos_col(datos)
anno = datos(:,1) ;
counter = 0 ;

for i = 1:length(anno) % columna años

    for j = 1:length(datos(1,2:end)) % sólo datos
        counter = counter + 1 ; 
        mes = (j-1)/length(datos(1,2:end)) ; % genera 12 alteraciones
        time(counter) = anno(i) + mes ; %counter genera que se vayan agregando
        info(counter) = datos(i,j+1) ;
        %c = c + ((i-0.5)/12) ;
    end

time = time' ;  % transpuesta
info = info' ;
end

 B(:,1) = time ;
 B(:,2) = info ;
end