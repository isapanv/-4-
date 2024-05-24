function retval = xyPoints(s)
  t = -5:0.01:5;
  a = 1/4;
  b = 1/16;
  m = 8;
  n = 8;

  x = cos(t) - a*cos(m*t) +b * sin(n*t);
  y = sin(t) + a*sin(m*t) +b * cos(n*t);
  figure;
  hold on;
  for k = 1:s
      plot(x/k, y/k);
  end
  xlabel('x');
  ylabel('y');
  hold off;
endfunction
