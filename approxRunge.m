function approxRunge()
    syms t
    runge = matlabFunction (1 / (25*t^2+1));
    x = linspace(-1,1,200)';
    r_i = arrayfun(@(x_i) runge(x_i), x);

    D = zeros(50, 1);
    hold on;
        plot(x, runge(x),'r', 'LineWidth', 3);
        title('Approximation of the runge function using Chebyshev polynomials of the first kind')
        for n = 2:2:100
            a = approxCheby(runge, n)';
            f = evalCheb(a, x);
            D(n/2) = max(abs(f-r_i)); 

            if n <= 20
                plot(x, f);
            end
        end
        legend('runge function');
    hold off;
    
    figure;
    d =linspace(0,49,50);
    plot(d, D);
    xlabel('Order of the Chebyshev polynomial')
    title('Max difference between the approximation and the runge function')
    
      
    

end