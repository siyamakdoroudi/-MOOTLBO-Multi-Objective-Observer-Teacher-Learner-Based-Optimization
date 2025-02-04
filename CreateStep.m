function Step=CreateStep(pop,nPop,i);

        A = 1:nPop;
        A(i)=[];
        j = A(randi(nPop-1));
        Step = pop(i).Position - pop(j).Position;
        if Dominates(pop(j),pop(i))
          Step = -Step;
        end



end