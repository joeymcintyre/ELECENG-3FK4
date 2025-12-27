%3FK4 - Assignment 1 - Set 3:
%Joey McIntyre - 400520473 - mcintj35

clc;
clear;

%define constants
a = 0.5; %side length of square
B0 = 0.4e-6; %field amplitude
R = 500; %given resistnace
c = 3e8; %speed of light

%time vector - 0 to 3*10^-8 - step of 1*10^-10
t = 0:1e-10:3e-8;

%calculate current I(t)
K = (a*B0*c)/R;
I = K*(sin(pi*c*t)-cos(pi*c*t));

%plot current v.s. time
plot(t, I);
grid on;
xlabel('Time (s)');
ylabel('Current I(t) (A)');
title('Current I(t) v.s. Time - Joey McIntyre - 400520473');