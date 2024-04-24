function newton(x0,epsilon)
    f = @(x) x^3 + sin(x);
    df = @(x) 3*x^2 + cos(x);
    buoclap = 0;
    while true
        fk = f(x0);
        dfk = df(x0);
        xk = x0 - fk / dfk;
        buoclap = buoclap + 1;
        if abs(xk - x0) < epsilon
            break;
        end
        x0 = xk;
    end
    disp(['Nghiệm gần đúng: ', num2str(xk)]);
    disp(['Sai số: ', num2str(x0-xk)]);
    disp(['Số bước lặp: ', num2str(buoclap)]);
end