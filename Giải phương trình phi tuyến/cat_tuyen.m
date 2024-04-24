function cat_tuyen(x0,x1,epsilon)
    f = @(x) x^3 + sin(x);
    buoclap = 0;
    while true
        df = (f(x1) - f(x0)) / (x1 - x0);
        xk = x1 - f(x1) / df;
        buoclap = buoclap + 1;
        if abs(f(xk)) < epsilon
            break;
        end
        x0 = x1;
        x1 = xk;
    end
    disp(['Nghiệm gần đúng: ', num2str(xk)]);
    disp(['Sai số: ', num2str(f(xk))]);
    disp(['Số bước lặp: ', num2str(buoclap)]);
end