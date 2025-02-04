function newsol=Createnewsol(pop,Teacher,Mean,i,VarSize);


 % Teaching Factorar
        TF = randi([1 2]);  % parameter in MOTLBO
        
 % Teaching (moving towards teacher)
        newsol.Position = pop(i).Position ...
            + rand(VarSize).*(Teacher.Position - TF*Mean);
end