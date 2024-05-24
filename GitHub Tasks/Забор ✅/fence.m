function retval = fence(r,c)
  if nargin < 2
    c = r;
  end
    res = logical(ones(r, 1));
    one =res;
    zero = zeros(r, 1);
    for i = 2:c
      if mod(i, 2) ==0
        res = cat(2, res, zero);
      else
        res = cat(2, res, one);
      end
    end
  retval = logical(res);

endfunction
