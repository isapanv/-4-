function retval = chessMatrix(n, m)
  if nargin < 2
    m = n;
  end
  if n == 1
    retval = logical(1);
  elseif n == 2
    chessMatrix = [1, 0];
    i = 1;
    chessMatrix(1) = 1;
     while i < m
       ++i;
        if mod(i, 2) == 0
          chessMatrix = cat(2, chessMatrix, [0, 1]);
        else
          chessMatrix = cat(2, chessMatrix, [1, 0]);
        end
    end
    retval = logical(reshape(chessMatrix, n, m));
  else
    chessMatrix =  zeros(1, n*m);
    i = 1;
    x = 1;
    if mod(n, 2) == 0
      while i < n*m
        chessMatrix(i) = x;
        i += 2;
        if (mod(i-1, n) ==0) && (mod(i, 2) == 1)
          ++i;
        elseif (mod(i, n) ==0) && (mod(i, 2) == 0)
          chessMatrix(i) = x;
          ++i;
        end
      end
    else
      while i < n*m
        chessMatrix(i) = x;
          i+=2;
      end
    end

      retval = logical(reshape(chessMatrix, n, m));
  end
endfunction
