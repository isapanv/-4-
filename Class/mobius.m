u = 0:0.05:2*pi+pi/2;
v = -0.5:0.05:0.5;

[U, V] = meshgrid(u, v);

X = (1+(V/2).*cos(U/2)).*cos(U);
Y = (1+(V/2).*cos(U/2)).*sin(U);

#[X, Y] = meshgrid(x, y);
Z = (V/2).*sin(U/2);
figure
surf(X, Y, Z)
shading interp
colormap('ocean')
