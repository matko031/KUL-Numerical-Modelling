function [c,kappa] = interpolate(x_i,f)
    n = length(x_i);
    B = zeros(n,1);
    for i = 1:n
        B(i) = f(x_i(i));
    end
    M = [ ones(n,1) zeros(n,n-1)];
    
    M(:,2) = x_i; 
    
    for i = 3:n
        K = zeros(n,1);
        for j = 1:n
           K(j) = cos((i-1)*acos(x_i(j))); 
        end
        M(:, i) = K;

    end
    c = M\B;
    kappa = cond(M); 
end