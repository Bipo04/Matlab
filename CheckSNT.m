function [ result ] = CheckSNT(a)
    result = 1;
    for i = 2:a-1
        if  (mod(a,i) == 0)
            result = 0;
        end
    end
end