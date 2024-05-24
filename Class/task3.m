function retval = task3()
  A = rand(3, 5) * 10;
  B = A([1:3], [1:3]);
  det1 = det(B);
  B(1,:) = [0, 0, 0];
  det2 = det(B);
  retval = det1 == det2;
endfunction
