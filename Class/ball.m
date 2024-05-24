% Iitializing all the data we need
g = 9.81 * 5;
h0 = 100;
t_n = 60;
y0 = [h0; 0];
t_range = [0, t_n];
eps = 1e-6;
way = [];
N = 30;
f = @(t, y) [y(2); -g];

function [value, T, dir] = ground(t, y)
  value = y(1);
  T = 1;
  dir = -1;
end

%calculating the way of the ball
for iteration = 1:N
  options = odeset('Events', @ground);
  [t, y, te, ye, ie] = ode45(f, t_range, y0, options);
  way = [way; t, y];

  if !isempty(ie)
    v = ye(2);
    y0 = [0; -0.9 * v];
    t_range = [te, t_n];
  else
    break;
  end

  if abs(diff(t_range)) < eps
    break;
  end
end

%Plotting the whole moving
plot(way(:,1), way(:,2));
