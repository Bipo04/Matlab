function [nghiem, buoclap] =  Lap(g, x0, eps)
    saiso = 1; iter = 0;
    while saiso > eps
        x = feval(g,x0);
        iter = iter + 1;
        saiso = abs(x-feval(g,x));
        x0 = x;
    end
    nghiem = x;
    buoclap = iter;
end