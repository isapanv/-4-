function baguett(length, diameter, angle, num_pieces)
    r = diameter/2;
    angle_radians = deg2rad(angle);
    % Отображение багета
    [X, Y, Z] = cylinder(r, 100);
    Z = Z * length;
    colormap(copper);
    surf(Z, X, Y);
    hold on
    % Матрица поворота
    R = [cos(angle_radians) 0 sin(angle_radians);
            0  1 0;
           -sin(angle_radians)  0 cos(angle_radians)];
    % Настройка осей
    axis equal
    xlabel('X')
    ylabel('Y')
    zlabel('Z')

    % Generate a grid of points for the sphere
    radius = r;
    theta = linspace(0, pi, 50); % angle theta from 0 to pi
    phi = linspace(0, 2*pi, 10); % angle phi from 0 to 2*pi
    [Theta, Phi] = meshgrid(theta, phi);

    % Calculate the x, y, z coordinates of the sphere points

    x = radius*cos(Theta).*sin(Phi);
    y = radius*cos(Theta).*cos(Phi);
    z = radius*sin(Theta);

    % Set the limits to display only the upper hemisphere
    z(z < 0) = NaN;

    % Plot the part of the sphere
    surf(z+length, x, y);
    z = -radius*sin(Theta);
    surf(z, x, y);


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    r = diameter/2;

    % Отображение кусоков багета
    figure;
    hold on;
    colormap(copper);
    for i = 0:num_pieces-1
      if mod(i, 2) == 0
        [X, Y, Z] = cylinder(r, 100);
        Z = Z * (length/num_pieces - 5);
        rotated_x = R(1,1) * X + R(1,3) * Z;
        rotated_y = Y;
        rotated_z = R(3,1) * X + R(3,3) * Z;
        surf(rotated_z+length/num_pieces + i*5, rotated_y, rotated_x);
        %           x                    y  z
        %surf(Z+length/num_pieces + i*5, X, Y);
        end;
    end

    % Generate a grid of points for the sphere
    radius = r;
    theta = linspace(0, pi, 100); % angle theta from 0 to pi
    phi = linspace(0, 2*pi, 100); % angle phi from 0 to 2*pi
    [Theta, Phi] = meshgrid(theta, phi);

    % Calculate the x, y, z coordinates of the sphere points
    x = radius*cos(Theta).*sin(Phi);
    y = radius*cos(Theta).*cos(Phi);
    z = radius*sin(Theta);

    rotated_x = R(1,1) * x + R(1,3) * z;
    rotated_y = y;
    rotated_z = R(3,1) * x + R(3,3) * z;
    % Set the limits to display only the upper hemisphere
    z(z < 0) = NaN;

    % Plot the part of the sphere
    if mod(num_pieces, 2) == 1
      surf(rotated_z+length/num_pieces + 5*(num_pieces-1), rotated_x, rotated_y);
    end;
    rotated_z = -radius*sin(Theta);

    surf(rotated_z, rotated_y, rotated_x);


    % Расчет угла реза в радианах
    angle_rad = deg2rad(angle);

    % Расчет толщины каждой части
    thickness = length / num_pieces;

    % Внутренности кусков
    center = [0, 0, 0];

    % Number of points to approximate the circle
    num_points = 100;

    % Generate points for the circle
    theta = linspace(0, 2*pi, num_points);
    x = radius * cos(theta) + center(1);
    y = radius * sin(theta) + center(2);
    z = zeros(size(x)) + center(3);

    rotated_x = R(1,1) * x + R(1,3) * z;
    rotated_y = y;
    rotated_z = R(3,1) * x + R(3,3) * z;
    % Нарезание багета
    for i = 0:num_pieces-1
        #fill3(z+length/num_pieces + i*5, y, x, 'yellow');

        % Отображаем части с нечетным номером
        if mod(i, 2) == 0
           fill3(rotated_z+length/num_pieces + i*5, rotated_y,  rotated_x, 'yellow');
        elseif mod(i, 2) == 1 && i ~= (num_pieces -1)
           fill3(rotated_z+2*length/num_pieces + i*5, rotated_y, rotated_x-1.22, 'yellow');
        end
    end


end
