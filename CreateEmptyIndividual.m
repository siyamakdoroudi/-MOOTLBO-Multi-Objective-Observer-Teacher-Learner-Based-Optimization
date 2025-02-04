%_________________________________________________________________  __  %
%  Multi-Objective Observer-Teacher-Learner-Based-Optimizatin (MOOTLBO) %
                                 
%                                                                       %
%  Developed in MATLAB R2020b(7.13)                                     %
%                                                                       %
%  Author and programmer: siyamak doroudi                               %
%                                                                       %
%         e-Mail: siyamak.doroudi@yahoo.com.com                         %
%                                                                       %
%   Main paper:                                                         %              
% Doroudi, S., Sharafati, A. and Mohajeri, S. H. (2023)                 %
% MOOTLBO: a new multi-objective observer–teacher–learner-              %
% based optimization’,                                                  %
% Soft Computing, 27(20), pp. 15003–15032.                              %
% DOI: 10.1007/s00500-023-08603-0.                                      %
%                                                                       %
%__________________________________________________________________
%




function pop=CreateEmptyIndividual(n)
    
    if nargin<1
        n=1;
    end

empty_individual.Position=[];
empty_individual.Cost=[];
empty_individual.IsDominated=[];
empty_individual.GridIndex=[];
empty_individual.GridSubIndex=[];
    
    pop=repmat(empty_individual,n,1);
    
end