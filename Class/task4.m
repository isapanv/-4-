function retval = task4()
  A = rand(20, 20) * 10;
  x = eig(A);
  b = sort(x);
  retval = b';
endfunction
