function [f,P1] = graf2 (x,Fs,n,e)
% Aplica la fft la señal ingresada 'x' y realiza los ajustes necesarios
% para obtener el grafico de amplitud [dB] sobre Frecuencia [Hz]. Se debe
% ingresar ademas la frecuencia de muestreo [Fs] y la cantidad total de muestras
% de la señal. En caso de no tener el valor 'n' se puede multiplicar Fs por la duracion de la señal
% La variable 'e' indica si se quiere escala logaritmica o lineal en el eje x ,utilizando 'log' 
% o 'lin' respectivamente.

P = fft(x);
P2 = abs(P/n);
P1 = P2(1:n/2+1);
P1(2:end-1) = 2*P1(2:end-1);
P1 = P1/abs(max(P1));
P1 = 20*log10(P1);
f = Fs*(0:(n/2))/n;
if e == 'log'
    semilogx(f,P1);
    xlabel('Frecuencia [Hz]')
    ylabel('Amplitud normalizada [dB]')
elseif e == 'lin'
    plot(f,P1);
    xlabel('Frecuencia [Hz]')
    ylabel('Amplitud normalizada [dB]')
end    
end
