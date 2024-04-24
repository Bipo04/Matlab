function [Root] = bairstow_solver(Coeff, initialGuess, MaxApproxError) 
    % Hàm bairstow_solver để tìm nghiệm của đa thức
    % Input:
    %   - Coeff: các hệ số của đa thức theo thứ tự giảm dần
    %   - initialGuess: ước lượng ban đầu cho các nghiệm
    %   - MaxApproxError: sai số ước lượng tối đa cho phép
    % Output:
    %   - Root: mảng chứa các nghiệm của đa thức

    maxiternumber = 200; % số lần lặp tối đa
    r = initialGuess; % gán giá trị ban đầu cho r
    s = initialGuess; % gán giá trị ban đầu cho s
    maxerr = MaxApproxError; % sai số tối đa được phép
    flag = 1; % cờ được sử dụng để kết thúc quá trình
    Root_index = 0; % chỉ số để lưu trữ các nghiệm
    fac = [1  0]; % yếu tố để giảm bậc đa thức

    while (flag == 1)
        [~, col] = size(Coeff);
        if (col == 1) % Đa thức bậc 0
            flag = 0;
        elseif (col == 2) % Đa thức bậc 1
            flag = 0;
            Root_index = Root_index + 1;
            Root(Root_index) = -Coeff(2) / Coeff(1);
        elseif (col >= 3) % Đa thức bậc 2 trở lên
            A = flip(Coeff); % đảo ngược các hệ số của đa thức
            [~, n] = size(A);
            B = zeros(1, n);
            C = zeros(1, n);
            r = initialGuess; % reset giá trị của r
            s = initialGuess; % reset giá trị của s

            for i = 1:maxiternumber
                % Tính các hệ số mới của đa thức B
                B(n) = A(n);
                B(n - 1) = A(n - 1) + (r * B(n));
                for j = n - 2:-1:1
                    B(j) = A(j) + (r * B(j + 1)) + (s * B(j + 2));
                end

                % Tính các hệ số mới của đa thức C
                C(4) = 0; % biện pháp an toàn cho phương trình bậc hai
                C(n) = B(n);
                C(n - 1) = B(n - 1) + (r * C(n));
                for j = n - 2:-1:1
                    C(j) = B(j) + (r * C(j + 1)) + (s * C(j + 2));
                end

                % Tính ma trận hệ số và véc tơ b cho hệ phương trình
                cofmat = [C(3) C(4); C(2) C(3)];
                b = [-1 * B(2); -1 * B(1)];
                del = inv(cofmat) * b;

                % Kiểm tra điều kiện dừng
                if (abs(del(2) / s) < maxerr && abs(del(1) / r) < maxerr)
                    r = r + del(1);
                    s = s + del(2);
                    x1 = (r + sqrt((r^2) + (4 * s))) / 2;
                    Root_index = Root_index + 1;
                    Root(Root_index) = x1;
                    x2 = (r - sqrt((r^2) + (4 * s))) / 2;
                    Root_index = Root_index + 1;
                    Root(Root_index) = x2;
                    break
                else
                    r = r + del(1);
                    s = s + del(2);
                end
                if (i == maxiternumber - 1)
                    disp('Phương pháp không thể tìm được nghiệm');
                end
            end
        end
        
        % Giảm bậc của đa thức
        [Coeff, ~] = deconv(Coeff, [1 -x1]);
        [Coeff, ~] = deconv(Coeff, [1 -x2]);
    end
end
