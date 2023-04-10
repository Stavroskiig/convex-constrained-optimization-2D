function [z] = gradientVector(xInput, yInput)
    syms x y;
    f = ((x^2)/3) + 3*(y^2);
    f1 = gradient(f,[x,y]);
    z = vpa(subs(f1,[x,y],[xInput,yInput]));
end