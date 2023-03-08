% PROCESAMIENTO DE CONTENIDO MULTIMEDIA
% Luis Ariza - Erick Barros
% Estudiantes de Ingeniería Electrónica

%% Importar Señales de Audio
clear all; close all; clc;

fs = 11025;

sn = importdata('grave.mat');
gn = importdata('flauta.mat');
sn = getaudiodata(sn);
gn = getaudiodata(gn);

%% Audio 1
% FFT
transf1=abs(fft(sn));
L=length(transf1);
espectro=transf1(1:L/2);
espectro=espectro/max(espectro);
frec= fs*(1:(L/2))/L;
% 
n=length(sn);
t=n/fs;
Ts=1/fs;
tiempo= (0:Ts:(t-Ts));
% grafica
figure(1)
subplot(2,1,1); plot(tiempo,sn,'b'); title('señal de audio 1')
xlabel('tiempo (s)'); ylabel ('Amplitud')
subplot(2,1,2); plot(frec,espectro)
title('Espectro señal de audio 1')
xlabel ('Frecuencia (Hz)');ylabel ('Amplitud'); grid('on')
sound(sn,fs)


%% Audio 2
%FFT
transf1=abs(fft(gn));
L=length(transf1);
espectro=transf1(1:L/2);
espectro=espectro/max(espectro);
frec= fs*(1:(L/2))/L;
% 
n=length(gn);
t=n/fs;
Ts=1/fs;
tiempo= (0:Ts:(t-Ts));
% grafica
figure(2)
subplot(2,1,1); plot(tiempo,gn,'b'); title('señal de audio 2')
xlabel('tiempo (s)'); ylabel ('Amplitud')
subplot(2,1,2); plot(frec,espectro)
title('Espectro señal de audio 2')
xlabel ('Frecuencia (Hz)');ylabel ('Amplitud'); grid('on')
sound(gn,fs)

%% Sumatoria 
yn = sn + gn;
%FFT
transf1=abs(fft(yn));
L=length(transf1);
espectro=transf1(1:L/2);
espectro=espectro/max(espectro);
frec= fs*(1:(L/2))/L;
% 
n=length(yn);
t=n/fs;
Ts=1/fs;
tiempo= (0:Ts:(t-Ts));
% grafica
figure(3)
subplot(2,1,1); plot(tiempo,gn,'b'); title('señal de mezcla de audio')
xlabel('tiempo (s)'); ylabel ('Amplitud')
subplot(2,1,2); plot(frec,espectro)
title('Espectro señal de mezcla de audio')
xlabel ('Frecuencia (Hz)');ylabel ('Amplitud'); grid('on')
sound(yn,fs)

%% filtro pasa banda 
fs1=8000;
fc1 = [800,1200];
Orden1 = 10;
filtro1 = fdesign.bandpass('n,f3db1,f3db2',Orden1,fc1(1),fc1(2),fs1);
hfiltro = design(filtro1,'butter');
% Filtrado 
grave = filter(hfiltro,yn);
% FFT
transf1=abs(fft(yn));
L=length(transf1);
espectro=transf1(1:L/2);
espectro=espectro/max(espectro);
frec= fs1*(1:(L/2))/L;
%grafica
figure(4)
plot(frec,espectro); title('Espectro señal de audio filtrado 1')
xlabel ('Frecuencia (Hz)'); ylabel ('Amplitud'); grid on; 
% Reproducción 
grave = 2*grave;
player1 = audioplayer(grave,fs1);
play(player1)

%% Filtro pasa baja 

% All frequency values are in Hz.
Fs = 8000;  % Sampling Frequency

N     = 10;   % Order
Fstop = 650;  % Stopband Frequency
Astop = 80;   % Stopband Attenuation (dB)

% Construct an FDESIGN object and call its CHEBY2 method.
h  = fdesign.lowpass('N,Fst,Ast', N, Fstop, Astop, Fs);
Hd = design(h, 'cheby2');

signalfilt = filter(Hd,yn);
pause(5)
sound(signalfilt,Fs);
% FFT
transf1=abs(fft(yn));
L=length(transf1);
espectro=transf1(1:L/2);
espectro=espectro/max(espectro);
frec= fs*(1:(L/2))/L;
%grafica
figure(5)
plot(frec,espectro); title('Espectro señal de audio filtrado 2')
xlabel ('Frecuencia (Hz)'); ylabel ('Amplitud'); grid on; 

%% filtro pasa alta
Fs = 8000;  % Sampling Frequency

Fstop = 1700;        % Stopband Frequency
Fpass = 1800;        % Passband Frequency
Astop = 100;         % Stopband Attenuation (dB)
Apass = 1;           % Passband Ripple (dB)
match = 'passband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.highpass(Fstop, Fpass, Astop, Apass, Fs);
Hd2 = design(h, 'butter', 'MatchExactly', match);

% [EOF]
signalfilter = filter(Hd2,yn);
pause(5)
sound(signalfilter,Fs);
% FFT
transf1=abs(fft(yn));
L=length(transf1);
espectro=transf1(1:L/2);
espectro=espectro/max(espectro);
frec= fs*(1:(L/2))/L;
%grafica
figure(6)
plot(frec,espectro); title('Espectro señal de audio filtrado 3')
xlabel ('Frecuencia (Hz)'); ylabel ('Amplitud'); grid on; 
