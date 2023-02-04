% Define signal x(t)
Te = 0.0001; % sampling time
t = 0:Te:5; % time vector
f1 = 500; f2 = 400; f3 = 50;
x = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);

% Plot signal x(t)
figure;
plot(t,x);
xlabel('Time (s)'); ylabel('Amplitude');
title('Signal x(t)');

% Plot the Fourier transform of x(t)
X = fft(x);
f = linspace(-1/(2*Te), 1/(2*Te), length(x));
figure;
plot(f, abs(fftshift(X)));
xlabel('Frequency (Hz)'); ylabel('Amplitude');
title('Fourier transform of x(t)');

% Define the high-pass filter function
wc = 50; % cutoff frequency
K = 1; % gain
H = (K*1i*w)/(wc + 1i*w);

% Plot the magnitude of H(f)
figure;
semilogx(w, abs(H));
xlabel('Frequency (rad/s)'); ylabel('Magnitude');
title('Magnitude of H(f)');

% Plot the phase of H(f)
figure;
semilogx(w, angle(H));
xlabel('Frequency (rad/s)'); ylabel('Phase (rad)');
title('Phase of H(f)');

% Apply the filter to the signal in frequency domain
Y = H.*X;
y = ifft(Y);

% Plot the filtered signal y(t)
figure;
plot(t, real(y));
xlabel('Time (s)'); ylabel('Amplitude');
title('Filtered signal y(t)');

% Compare the filtered signal y(t) with the desired signal
% Draw conclusion