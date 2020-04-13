function a = approxCheby(f,n)
    %{
    Takes in a function handle f and a number n and returns vector a with
    the coefficients of the best approximation of f in V_n using the DCT
    %}

    z = @(l,n) cos(l*pi/n);
    F = zeros(1, n+1);
    for i = 1:n+1
        F(1,i) = f(z(i-1, n));
    end
    a = calculateDCT(F);
end