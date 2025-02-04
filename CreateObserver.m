% This function creates the observer solution. 
function Observer=CreateObserver(nVar,pop,nPop);

      for j=1:nVar
      b =randi(nPop) ;
      Observer.Position(j) = pop(b).Position(j);
      end
end