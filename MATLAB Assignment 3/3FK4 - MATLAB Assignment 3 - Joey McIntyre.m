%% ELECENG 3FK4 - MATLAB Assignment 3 - Set 5
% Joey McIntyre - 400520473

clc;
clear

% define variable given in the question
Z0 = 50;                % charcteristic impedance of the line (ohms)
ZL = 200;               % load impedance (ohms)
Zs = 100;               % source impedance (ohms)
Vs = 60;                % source voltage mag (V), angle = 0deg
vp = 2e8;               % phase velocity (m/s)
l = 2;                  % line length (m)
f0 = 25e6;              % operating frequency (Hz)
w0 = 2*pi*f0;           % angular frequency (rad/s)

% define values from the analytical solution
VL_mag = 26.675;        % load voltage magnitude at f0 (V)
phi_L = -pi/2;          % load-voltage phase at f0 (rad)

% time avis for v_L(t)
t1 = 0;                 % plot starts at t1
t2 = 6e-8;              % plot ends at t2
N = 500;                % number of plotting points
dt = (t2 - t1)/N;       % time increment

% generate the time-domain plot
t = t1:dt:t2;
vL_t = VL_mag * cos(w0*t + phi_L);  % load voltage as function of time

figure;
plot(t, vL_t);
title('Plot of the load voltage as a function of time - Joey McIntyre - 400520473');
xlabel('t (s)');
ylabel('v_L (V)');
grid on;


% plot |V_L| as a function of source frequency f

f1 = 1e6;                   % start frequency (Hz)
f2 = 200e6;                 % end frequency (Hz)
Nf = 500;                   % number of frequency points
df = (f2 - f1) / Nf;        % frequency increment

% frequency vector
f = f1:df:f2;               

% reflection coefficient at the load
Gamma_L = (ZL - Z0) / (ZL + Z0);

% phase constant as a function of frequency
beta = 2*pi.*f / vp;

% input impedance as a function of frequency
Zin = Z0 .* (ZL +1j*Z0.*tan(beta*l)) ./ (Z0 + 1j*ZL.*tan(beta*l));

% input voltage as a function of frequency
Vin = Vs .* (Zin ./ (Zs + Zin));

% forward-wave amplitude as a function of frequency (V0^+)
V0_plus = Vin ./ (exp(-1j*beta*l) + Gamma_L .* exp(1j*beta*l));

% load voltage as a function of frequency
VL_f = V0_plus .* (1 + Gamma_L);

% magnitude of load voltage
VL_mag_f = abs(VL_f);

% generate the plot
figure;
plot(f/1e6, VL_mag_f);
title('|V_L| as a function of source frequency f - Joey McIntyre - 400520473');
xlabel('f (MHz)');
ylabel('|V_L| (V)');
grid on;