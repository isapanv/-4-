

##syms x y R
**s = [(x-2)^2+(y-4)^2 == R^2, у = x/2 + 1]; #4D= solve (S, x, y);
* Уравнение окружности
R-> 10; % радиус окружности
center_x = 2; 8 х-координата центра
center_y - 4; 8 у-координата центра
* Уравнение прямой
function y
-
line_equation (x)
y - x/2 + 1;
end
* Находим точки пересечения
syms x y
5
6
eq1
7
8
9
(x-center_x)^2 + (y-center y)^2 - R^2; 8 уравнение окружности
eq2 - у - x/2 + 1; 8 Уравнение прямой
[x_sol, y sol] - solve([eqi, eq2], [x, y]);
0 * Выводим координаты точек пересечения
1 disp[[double(x_sol), double(y_sol)]);
22
23
24
25
* Строим график
fplot (@(x) line_equation(x), (-R+center x,R+center_x],'b'), * Прямая
hold on
26 th - 1:0.0,12 pi,
x circle - R⭑cos (th)+ center_x;
27
28
y circle - R*sin(th) -
center :
29
23
30
plot (x_circle, y cizale, fe'); * Окружность
plot (double(x_sol), double (y_sol), 'ro'); * Точки пересечения
31
axis equal
ние окружности

