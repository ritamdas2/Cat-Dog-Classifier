%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess. Each guess is found
%by searching through Xtrain to find the closest row, and then 
%outputting its label.
function yguess = nearest_neighbor(Xtrain,ytrain,Xrun)

%FILL IN CODE
[DXtrain, CXtrain] = size(Xtrain);
[DXrun, CXrun] = size(Xrun);
yguess = zeros(DXrun,1);
for i = 1:DXrun
    nearest = Inf;
    for j = 1:DXtrain
        d = norm(Xrun(i,:) - Xtrain(j,:));
        if d < nearest
            nearest = d;
            yguess(i) = ytrain(j);
        end
    end
end
end
        