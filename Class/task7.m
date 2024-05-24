function retval = task7()
  A = rand(8, 8);
  for i = 1:8
    disp(["Максимальный элемент в ", num2str(i), "-ой строке: ", num2str(max(A(i,:))) ]);
  end
  for i = 1:8
    disp(["Максимальный элемент в ", num2str(i), "-ом столбце: ", num2str(max(A(:, i))) ]);
  end
  disp(["Максимальный элемент в матрице:", num2str(max(max(A))) ]);
retval = A;
  for i = 1:8
    for j = 1:8
      if(A(i, j) > 0.5)
        disp(["Элемент в ", num2str(i), "-ой строке, ", num2str(j), "-ом столбце больше 0.5"]);
      end
    end
  end
endfunction
