function tangenta(f, dmin, dmax, n)
    t = linspace(dmin, dmax, 2*n+1);
    curve = zeros(2, length(t));
    for i = 1:length(t)
        curve(:,i) = f(t(i));
    end

    df = diffi(f, t, 5);

    figure;
    plot(curve(1,:), curve(2,:));
    hold on;
    plot([curve(1,n+1)-df(1,n+1), curve(1,n+1)+df(1,n+1)], [curve(2,n+1)-df(2,n+1), curve(2,n+1)+df(2,n+1)], 'r');
    axis equal;
    xlabel('x');
    ylabel('y');
    title('График функции и касательной');
end
