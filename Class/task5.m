function retval = task5()
  A = rand(4, 4) * 10;
  [V, D] = eig(A);
  for i = 1:4
    lambda = D(i,i);
    v = V(:,i);
    check = A*v - lambda*v;
    disp(["Проверка для собственного значения ", num2str(lambda)]);
    disp(["Результат: ", num2str(norm(check))]);
  end
endfunction
