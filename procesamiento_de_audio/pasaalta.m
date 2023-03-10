function Hd = pasaalta
%PASAALTA Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.12 and DSP System Toolbox 9.14.
% Generated on: 01-Mar-2023 22:59:26

% Butterworth Highpass filter designed using FDESIGN.HIGHPASS.

% All frequency values are in Hz.
Fs = 8000;  % Sampling Frequency

Fstop = 1700;        % Stopband Frequency
Fpass = 1800;        % Passband Frequency
Astop = 100;         % Stopband Attenuation (dB)
Apass = 1;           % Passband Ripple (dB)
match = 'passband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.highpass(Fstop, Fpass, Astop, Apass, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);

% [EOF]
