classdef IntegralMethods < NumericalMethod
    methods
        function solve(obj)
            % Example: Runge–Kutta 2nd Order for dv/dt = 9.8 - 0.2v
            tic;
            f = obj.f;      % function handle f(t,v)
            t0 = 0;         % initial time
            v0 = 0;         % initial velocity
            h = 2;          % step size
            tn = 50;        % final time
            n = (tn - t0)/h;

            t(1) = t0;
            v(1) = v0;

            for i = 1:n
                t(i+1) = t0 + i*h;
                k1 = h * f(t(i), v(i));
                k2 = h * f(t(i+1), v(i) + k1);
                v(i+1) = v(i) + 0.5 * (k1 + k2);
                fprintf('v(%.2f) = %.4f\n', t(i+1), v(i+1));
            end

            obj.result = v(end);       % Final value after integration
            obj.timeTaken = toc;
            fprintf('Final velocity after %.2f s = %.4f\n', t(end), obj.result);
            fprintf('Time taken: %.4f s\n', obj.timeTaken);
        end
    end
end