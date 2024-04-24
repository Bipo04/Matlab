function [] = solve( )
    n = input('n = ');
    A = zeros(n,n);
    for i = 1:n
        for j = 1:n
            A(i,j) = input('A= ');
        end
    end
    b = zeros(n,1);
    for i = 1:n
        b(i) = input ('b= ');
    end
    x = zeros (3,1);
    x = GiaiHPTTT(A,b);
    fprintf('A=');disp(A);
    fprintf('b=');disp(b);
    fprintf('x=');disp(x);
end