% Parameters.m
% This function determines the parameters of the multi-objective algorithm based on the problems.

function Trial = Parametersfinal(name)
    switch name

        case 'UF2'
           mu=0.5;gamma=2;beta=8;nPop=200;nItr=1250;nRep=200;
           Trial=[mu;gamma;beta;nPop;nItr;nRep];  
        case 'UF4'
           mu=0.5;gamma=2;beta=2;nPop=100;nItr=1250;nRep=200;
           Trial=[mu;gamma;beta;nPop;nItr;nRep];   



    end
end
