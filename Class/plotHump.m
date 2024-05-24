function retval = plotHump()
  x = 0:0.02:4;
  y = humps(x);
  y_max = 20;
  i = 0;
  numOfY = columns(y);
  indY = [];
  indX = [];

  while i < numOfY
    ++i;
    if y(i) > y_max;
      y_max = y(i);
    end

  end
  x_max = 0;

  for i = 0:0.02:4
    if humps(i) == y_max
      x_max = i;
    end
    if humps(i)>= 20 && humps(i) <= 40
      indY = [indY humps(i)];
      indX = [indX i];
    end
  end

  hold on;
  #plot(x, y);
  plot(x_max, y_max, marker = 'o', 'markersize', 3);
  i = 0;
  while i < columns(indX)
    ++i;
    plot(indX(i), indY(i), 'marker', 'o', 'markersize', 2, 'color', 'm');
  end;


  text(x_max+0.05, y_max, 'Maximum Point');
  xlabel ('x');
  ylabel ('y');
  legend ("humps (x)");
  hold off;

endfunction
