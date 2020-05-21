%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess, corresponding to whether
%each row of Xrun is closer to the average cat or average dog.
function yguess = closest_average(Xtrain,ytrain,Xrun)

%FILL IN CODE
[DXtrain, CXtrain] = size(Xtrain);
count = 1;
for i = 1:DXtrain
    if ytrain(i) == -1
        catMtrain(count,:) = Xtrain(i,:);
        count = count + 1;
    end
end
count = 1;
for i = 1:DXtrain
    if ytrain(i) == 1
        dogMtrain(count,:) = Xtrain(i,:);
        count = count + 1;
    end
end
for j = 1:CXtrain
    avgcattrain(j) = mean(catMtrain(:,j));
    avgdogtrain(j) = mean(dogMtrain(:,j));
end
[DXrun, CXrun] = size(Xrun);
for i = 1:DXrun
    rowdiffC(i,:) = Xrun(i,:) - avgcattrain;
    rowdistC(i) = (sum((rowdiffC(i,:).^2))).^(1/2);
    rowdiffD(i,:) = Xrun(i,:) - avgdogtrain;
    rowdistD(i) = (sum((rowdiffD(i,:).^2))).^(1/2);
    if rowdistC(i) > rowdistD(i)
        yguess(i) = 1;
    else
        yguess(i) = -1;
    end
end
end