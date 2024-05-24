function [t, X] = pendux2(params, theta1_0, theta2_0, time_range)

    m1 = params(1).m;
    l1 = params(1).l;
    m2 = params(2).m;
    l2 = params(2).l;

    initial_conditions = [theta1_0; 0; theta2_0; 0];

    [t, sol] = ode45(@(t, y) equations_of_motion(t, y, m1, l1, m2, l2), time_range, initial_conditions);

    x1 = l1 * sin(sol(:, 1));
    y1 = -l1 * cos(sol(:, 1));
    x2 = x1 + l2 * sin(sol(:, 3));
    y2 = y1 - l2 * cos(sol(:, 3));

    X = [x1, y1, x2, y2];
end

function dydt = equations_of_motion(~, y, m1, l1, m2, l2)
    g = 9.81;

    theta1 = y(1);
    omega1 = y(2);
    theta2 = y(3);
    omega2 = y(4);

    delta = theta2 - theta1;

    dydt = zeros(4, 1);
    dydt(1) = omega1;
    dydt(2) = (m2 * l1 * omega1^2 * sin(delta) * cos(delta) + m2 * g * sin(theta2) * cos(delta) + m2 * l2 * omega2^2 * sin(delta) - (m1 + m2) * g * sin(theta1)) / (l1 * (m1 + m2 * sin(delta)^2));
    dydt(3) = omega2;
    dydt(4) = (-m2 * l2 * omega2^2 * sin(delta) * cos(delta) + (m1 + m2) * (g * sin(theta1) * cos(delta) - l1 * omega1^2 * sin(delta) - g * sin(theta2))) / (l2 * (m1 + m2 * sin(delta)^2));
end
