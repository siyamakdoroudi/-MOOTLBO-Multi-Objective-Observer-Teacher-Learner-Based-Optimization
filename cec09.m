% cec09.m
% 
% The Matlab version of the test instances for CEC 2009 Multiobjective
%   Optimization Competition UF2 and UF4.
% 
% Usage: fobj = cec09(problem_name), the handle of the function will be
%   with fobj
% 
% Please refer to the report for correct one if the source codes are not
%   consist with the report.
% History:


function fobj = cec09(name)

    switch name
        case 'UF2'
            fobj = @UF2;
        case 'UF4'
             fobj = @UF4; 
        
    end
end



%% UF2
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function y = UF2(x)
    [dim, num]  = size(x);
    X1          = repmat(x(1,:),[dim-1,1]);
    A           = 6*pi*X1 + pi/dim*repmat((2:dim)',[1,num]);
    tmp         = zeros(dim,num);    
    tmp(2:dim,:)= (x(2:dim,:) - 0.3*X1.*(X1.*cos(4.0*A)+2.0).*cos(A)).^2;
    tmp1        = sum(tmp(3:2:dim,:));  % odd index
    tmp(2:dim,:)= (x(2:dim,:) - 0.3*X1.*(X1.*cos(4.0*A)+2.0).*sin(A)).^2;
    tmp2        = sum(tmp(2:2:dim,:));  % even index
    y(1,:)      = x(1,:)             + 2.0*tmp1/size(3:2:dim,2);
    y(2,:)      = 1.0 - sqrt(x(1,:)) + 2.0*tmp2/size(2:2:dim,2);
    clear X1 A tmp;
end
%% UF4
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function y = UF4(x)
    [dim, num]  = size(x);
    Y           = zeros(dim,num);
    Y(2:dim,:)  = x(2:dim,:) - sin(6.0*pi*repmat(x(1,:),[dim-1,1]) + pi/dim*repmat((2:dim)',[1,num]));
    H           = zeros(dim,num);
    H(2:dim,:)  = abs(Y(2:dim,:))./(1.0+exp(2.0*abs(Y(2:dim,:))));
    tmp1        = sum(H(3:2:dim,:));  % odd index
    tmp2        = sum(H(2:2:dim,:));  % even index
    y(1,:)      = x(1,:)          + 2.0*tmp1/size(3:2:dim,2);
    y(2,:)      = 1.0 - x(1,:).^2 + 2.0*tmp2/size(2:2:dim,2);
    clear Y H;
end







