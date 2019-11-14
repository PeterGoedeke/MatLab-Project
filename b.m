function [t, y] = b(dydt, interval, startVal)
y(1) = startVal;
n = 5;
t = linspace(interval(1), interval(2), n);
for i = 2:n
    y(i) = y(i - 1) + (t(2) - t(1)) * dydt(t(i), y(i - 1));
    
end
end