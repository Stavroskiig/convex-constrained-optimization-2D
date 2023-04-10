function [minValue, minX, minY, k] = steepestDescentConstProjection(f, epsilon, xInput, yInput, gamma_k, xl,xu,yl,yu,s)

% The variable 'k' shows in which iteration we are in
k = 1;

% The variable 'maximumStep' determines the maximum possible steps
%maxStep = 100;

% Initialize the cordinates arrays with zeros.
minX = zeros();
minY = zeros();

% Setting the starting (x,y) point to the first array indexes.
minX(1) = xInput;
minY(1) = yInput;

% Creates symbolic scalar variables 'x' and 'y'.
syms x y;

% Setting the first detected minimum value in the array.
minValue(k) = subs(f, [x,y], [minX(1),minY(1)]);

% Calculate the gradient vector at the current point.
gradientVector_k = gradientVector(minX(1), minY(1));

% Implementation of the method.
while ((norm(gradientVector_k) >= epsilon))

    d = - gradientVector_k;
    xBar = minX(k) + s * d(1,1);
    yBar = minY(k) + s * d(2,1);

        if xBar <= xl  
            xBar = xl;

        elseif xBar >= xu
            xBar = xu;

        end
    

        if yBar <= yl
            yBar = yl;

        elseif  yBar >= yu
            yBar = yu; 

        end
    

    minX(k+1) = minX(k) + gamma_k * (xBar - minX(k));
    minY(k+1) = minY(k) + gamma_k * (yBar - minY(k));
    gradientVector_k = gradientVector(minX(k+1), minY(k+1));
    minValue(k+1) = subs(f, [x,y], [minX(k+1), minY(k+1)]);
    k = k + 1;
    if k == 1000
        fprintf("INFINITE LOOP\n");
        toc
        break;
    end
end

end