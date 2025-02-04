function Mean=GetMean(pop,nPop);
       Mean=0;
    
    for j=1:nPop
        Mean = Mean + pop(j).Position;
       
    end
    Mean = Mean/nPop;




end