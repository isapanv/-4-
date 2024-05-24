function  retval = diagsn(r,c)
    if nargin < 2
      c = r;
    end;
    res = uint32(zeros(r, c));
    row = 1;
    col = 1;
    for i = 1:r*c
      res(row, col) = i;
      if mod(row+col, 2) == 0
        if row == r
           ++col;
        elseif col == 1
           ++row;
        else
           ++row;
           --col;
        end
      else
        if col == c
          ++row;
        elseif row == 1
          ++col;
        else
          --row;
          ++col;
        end
      end
    end
    retval = res;
endfunction
