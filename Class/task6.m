function retval = task6(n)
  A = eye(n);
  A(1, n) = A(n, 1) = 1;
  for i = 1:n
    A(i, i) = -2;
    if i ~= n
      A(i, i+1) = 1;
    end
    if i ~= 1
      A(i, i-1) = 1;
    end

  end
retval = A;

endfunction
