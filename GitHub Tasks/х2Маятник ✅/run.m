function run()
    params(1).m = 1;
    params(1).l = 1;
    params(2).m = 1;
    params(2).l = 1;

    theta1_0 = pi/4;
    theta2_0 = pi/2;

    time_range = [0 20];

    [t, X] = pendux2(params, theta1_0, theta2_0, time_range);

    figure;
    hold on;
    axis equal;
    axis([-2 2 -2 2]);

    h1 = plot([0, X(1, 1)], [0, X(1, 2)], 'b', 'LineWidth', 2);
    h2 = plot([X(1, 1), X(1, 3)], [X(1, 2), X(1, 4)], 'r', 'LineWidth', 2);

    for i = 2:length(t)
        set(h1, 'XData', [0, X(i, 1)], 'YData', [0, X(i, 2)]);
        set(h2, 'XData', [X(i, 1), X(i, 3)], 'YData', [X(i, 2), X(i, 4)]);

        plot(X(1:i, 1), X(1:i, 2), 'b:');
        plot(X(1:i, 3), X(1:i, 4), 'r:');

        drawnow;
        pause(0.01);
    end

    hold off;
end

