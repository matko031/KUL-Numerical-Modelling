function V = calculateDCT(v)
    n = length(v)-1;
    w = fliplr(v(2:end-1));
    v_even = [v w];
    V = fft(v_even)/n;
    V = real(V(1:n+1));
    V = [V(1)/2 V(2:end)];
end