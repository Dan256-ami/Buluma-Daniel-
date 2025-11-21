classdef (Abstract) NumericalMethod
    properties
        f       % Function handle
        tol     % Tolerance
        result  % Final result
        timeTaken % Computation time
    end
    
    methods
        function obj = NumericalMethod(f, tol)
            if nargin > 0
                obj.f = f;
                obj.tol = tol;
            end
        end
    end
    
    methods (Abstract)
        solve(obj); % Abstract method to be implemented by subclasses
    end
end