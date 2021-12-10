function [M_f,Fs,Nfc] = Filtrado(X,Fs,band)

%La funci�n permite el ingreso de cualquier respuespuesta al impulso "X" y
%la elecci�n de banda de octava "band" por la que se desee filtrar. A 
%partir del dise�o de un filtro 'Butterworth', la funci�n procede al armado
%de una matriz que guardar� la informaci�n de cada banda central filtrada 
%por cada columna de la misma.

if band==1
    ord=6;
elseif band==3
    ord=8;
end

d = fdesign.octave(band,'Class 0','N,F0',ord,1000,Fs); %Dise�o del filtro.
v = validfrequencies(d); %Funci�n de MATLAB que permite asignar, entre el 
%rango audible, los valores de frecuencias centrales dependiendo de la 
%sepaci�n de banda que se utilice.
ind = find(X==max(X),1); %Busca la posici�n del m�ximo del vector "X".
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