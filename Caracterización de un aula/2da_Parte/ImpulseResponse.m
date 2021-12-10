function ImpulseResponse(k)

%GENERACION DE LA RESPUESTA AL IMPULSO DEL RECINTO POR MEDIO DE FFT

[X,FS] = audioread(k); %Tomas a elección

filtroinv = [pwd '\Formato_wav\filtroinverso.wav']; %Direcciona a la carpeta donde este el filtro inverso
[Y,Fs] = audioread(filtroinv); %Filtro inverso generado el día de medición
X = X.';
Y = Y.';
Y = [zeros(1,44100) Y zeros(1,44100*30)];%Completo el vector de la toma con zeros para que las longitudes sean compatibles

%APLICO LA TRANSFORMADA RÁPIDA Y LA ANTITRANFORMADA DE FOURIER

y = fft(Y); %Aplico la fft para pasar la señal al dominio frecuencial
K = fft(X); %IDEM
H = y.*K; %Propiedad de la Transformada de Fourier, multiplicación en el dominio frecuencial=convolución en el dominio temporal
h = ifft(H); %Antitransformo para volver al dominio temporal 
h = h/max(abs(h)); %Normalizo 
t = 0:1/44100:61-(1/44100);

%GENERACIÓN DE UN AUDIO EN FORMATO '.wav'
audiowrite('ImpulseResponse.wav',h,44100);


end