function day_cung(a,c,epsilon)
    f = @(x) x^3 + sin(x);
    steps = 0;
    while abs(c - a) >= epsilon
        b = (a * f(c) - c * f(a)) / (f(c) - f(a));
        steps = steps + 1;
        if f(b) == 0 || abs(f(b)) < epsilon
            break;
        end
        if f(a) * f(b) > 0
            a = b;
        else
            c = b;
        end
    end
    disp(['Nghiệm gần đúng: ', num2str(b)]);
    disp(['Sai số: ', num2str(abs(f(b)))]);
    disp(['Số bước lặp: ', num2str(steps)]);
end