u = 0:0.05:6*pi;
v = -1:0.05:1;
R = 10;
[U, V] = meshgrid(u, v);

X = (R+V.*cos(7/3.*U)).*cos(U);
Y = (R+V.*cos(7/3.*U)).*sin(U);

#[X, Y] = meshgrid(x, y);
Z = V.*sin(7/3.*U);
figure
surf(X, Y, Z)
shading interp
colormap('ocean')
