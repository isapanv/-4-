function caterpool(initial_pos, initial_vel, bottom_left, top_right, iterations, n)
    if length(initial_pos) ~= 2 || length(initial_vel) ~= 2 || length(bottom_left) ~= 2 || length(top_right) ~= 2
        disp("ERROR");
        return;
    end

    pos = initial_pos;
    vel = initial_vel;

    x_min = bottom_left(1);
    y_min = bottom_left(2);
    x_max = top_right(1);
    y_max = top_right(2);

    x = zeros(1, iterations);
    y = zeros(1, iterations);
    x(1) = pos(1);
    y(1) = pos(2);

    for i = 2:iterations
        pos = pos + vel;

        if pos(1) < x_min || pos(1) > x_max
            vel(1) = -vel(1);  % Ox
            pos(1) = max(min(pos(1), x_max), x_min);
        end
        if pos(2) < y_min || pos(2) > y_max
            vel(2) = -vel(2);  % Oy
            pos(2) = max(min(pos(2), y_max), y_min);
        end

        x(i) = pos(1);
        y(i) = pos(2);
    end


    caterpillar(x, y, n);
end


%initial_pos = [2, 3];
%initial_vel = [0.1, 0.15];
%bottom_left = [0, 0];
%top_right = [10, 10];
%iterations = 100;
%n = 5;

%caterpool(initial_pos, initial_vel, bottom_left, top_right, iterations, n);
