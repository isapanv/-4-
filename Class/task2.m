function retval = task2()
  A = rand(6, 3) * 10;
  B = A([1:3], [1:3]);
    retval ="error";

  if det(B) ~= 0
    B1 = inv(B);
    K = B*B1;
    if round(K) == eye(3);
      retval ="winwin";
    end

  end
endfunction
