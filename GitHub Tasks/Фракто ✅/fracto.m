function fracto(coefficients, topLeft, bottomRight, numPointsX, numPointsY)
    X = linspace(topLeft(1), bottomRight(1), numPointsX);
    Y = linspace(topLeft(2), bottomRight(2), numPointsY);

    imageArray = zeros(numPointsY, numPointsX, 3);

    roots = roots(coefficients);
    colors = summer(length(roots));

    for i = 1:numPointsX
        for j = 1:numPointsY
            initialGuess = [X(i), Y(j)];
            [root, converged] = newton(coefficients, initialGuess);
            if converged
                [~, colorIndex] = min(vecnorm(roots - root));
                imageArray(j, i, :) = colors(colorIndex, :);
            else
                imageArray(j, i, :) = [0, 0, 0];
            end
        end
    end
    image(imageArray);
end

