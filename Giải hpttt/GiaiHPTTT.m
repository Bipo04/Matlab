function [x] = GiaiHPTTT(A,b)
    x = zeros(3,1);
    [L,U,P] = lu(A);
    b = P * b;
    y = L \ b;
    x = U \ y;
end