function xnew=Mutate5(x,pm,VarMin,VarMax)

    nVar=numel(x);
    VarSize=[1 nVar];
    j=randi([0 1], VarSize);
   
    S=find(j~=0);
    n=numel(S);

    dx=pm*(VarMax-VarMin);
     xnew=x;
    for i=1:n
        k=S(i);
    lb=x(k)-dx;
    
    if lb<VarMin
        lb=VarMin;
    end
    
    ub=x(k)+dx;
    if ub>VarMax
        ub=VarMax;
    end
    
    xnew(k)=unifrnd(lb(k),ub(k));
    end 
end