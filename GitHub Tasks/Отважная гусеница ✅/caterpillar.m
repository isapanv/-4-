function caterpillar(x, y, n)
    if n > length(x) || n > length(y)
        disp("ERROR");
        return;
    end

    % Setting window size
    x_min = min(x) - 1;
    x_max = max(x) + 1;
    y_min = min(y) - 1;
    y_max = max(y) + 1;

    figure;
    hold on;
    axis([x_min, x_max, y_min, y_max]);
    axis equal;

    % Creating our caterpillar
    circles = [];
    for i = 1:n
        h = rectangle('Position', [x(1)-0.1, y(1)-0.1, 0.2, 0.2], 'Curvature', [1, 1], 'EdgeColor', 'black', 'FaceColor', 'g');
        circles = [circles; h];
    end

    % Making our caterpillar alive
    for i = 1:length(x)-n+1
        for j = 1:n
            set(circles(j), 'Position', [x(i+j-1)-0.1, y(i+j-1)-0.1, 0.2, 0.2]);
        end
        drawnow;
        pause(0.1);
    end

    hold off;
end

% x = linspace(0, 10, 100);
% y = sin(x);
% caterpillar(x, y, 10);
