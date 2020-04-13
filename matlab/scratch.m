syms t

x = linspace(-1,1,200);

f = matlabFunction(1 / ((25*t^2)+1));
f_r = zeros(200,1);
for i = 1:200
    f_r(i) = f(x(i));
end

hold on;
    plot(x, f_r, 'r', 'Linewidth', 4);
    for n = 2:2:10

        x_i = linspace(-1,1,n);
        [c k] = interpolate(x_i, f);
        f_i = evalCheb(c, x);
        plot(x, f_i );
        
    end
hold off;
