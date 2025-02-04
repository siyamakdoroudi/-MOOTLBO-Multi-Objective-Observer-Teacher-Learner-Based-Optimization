clc;
clear;
close all;
profile on


%% Problem Definition
drawing_flag = 1;

TestProblem='UF4';
 switch TestProblem
     case {'UF2','UF4'}

     nVar=10;   % number of decision variables 
      
     otherwise
     nVar=10;
 end

fobj = cec09(TestProblem); % calculated objective function 

xrange = xboundary(TestProblem,nVar); % boundery decision variables 

% Lower bound and upper bound of decision variables
lb=xrange(:,1)';
ub=xrange(:,2)';

VarSize=[1 nVar];



%% MOTLBO Parameters

TrialNumber='UF2'; % UF1 is a benchmark problem of optimization 
%Selection of parameters
Trial=Parametersfinal(TrialNumber); % for any problems such as UF1  

mu=Trial(1);        % Crossover Percentage
gamma=Trial(2);     % Extra (to be deleted) Repository Member Selection Pressure
beta=Trial(3);      % Leader Selection Pressure Parameter
nPop=Trial(4);      % Population Size
MaxIt=Trial(5);     % Maximum Number of Iterations
nRep=Trial(6);      % Repository Size
alpha=0.1;          % Grid Inflation Parameter
nGrid=round(nRep/10);   % Number of Grids per each Dimension 
    




%% Initialization
pop=CreateEmptyIndividual(nPop);

for i=1:nPop

    pop(i).Position=zeros(1,nVar);
    for j=1:nVar
        pop(i).Position(1,j)=unifrnd(lb(j),ub(j),1);
    end
    pop(i).Cost=fobj(pop(i).Position')';

end
   
% Determine Domination
pop=DetermineDomination(pop);
rep=GetNonDominatedPop(pop);
rep_costs=GetCosts(rep);
Grid=CreateHypercubes(rep_costs,nGrid,alpha);
for i=1:numel(rep)
    [rep(i).GridIndex, rep(i).GridSubIndex]=GetGridIndex(rep(i),Grid);
end
%% MOOTBLO Main Loop

for it=1:MaxIt

 for i=1:nPop
      
        pm=(1-(it-1)/(MaxIt-1))^(1/mu);   
        newsol.Position=Mutate(pop(i).Position,pm,lb,ub); % mutation operation  
        
        [newsol]=Clipping(newsol,lb,ub);
        newsol.Cost=fobj(newsol.Position')';   % this function calculate objective functions
       
        if Dominates(newsol,pop(i)) 
            pop(i).Position=newsol.Position;
            pop(i).Cost=newsol.Cost;
            
        elseif Dominates(pop(i),newsol)
            % Do Nothing
            
        else
            if rand<0.5
                pop(i).Position=newsol.Position;
                pop(i).Cost=newsol.Cost;
            end
        end  
     
        Mean=GetMean(pop,nPop);  % The average of students is calculated.
    
        clear rep2
        clear rep3
        
         % leader selection 
        L1=SelectLeader(rep,beta);
        L2=SelectLeader(rep,beta);
        L3=SelectLeader(rep,beta);
        
        % If there are less than three solutions in the least crowded
        % hypercube, the second least crowded hypercube is also found
        % to choose other leaders from.
        if size(rep,1)>1
            counter=0;
            for newi=1:size(rep,1)
                if sum(L1.Position~=rep(newi).Position)~=0
                    counter=counter+1;
                    rep2(counter,1)=rep(newi);%#ok
                end
            end
            L2=SelectLeader(rep2,beta);
        end
        
        % This scenario is the same if the second least crowded hypercube
        % has one solution, so the delta leader should be chosen from the
        % third least crowded hypercube.
        if size(rep,1)>2
            counter=0;
            for newi=1:size(rep2,1)
                if sum(L2.Position~=rep2(newi).Position)~=0
                    counter=counter+1;
                    rep3(counter,1)=rep2(newi);%#ok
                end
            end
            
            if counter==0
            L3=SelectLeader(rep,beta);
            else
            L3=SelectLeader(rep3,beta);
            end
        end
        
    X1=Createnewsol(pop,L1,Mean,i,VarSize);
    X2=Createnewsol(pop,L2,Mean,i,VarSize);
    X3=Createnewsol(pop,L3,Mean,i,VarSize);
    newsol.Position=(X1.Position+X2.Position+X3.Position)/3.0;
     % Boundary checking
   [newsol]=Clipping(newsol,lb,ub);  
   newsol.Cost=fobj(newsol.Position')';
    %Comparition Between New Position and ith Position    
         if Dominates(newsol,pop(i))
            pop(i).Position=newsol.Position;
            pop(i).Cost=newsol.Cost;
            
        elseif Dominates(pop(i),newsol)
            % Do Nothing
            
        else
            if rand<0.5
                pop(i).Position=newsol.Position;
                pop(i).Cost=newsol.Cost;
            end
         end 
        
         
 %select Teacher or Observer 
    d=rand(1);
    if d< 0.5
 
    % Teacher Phase
    % Select Teacher
    Teacher=SelectLeader(rep,beta);
    
 % Teaching Factor
        TF = randi([1 2]);  % parameter in MOTLBO
        
 % Teaching (moving towards teacher)
        newsol.Position = pop(i).Position ...
            + rand(VarSize).*(Teacher.Position - TF*Mean);
 % Boundary checking
   [newsol]=Clipping(newsol,lb,ub);  
   newsol.Cost=fobj(newsol.Position')';
 %Comparition Between New Position and ith Position    
         if Dominates(newsol,pop(i))
            pop(i).Position=newsol.Position;
            pop(i).Cost=newsol.Cost;
            
        elseif Dominates(pop(i),newsol)
            % Do Nothing
            
        else
            if rand<0.5
                pop(i).Position=newsol.Position;
                pop(i).Cost=newsol.Cost;
            end
        end     
 
    else 
     % Observer Phase
     % Select Observer  
       Observer=CreateObserver(nVar,pop,nPop);

       Observer=Clipping(Observer,lb,ub);              
   
       Observer.Cost=fobj(Observer.Position')';
      %Comparition Between Observer  and ith Position
        if Dominates(Observer,pop(i))
            pop(i).Position=Observer.Position;
            pop(i).Cost=Observer.Cost;
            
        elseif Dominates(pop(i),Observer)
            % Do Nothing
            
        else
            if rand<0.5
                pop(i).Position=Observer.Position;
                pop(i).Cost=Observer.Cost;
            end
        end 
    end 
    
   % Learner Phase
        Step=CreateStep(pop,nPop,i);

        
        % Teaching (moving towards Beter Learner)
        newsol.Position = pop(i).Position + rand(VarSize).*Step;
       % Boundary checking
       [newsol]=Clipping(newsol,lb,ub);  
        newsol.Cost=fobj(newsol.Position')';
        % %Comparition Between newsol  and ith Position
        if Dominates(newsol,pop(i))
            pop(i).Position=newsol.Position;
            pop(i).Cost=newsol.Cost;
            
        elseif Dominates(pop(i),newsol)
            % Do Nothing
            
        else
            if rand<0.5
                pop(i).Position=newsol.Position;
                pop(i).Cost=newsol.Cost;
            end
        end 

 end
 % Add Non-Dominated Particles to Repository
    pop=DetermineDomination(pop);
    non_dominated_pop=GetNonDominatedPop(pop); 
    rep=[rep
        non_dominated_pop]; %#ok
  % Determine Domination of New Resository Members  
    rep=DetermineDomination(rep);
    rep=GetNonDominatedPop(rep);
   % rep=deletrep(rep);
    rep_costs=GetCosts(rep);
    %  Update Grid and GridIndex
    Grid=CreateHypercubes(rep_costs,nGrid,alpha);
    for i=1:numel(rep)
        [rep(i).GridIndex rep(i).GridSubIndex]=GetGridIndex(rep(i),Grid);%#ok
    end  
    if numel(rep)>nRep
        EXTRA=numel(rep)-nRep;
        rep=DeleteFromRep(rep,EXTRA,gamma);
        
        rep_costs=GetCosts(rep);
        Grid=CreateHypercubes(rep_costs,nGrid,alpha);
         for i=1:numel(rep)
           [rep(i).GridIndex rep(i).GridSubIndex]=GetGridIndex(rep(i),Grid);%#ok
         end 
    end
    % Show Iteration Information
   
    disp(['In iteration ' num2str(it) ': Number of solutions in the repository = ' num2str(numel(rep))]);
    save results
    costs=GetCosts(pop);
    rep_costs=GetCosts(rep);
     if drawing_flag==1
        figure(1);
        hold off
        plot(costs(1,:),costs(2,:),'k.');
        hold on
        plot(rep_costs(1,:),rep_costs(2,:),'rd');
        legend('MOTLBO','Non-dominated solutions');
        drawnow

        
    end

end







