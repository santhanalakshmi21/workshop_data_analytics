clc
clear all
close all
load irisdata.m;%%importing dataset
XY=irisdata;% store in a variable
X=XY(:,1:4);%input
Y=XY(:, 5:7);%output
X2 = X(1:2:150,:);%%testing input data
Y2 = Y(1:2:150,:);%%testing output data
X([1:2:150],:)=[];%%removing test date from the input
Y([1:2:150],:)=[];%%removing test data from the output
X1 = X;%%training input data
Y1 = Y;%%training output data
minX1=min(X1);
maxX1=max(X1);
for i=1:size(X1,1)
    for j=1:size(X1,2)
        X1n(i,j)=(X1(i,j)-minX1(j))/(maxX1(j)-minX1(j));
    end
end
minX2=min(X2);
maxX2=max(X2);
for i=1:size(X2,1)
    for j=1:size(X2,2)
        X2n(i,j)=(X2(i,j)-minX2(j))/(maxX2(j)-minX2(j));
    end
end
minY1=min(Y1);
maxY1=max(Y1);
for i=1:size(Y1,1)
    for j=1:size(Y1,2)
        Y1n(i,j)=(Y1(i,j)-minY1(j))/(maxY1(j)-minY1(j));
    end
end
minY2=min(Y2);
maxY2=max(Y2);
for i=1:size(Y2,1)
    for j=1:size(Y2,2)
        Y2n(i,j)=(Y2(i,j)-minY2(j))/(maxY2(j)-minY2(j));
    end
end
net = feedforwardnet(20,'trainlm');%%build the model levenberg macquardt
rand('seed',0);
net.layers{1}.initFcn='initwb';%% weights and bias initialization
net.inputWeights{1,1}.initFcn='rands';
net.biases{1,1}.initFcn='rands';
net.biases{2,1}.initFcn='rands';
net=init(net);%%you have to initialize your algorithm
net.trainParam.epochs =1500;%iteration
net.trainParam.goal = 0.01%goal
[net TR] = train(net,X1n',Y1n');   %train the model
MseTr=TR.perf(size(TR.perf,2))%error in training model
W1=net.IW{1,1};%%implementing weights and bias in network
b1=net.b{1,1};
W2=net.LW{2};
b2=net.b{2};
[y]=sim(net,X2n');%simulate the network
E=Y2n'-y;%%y- ANN output and Y2 ground truth
MseTe=mse(E)%testing error
for i=1:75
        if (Y2n(i)==y(i))
        cc=cc+1;
    end
end  

