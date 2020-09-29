% [contexts, ctx_resp, fr_ind] = individual_relative_frequency(data,ids, nid, tau, from,till, addxlim, show)
%
% This function calculates the relative frequency of a individual given the
% tree (tau) and the trial to start (from) and end (till) the computation.
%
% ids is a list of ids to be included in the analysis.
% INPUT:
% data = matrix with all the data from the experiment obtained from responsetimeandresponses.mat
% ids = vector containing the ids (integers) included in the analysis. loading ids_final.mat,
% this corresponds to the ftids.
% nid = the number of the id of the volunteer  in ids.
% tau = the tree that will be depicted
% from = integer indicating from which trial begins
% till = integer indicating in which trial it ends
% addxlim = integer that adjust the graph of histogramns for better
% visualization
% show = 1 for showing the plot
% visualization
%
% OUTPUT:
% contexts = cell with dimensions 1 x |tau|. In each cell there is a
% context of tau
% ctx_resp = cell with dimensions |tau| x 1. In each cell there is a vector
% with all the responses given to the context.
% fr_ind = cell with the relative frequence per context (first column), 
% same order as in contexts. In the second column there is the number of
% times each context occurred.

% Author: Paulo Roberto Cabral Passos Last Modified:30/07/2020

function [contexts, ctx_resp, fr_ind] = individual_relative_frequency(data,ids, nid, tau, from,till, addxlim, show)


ids = sort(ids); 

% Improving Appearence of The Plots.

set(0,'defaultfigurecolor',[1 1 1])
set(0, 'DefaultFigureRenderer', 'painters');


% Standard Visualization Parameters

alfal = 3;   % length of the alphabet
maxhist = 1.1; % vertical edge of the histogram axis
id = ids(nid);
group = data(find(data(:,6) == id, 1),1);

% Contexts for Reference

tau1 = {0 , 2 , [0 1], [1 1]};
tau2 = {0 , 2, [0 0 1], [1 0 1], [2 0 1], [1 1]};
tau3 = {[ 0 0], [1 0], [2 0], 1, [0 2], [1 2], [2 2]};
tau4 = {0 , [0 1] , [2 1], 2};
tau5 = {2, [2 1], [2 0], [1 0], [0 1], [2 0 0], [1 0 0], [0 0 0]};
tau6 = {2 , [2 1], [2 0], [1 1], [1 0], [0 1], [0 0]};

t1r = {[1], [0], [2 1], [0]}; 
t2r = {[1 0], [0], [0], [1], [1], [2]};
t3r = {[1], [2], [0], [0 2], [2], [0], [1]};
t4r = {[0 1], [2], [0], [2 1]};
t5r = {[1 0], [0], [0], [1 0], [2], [1 0], [2], [2]};
t6r= {[1 0], [1 0], [1 0], [2], [2], [2], [2]};


eval(['contexts = tau' num2str(tau) ';' ])
eval(['tresp = t' num2str(tau) 'r;' ])

suport = cell(1,1);
for a = 1:length(contexts)
 suport{a,1} =  ['w = ' num2str(contexts{1,a}) ] ;
end

[ctx_rtime, ctx_er, ctx_resp, contexts, ctxrnds, ct_pos] = rtanderperctx(data, id, from, till, tau, 0);


if show == 1
    figure 
    f = gca;

    aux = 0;
    changetick = [];
    changelabel = cell(1,1);

    for b = 1:length(contexts)
       if b == 1
        aux = 1;
       else
        aux = aux+ alfal+1;
       end
       histogram([ctx_resp{b,1}+aux], 'Normalization','probability')
       hold on
       changetick = [changetick [0:alfal-1]+aux]; %#ok<AGROW>
    end

    xlabel('a', 'FontSize', 20)
    ylabel(['$F_{r}^{' num2str(nid) '}$'], 'Interpreter', 'Latex', 'FontSize', 20)

    f.XTick = changetick;

    aux = 0; c = 1;
    for b = 1:length(changetick)
    aux2 = isempty(find(tresp{1,c} == aux,1));
        if aux2 == 0
            if tresp{1,c}(1,1) == aux
            f.XTickLabel{b,1} = [ '**' num2str(aux) ];
            else
            f.XTickLabel{b,1} = [ '*' num2str(aux) ];    
            end
        else
            f.XTickLabel{b,1} =  num2str(aux);
        end    
        if aux == alfal-1
            aux = 0; c = c+1;
        else
           aux = aux+1;
        end
    end

    xtickangle(90)
    ylim([0 maxhist])
    f.XLim(1,2) = f.XLim(1,2)+ addxlim;
    legend(suport, 'FontSize', 10)
    title( ['\tau_{' num2str(tau) '}' ],'FontSize',20)
end


fr_ind = cell(length(contexts),2);

for a = 1:length(contexts)
   fr_ind{a,1} = zeros(alfal,1);
   for b = 1:alfal
       fr_ind{a,1}(b,1) = sum(ctx_resp{a,1} == (b-1))/length(ctx_resp{a,1});
   end
   fr_ind{a,2} = length(ctx_resp{a,1});
end

end
