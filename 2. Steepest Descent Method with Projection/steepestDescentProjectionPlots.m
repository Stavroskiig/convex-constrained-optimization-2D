% Removes all variables from the currently active workspace.
clearvars

% Clears all the text from the Command Window.
clc

% Initialize the intervals.
x_l = -10; % lower
x_u = 5;  % upper
y_l = -8; % lower
y_u = 12;  % upper

% Chooses the preferable 's' value.
chooseS = 2;

% Initialize the 's' values.
s = [5 15 0.1];

% Chooses the preferable gamma value.
chooseGamma = 2;

% Initialize the gamma values.
gamma = [0.5 0.1 0.2];

% Chooses the preferable point.
choosePoint = 2;

% The three points under study.
xInput = [5 -5 8];
yInput = [-5 10 -10];

% Choose epsilon.
epsilon = 0.01;

% Creates symbolic scalar variables 'x' and 'y'.
syms x y

% Define my function.
f(x,y) = ((x^2)/3) + 3*(y^2);

% Creating a variable to select which figure to use.
plot_number = 1;

x = linspace(-20, 20, 40);
y = x';
z = (x.^2)/3 + 3*(y.^2);

i = 3;
[~, xValue1, yValue1, iterations1] = steepestDescentConstProjection(f, epsilon, xInput(choosePoint), yInput(choosePoint), gamma(chooseGamma), x_l, x_u, y_l, y_u, s(chooseS));

figure(1)
clf
surf(x,y,z)
hold on
scatter3(xValue1, yValue1, (xValue1.^2)/3 + 3*(yValue1.^2),'+','r')
hold on 
scatter3(xValue1(end), yValue1(end), (xValue1(end).^2)/3 + 3*(yValue1(end).^2),'p','y')
legend('z','steps','final solution')
xlabel('x')
ylabel('y')
zlabel('z')
title('z Steepest Descent Projection Method for gamma = 0.2, s = 0.1, (8,-10)','Interpreter','latex')

figure(2)
clf
fcontour(@(x,y) (x^2)/3 + 3*(y^2), [-20, 20])
hold on
scatter(xValue1, yValue1,'+','r')
hold on 
scatter(xValue1(end), yValue1(end),'p','k')
legend('z','steps','final solution')
xlabel('x')
ylabel('y')
title('z Steepest Descent Projection Method for gamma = 0.2, s = 0.1, (8,-10)','Interpreter','latex')