
function  [p,i] = pink_noise(t,Fs)
% La funcion permite crear una se�al de Ruido Rosa con la duracion t [s] y frecuencia de muestreo Fs [Hz]  deseada. Adem�s guarda dicha se�al en un archivo de audio .wav.
% la funcion reproduce automaticamente la se�al y devuelve el vector de la se�al de ruido 'p' y la cantidad de
% muestras 'i'
Nx =t*Fs ; % n�mero de muestras que hay que sintetizar.
B = [0.049922035 -0.095993537 0.050612699 -0.004408786];
A = [1 -2.494956002 2.017265875 -0.522189400];%A i B son los coeficientes del filtro 1/f.
nT60 = round(log(1000)/(1-max(abs(roots(A)))));% estimaci�n del per�odo transitorio.
i = Nx+nT60;
v = randn(1,i);% generaci�n del ruido blanco.
p = filter(B,A,v); % se aplica el filtro 1/f.
audiowrite('ruido_rosa.wav',p,Fs); % guarda el archivo de audio en formato .wav para analizarlo en otro software si se necesita
end


