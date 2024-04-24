function chia_doi(a,c,epsilon)
    f = @(x) x^3 + sin(x);
    steps = 0;
    while (c - a) >= epsilon
        b = (a + c) / 2;
        steps = steps + 1;
        if f(b) == 0 || (c - a) < epsilon
            break;
        end
        if sign(f(a)) * sign(f(b)) > 0
            a = b;
        else
            c = b;
        end
    end
    disp(['Nghiệm gần đúng: ', num2str((a + c) / 2)]);
    disp(['Sai số: ', num2str(abs(c - a))]);
    disp(['Số bước lặp: ', num2str(steps)]);
end