function [x,k,t] = sine_sweep (f1,f2,T)
%Reproduce un Sine sweep entre el rango de frecuencias f1 y f2 [Hz],y de
%duracion deseada T[s]. Devuelve los vectores 'x', 'k' y
%'t'correspondientes al sine sweep ,filtro inverso y vector temporal
%respectivamente
K = (T*2*pi*f1)/log((2*pi*f2)/(2*pi*f1)); 
L = T/log((2*pi*f2)/(2*pi*f1));
t = 0:1/44100:T ;
x = sin(K*(exp(t/L)-1)); %fórmula de Sine-sweep
x = x/max(abs(x));
audiowrite('Sweep.wav',x,44100)  %genracion de archivo de audio .wav con la señal obtenida
w = (K/L)*exp(t/L);
m = (2*pi*f1)./(2*pi*w);
k = m.*fliplr(x);% Filtro inverso , fliplr invierte el la señal x de izquierda a derecha
k = k/max(abs(k));
audiowrite('Finverso.wav',k,44100);  
end
