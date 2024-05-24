function retval = plot8()
  phi = -pi/2:0.01:3*pi/2;
  a = 100;
  b = 2;
  n = 4;
  k = 14;

  r = [];

  for i = 1:length(phi)
      tmp = a / (a + (phi(i) - pi/2)^n) * (b - sin(k * phi(i)) - cos(n * phi(i)));
      r = [r tmp];
  end

  polar(phi, r);
endfunction
