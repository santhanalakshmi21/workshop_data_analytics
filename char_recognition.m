letter=readtable("M.txt")
plot(letter.X,letter.Y)
figure;
m=letter.X*1.5
letter.X=m
axis equal
plot(letter.X,letter.Y)
figure;
letter.Time=(letter.Time-letter.Time(1))/1000
plot(letter.Time,letter.X)
plot(letter.Time,letter.Y)
dur=letter.Time(end)
aratio=range(letter.Y)/range(letter.X)
features=readtable("features.txt")
scatter(features.AspectRatio,features.Duration)
figure;
gscatter(features.AspectRatio,features.Duration,features.Character)
figure;
knnmodel=fitcknn(features,"Character")
testdata=readtable("testdata.txt")
predictions=predict(knnmodel,testdata)
knnmodel = fitcknn(features,"Character","NumNeighbors",5)
predictions = predict(knnmodel,testdata)
[predictions,testdata.Character]
iscorrect= strcmp(predictions,testdata.Character)
accuracy=sum(iscorrect)/numel(predictions)
confusionchart(testdata.Character,predictions)



