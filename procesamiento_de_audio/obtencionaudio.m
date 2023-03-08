%%GRABACION DE AUDIO

% audio 1
fs= 11025 ;
nbits=16  ;
c1= 1;

Grave= audiorecorder (fs,nbits,c1);
disp ('Grabando')
recordblocking (Grave,5);
play (Grave)
audio1 = getaudiodata(Grave);
disp ('Fin de la grabacion de Audio 1');

%%audio2  
Flauta= audiorecorder (fs,nbits,c1);
disp ('Grabando')
recordblocking (Flauta,5);
play (Flauta)
audio2 = getaudiodata(Flauta);
disp('Fin de la grabacion de Audio 1');
