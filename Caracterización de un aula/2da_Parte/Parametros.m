function [M] = Parametros(S,t)

%EDT
ejex1E = find(S < max(S),1,'first');  
ejex2E = find(S < max(S)-10,1,'first'); 
ejexiE =(t(ejex1E:ejex2E));
ejeyiE =(S(ejex1E:ejex2E));
[AE, BE] = cuad_min(ejexiE,ejeyiE);
EDT = (-60)/BE;

%T10
ejex1T10 = find(S < max(S)-5,1,'first');
ejex2T10 = find(S < max(S)-15,1,'first');
ejexiT10 =(t(ejex1T10:ejex2T10));
ejeyiT10 =(S(ejex1T10:ejex2T10));
[AT10,BT10] = cuad_min(ejexiT10,ejeyiT10);
T10 = (-60)/BT10;

%T20
ejex1T20 = find(S < max(S)-5,1,'first');
ejex2T20 = find(S < max(S)-25,1,'first');
ejexiT20 =(t(ejex1T20:ejex2T20));
ejeyiT20 =(S(ejex1T20:ejex2T20));
[AT20,BT20] = cuad_min(ejexiT20,ejeyiT20);
T20 = (-60)/BT20;

%T30
ejex1T30 = find(S < max(S)-5,1,'first');
ejex2T30 = find(S < max(S)-35,1,'first');
ejexiT30 =(t(ejex1T30:ejex2T30));
ejeyiT30 =(S(ejex1T30:ejex2T30));
[AT30,BT30] = cuad_min(ejexiT30,ejeyiT30);
T30 = (-60)/BT30;

M=[EDT;T10;T20;T30];
end