%% ELECENG 3FK4 - Assignment 2 - Oct 26th, 2025
clc; % clear command line
clear; % remove previous variables

Beta = 316.23; % phase constant (rad/m)

x = 0:0.01:3; % plot from x=0 to x=3

Ey = 1000*cos(-Beta*x); % electric field intensity (V/m)
Bz = 1000*10e-10*Beta*cos(-Beta*x); % magnetic field density (T)

null = 0.*x; % build null array

plot3(x,Ey,null,'-',x,null,Bz) % generate the 3D plot
grid on % turn on grid lines
title('Plot of E and B - Joey McIntyre (400520473)'); % add plot title
view([30 30]) % set view point
xlabel('x(m)') % label x axis
ylabel('Ey(v/m)') % label y axis
zlabel('Bz(T)') % label z axis

