A = [0.3,0.52,1;
     0.5,1,1.9;
     0.1,0.3,0.5];
disp(A);
[L,U,P] = lu(A);
disp(L);
disp(U);
disp(P);
x = zeros(3,1)