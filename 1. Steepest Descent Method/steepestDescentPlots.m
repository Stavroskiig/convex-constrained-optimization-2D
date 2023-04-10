% Removes all variables from the currently active workspace.
clearvars

% Clears all the text from the Command Window.
clc

% Choose epsilon.
epsilon = 0.001;

% Chooses the preferable point.
choosePoint = 3;

% The three points under study.
xInput = [-1, 1, 1];
yInput = [1, -1, 1];

% Initialize the gamma values.
gamma = [0.1 0.3 3 5];

% Chooses the preferable gamma value.
chooseGamma = 4;

% Creates symbolic scalar variables 'x' and 'y'.
syms x y

% Define my function.
f(x,y) = ((x^2)/3) + 3*(y^2);

% Creating a variable to select which figure to use.
plot_number = 1;


%% SUBTASK 0 - Plot of the objective function.

% Using this function to measure elapsed time.
tic;

figure(plot_number);
clf
x = linspace(-2,2,20);
y = x';
z = (x.^2)/3 + 3*(y.^2);
surf(x,y,z)
%legend('z','dot')
xlabel('x')
ylabel('y')
zlabel('z')
title('3-D plot of z = $x^{2}/3 + 3y^{2}$ ','Interpreter','latex')
plot_number = plot_number + 1;

% Using this function to measure elapsed time.
toc;

%% SUBTASK 1 - Graphing the function along with the convergence of the point. 

% Using this function to measure elapsed time.
tic;

% Calling the method for constant gamma.
[~, xValue1, yValue1, iterations1] = steepestDescentConst(f, epsilon, xInput(choosePoint), yInput(choosePoint), gamma(chooseGamma));

% Plotting the convergence of our points.
figure(plot_number);
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
title('z = $x^{2}/3 +3*y^{2}$ Steepest Descent Method for gamma = 3 for (1,1)','Interpreter','latex')
plot_number = plot_number + 1;

% Using this function to measure elapsed time.
toc;


%% SUBTASK 2 - Create the contours.

% Using this function to measure elapsed time.
tic;

figure(plot_number);
clf
fcontour(@(x,y) (x^2)/3 + 3*(y^2), [-8 8 -3 3])
hold on
scatter(xValue1, yValue1,'+','r')
hold on 
scatter(xValue1(end), yValue1(end),'p','k')
legend('z','steps','final solution')
xlabel('x')
ylabel('y')
title('z = $x^{2}/3 + 3*y^{2}$ Steepest Descent Method for gamma = 3 for (1,1)','Interpreter','latex')

% Using this function to measure elapsed time.
toc;