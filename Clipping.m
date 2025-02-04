function[NewSol]=Clipping(NewSol,lb,ub)

        NewSol.Position = max( NewSol.Position, lb);
        NewSol.Position = min(NewSol.Position, ub);

end