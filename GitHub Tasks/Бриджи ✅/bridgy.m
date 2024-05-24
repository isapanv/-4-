function coords = bridgy(y1, y2)
    x = -10:1:10; % задаем диапазон координат x
    x_begin = x(1);
    x_end = x(end);
    min_length = inf; % начальное значение минимальной длины моста
    coords1 = []; % массив для хранения координаты точки начала моста(нижний берег)
    coords2 = []; % массив для хранения координаты точки конца моста(верхний берег)

    x_min =x;
    for i = 1:length(x)
      for j = i:length(x)
          % находим пересечение прямых y=y1(x) и y=y2(x) для текущего x
          y1_val = feval(y1, x(i));
          y2_val = feval(y2, x(j));

          if y2_val > y1_val
              length_bridge = sqrt((x(i) - 0)^2 + (y2_val - y1_val)^2); % вычисляем длину моста

              if length_bridge < min_length
                  min_length = length_bridge;
                  coords1 = [x(i), y1_val]; % обновляем координаты точки низа моста
                  coords2 = [x(j), y2_val]; % обновляем координаты точки верха моста
                  coords = [x(i), x(j)];
              end
          end
       end
    end

    k = (coords1(2) - coords2(2)) / (coords1(1) - coords2(1));
    b = coords2(2) - k*coords2(1);
    xBridge = coords1(1):0.1:coords2(1);
    %y1 = coords1(2):0.1:coords2(2);
    yBridge = k*xBridge + b;

     % Изображаем полную картину
    figure;
    hold on; 
    fplot(y1); % нижний берег
    fplot(y2); % верхний берег
    plot(xBridge, yBridge); % мост
    plot(coords1(1), coords1(2), marker = 'o', 'markersize', 3); % координата точки начала моста(нижний берег)
    plot(coords2(1), coords2(2), marker = 'o', 'markersize', 3); % координата точки конца моста(верхний берег)

    legend ("нижний берег", "верхний берег", "мост");

    hold off;
end
