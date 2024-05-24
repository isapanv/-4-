function [root, converged] = newton(coefficients, initialGuess)
    maxIterations = 100;
    tol = 1e-6;

    f = @(x) polyval(coefficients, x);
    df = @(x) polyval(polyder(coefficients), x);

    x = initialGuess;

    for i = 1:maxIterations
        fx = f(x);
        dfx = df(x);

        if abs(fx) < tol
            converged = true;
            root = x;
            return;
        end

        x = x - fx / dfx;
    end

    converged = false;
    root = x;
end
