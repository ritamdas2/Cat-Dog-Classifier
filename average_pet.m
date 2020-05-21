%This function takes in a data matrix X and a label
%vector y and outputs the average cat image and average dog image.
function [avgcat, avgdog] = average_pet(X,y)

%FILL IN CODE
[D, C] = size(X);
count = 1;
for i = 1:D
    if y(i) == -1
        catM(count,:) = X(i,:);
        count = count + 1;
    end
end
count = 1;
for i = 1:D
    if y(i) == 1
        dogM(count,:) = X(i,:);
        count = count + 1;
    end
end
for j = 1:C
    avgcat(j) = mean(catM(:,j));
    avgdog(j) = mean(dogM(:,j));
end
end

    
    