function [a , b] = cuad_min(t,s)

if size(t) ~= size(s) 
    s = s'; %Si los tamaños de las ordenadas y abscisas coinciden, entonces se traspone el valor de la ordenada.
end

A = ones(length(t),2) ; %Se completa un vector con la longitud de la ordenada como fila y dos columnas
A (:,2) = (t)'; %Del vector definido anteriormente se procede a trasponerlo
B = (s)' ; %Se traspone nuevamente 
vector = ((inv((A')*A)*(A'))*B)' ; %De la teoria de cuadrados minimos se arma un vector con la informacion de la pendiente y ordenada
a = vector(1);%Ordenada
b = vector(2);%Pendiente

end