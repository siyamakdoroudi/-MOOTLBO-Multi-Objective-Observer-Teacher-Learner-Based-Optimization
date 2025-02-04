% The Matlab source codes to generate the boudnaries of the test instances
%for CEC 2009 Multiobjective Optimization Competition such az UF1,UF2. 
%for DTLZS problems,


function range = xboundary(name,dim)

    range = ones(dim,2);
    
    switch name
        case {'UF2'}
            range(1,1)      =  0;
            range(2:dim,1)  = -1;
    
        case {'UF4'}
            range(1,1)      =  0;
            range(2:dim,1)  = -2;
            range(2:dim,2)  =  2; 

        
    end
end