%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the PCA basis. 
%It also takes in a data matrix Xrun and a dimension k
%and uses the top-k vectors in the PCA basis to reduce the 
%dimension of Xtrain and Xrun. Finally, it uses the reduced data
%as inputs to the linear_regression function to produce 
%a vector of label guesses yguess.
function yguess = pca_regression(Xtrain,ytrain,Xtest,k)

%FILL IN CODE
VT = pca(Xtrain);
VT = [VT zeros(4096,1)];
VT_k = [VT zeros(4096,1)];

for i = 1:k
    VT_k(:,i) = VT(:,i);
end
Xtrainb = Xtrain*VT_k;
Xrunb = Xtest*VT_k;
bols = pinv((Xtrainb')*Xtrainb)*(Xtrainb')*ytrain;
hlinX = sign(Xrunb*bols);
yguess = hlinX;
end