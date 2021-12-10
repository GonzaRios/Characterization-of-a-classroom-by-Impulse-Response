function toma_datos(n,u)
%La funcion permite realizar la toma de datos indicando el tiempo de
%duracion del barrido en frecuencias y cantidad de repeticiones [n] que
%se requieran y [u] es un indice que representa la ubicacion del microfono
%para diferenciar las tomas.
    for j = 1:n
        N = string(n);
        N = char(N);
        U = string(u);
        U = char(U);
        [X,Fs] = audioread('Sweep.wav');
        T = numel(X)/Fs
        nom =  ['toma_',N,'_posicion_',U,'.wav']; 
        y = audiorecorder(Fs,16,1);
        record(y)
        pause(1);
        sound (X,Fs);
        pause(2*T)
        stop(y)
        Y = getaudiodata(y);
       audiowrite(nom,Y,44100);
    end 
end

   
