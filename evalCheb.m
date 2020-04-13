function v = evalCheb(a,x)
    %{
        Takes in a vector a=(a0,a1,...,an) and vector x= (x1,...,xN)∈[−1,1]
        and returns vector v= (f1,...,fN)
        f_i = y_n(x_i) = a_0*T_0(x_i) + a_1*T_1(x_i) + ··· + a_n*T_n(x_i)
    %}

    n = length(a); N = length(x);
    T_ik = @(k,xi) cos(k*acos(xi)); % one element in the T matrix
    Tk = @(k) arrayfun(@(x_el) T_ik(k, x_el), x); % one column in the T matrix
    T = zeros(N, n);
    for i = 1 : n
        T(:, i) = Tk(i-1);
    end
    v = T*a;
end