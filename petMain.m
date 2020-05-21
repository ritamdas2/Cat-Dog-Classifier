[X, y] = read_data();
[avgcat, avgdog] = average_pet(X,y);
show_image(avgcat,1);
show_image(avgdog,1);

testpercent = 80;
[Xtrain, ytrain, Xrun, yrun] = split_data(X,y,testpercent);
yguess = closest_average(Xtrain,ytrain,Xrun);
acc = calculate_accuracy(yrun',yguess);

%[Xtrain, ytrain, Xrun, yrun] = split_data(X,y,testpercent);
yguess = nearest_neighbor(Xtrain, ytrain, Xrun);
acc1 = calculate_accuracy(yrun,yguess);

yguess = linear_regression(Xtrain, ytrain, Xrun);
acc2 = calculate_accuracy(yrun,yguess);

pca_regression(Xtrain, ytrain, Xrun, 10);
accK10 = calculate_accuracy(yrun,yguess);
pca_regression(Xtrain, ytrain, Xrun, 20);
accK20 = calculate_accuracy(yrun,yguess);
pca_regression(Xtrain, ytrain, Xrun, 50);
accK50 = calculate_accuracy(yrun,yguess);
pca_regression(Xtrain, ytrain, Xrun, 100);
accK100 = calculate_accuracy(yrun,yguess);

