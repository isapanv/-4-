function df = diffi(f,ts,h)
% Функция для приближенного вычисления значения производной векторной функции
  df = zeros(2, length(ts));
  for i = 1:length(ts)
    df(:,i) = (f(ts(i)+h) - f(ts(i)-h)) / (2*h);
  end
endfunction
