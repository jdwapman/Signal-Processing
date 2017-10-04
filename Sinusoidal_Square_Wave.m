%Shows composition of a square wave by sinusoidal components

clc
clear

syms n t; %Create symbolic variables for the equation

D = -exp(-2*pi*j*n*0.25)/(2*pi*j*n) + exp(2*pi*j*n*0.25)/(2*pi*j*n); %Coefficient Dn, found analytically
D0 = 0.5; %D0, found analytically

%Evaulate for each N value. 
f5 = symsum(D*exp(-j*n*2*pi*t), n, -5, -1) + D0 + symsum(D*exp(-j*n*2*pi*t), n, 1, 5); 
f10 = symsum(D*exp(-j*n*2*pi*t), n, -10, -1) + D0 + symsum(D*exp(-j*n*2*pi*t), n, 1, 10);
f50 = symsum(D*exp(-j*n*2*pi*t), n, -50, -1) + D0 + symsum(D*exp(-j*n*2*pi*t), n, 1, 50);
f100 = symsum(D*exp(-j*n*2*pi*t), n, -100, -1) + D0 + symsum(D*exp(-j*n*2*pi*t), n, 1, 100);

%Plot all 4 figures
figure
fplot(f5, [-3 3])
title('N = 5')

figure
fplot(f10, [-3 3])
title('N = 10')

figure
fplot(f50, [-3 3])
title('N = 50')

figure
fplot(f100, [-3 3])
title('N = 100')


t = -3:0.00001:3; %Create values of t
t = t';

f5_func = matlabFunction(f5);  % This creates a function handle
f10_func = matlabFunction(f10);  % This creates a function handle
f50_func = matlabFunction(f50);  % This creates a function handle
f100_func = matlabFunction(f100);  % This creates a function handle

%Calculate overshoots for each N. First evaluates the data, finds the max,
%subtract 1, and multiply by 100%
f5_overshoot_percent = (double(max(feval(f5_func, t))) - 1) * 100
f10_overshoot_percent = (double(max(feval(f10_func, t))) - 1) * 100
f50_overshoot_percent = (double(max(feval(f50_func, t))) - 1) * 100
f100_overshoot_percent = (double(max(feval(f100_func, t))) - 1) * 100

disp('The overshoot does not disappear as N -> inf')
