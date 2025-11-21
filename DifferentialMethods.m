classdef DifferentialMethods < NumericalMethod
    methods
        function solve(obj)
            % Example: Newton–Raphson for f(x) = x^3 - x - 2
            tic;
            f = obj.f;
            df = @(x) 3*x.^2 - 1;
            x0 = 2;
            x1 = x0 - f(x0)/df(x0);
            while abs(x1 - x0) > obj.tol
                x0 = x1;
                x1 = x0 - f(x0)/df(x0);
            end
            obj.result = x1;
            obj.timeTaken = toc;
            fprintf('Newton-Raphson result: %.4f, time: %.4fs\n', obj.result, obj.timeTaken);
        end
    end
end