function [MD]=  procesar_impulso(IR,banda)
cd Formato_wav\IR\

[IR,Fs] = audioread(IR);
cd ..\
cd ..\
[M_f,Fs,Nfc] = Filtrado (IR,Fs,banda); 
RESULT=[M_f(1,:);zeros(4,Nfc)];
SCHROEDER=cell(1,Nfc);
MD.F0 = M_f(1,:);
MD.Fs =Fs;
for f0=1:Nfc
irf = M_f(2:end,f0); 
irf = abs(hilbert(irf));
irf  = irf/max(abs(irf));
E_irf = 20*log10(irf);
t =0:1/Fs:(length(irf)/Fs)-1/Fs;
td  = td_lund(t,E_irf,Fs);
[S,ts]=Schroeder(irf,Fs,td);
SCHROEDER{f0}=[S'];
RESULT(2:end,f0)=Parametros(S,ts);

end

MD.MATRIZFILT = M_f;
MD.SC = SCHROEDER;
MD.RESULTADOS=RESULT;
end