function [M_f,Fs,Nfc] = Filtrado(X,Fs,band)

%La función permite el ingreso de cualquier respuespuesta al impulso "X" y
%la elección de banda de octava "band" por la que se desee filtrar. A 
%partir del diseño de un filtro 'Butterworth', la función procede al armado
%de una matriz que guardará la información de cada banda central filtrada 
%por cada columna de la misma.

if band==1
    ord=6;
elseif band==3
    ord=8;
end

d = fdesign.octave(band,'Class 0','N,F0',ord,1000,Fs); %Diseño del filtro.
v = validfrequencies(d); %Función de MATLAB que permite asignar, entre el 
%rango audible, los valores de frecuencias centrales dependiendo de la 
%sepación de banda que se utilice.
ind = find(X==max(X),1); %Busca la posición del máximo del vector "X".
%if length(X)/Fs > 6 
    %X = X(ind:6*Fs);
    %else
X = X(ind:end);
%end
Nfc = length(v); 
M_f = zeros(length(X)+1,Nfc); %Armado de una matriz, para que sus 
%dimensiones sean compatibles, y asi poder aplicar el filtrado 
%posteriormente.
M_f(1,1:end) = v;

for i =1:Nfc
    d.F0= v(i); 
    j = design(d,'butter');
    h = filter(j,X);
    h = h/max(abs(h));
    t = (0:length(h)-1)/Fs;
    M_f(2:end,i) = h;
    
end
end