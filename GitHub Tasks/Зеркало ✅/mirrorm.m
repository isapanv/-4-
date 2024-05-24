function result = mirrorm(matrix, n)
    [rows, cols] = size(matrix);
    matrix_flipud = flipud(matrix);
    matrix_fliplr = fliplr(matrix);
    matrix_fliplrT = flipud(matrix_fliplr).';
    mextrixT = matrix.';
    result = uint32([matrix_fliplrT(cols - n + 1:end, rows - n + 1:end), matrix_flipud(rows-n+1:end, :), mextrixT(cols - n + 1:end, 1:n);
    matrix_fliplr(:, cols - n + 1:end), matrix, matrix_fliplr(:, 1:n);
    mextrixT(1:n, rows - n + 1:end), matrix_flipud(1:n, :), matrix_fliplrT(1:n, 1:n)]);
endfunction
