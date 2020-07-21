close all; clear; clc
load Netflix_data

% n=numel(y_train);
n=1e3;
% m=numel(y_test);
m=1e3;
lambda=10;
d=size(x_train,1);
sigma=1.5;

ybar=sum(y_train)/n;
ytilde=y_train-ybar;

for i=1:n
    for j=1:n
        K(i,j)=exp(-1/(2*sigma^2)*norm(x_train(i)-x_train(j))^2);
        O(i,j)=1/n;
    end
end
Ktilde=K-K*O-O*K+O*K*O;

yhat_train=ybar+ytilde'*(Ktilde+n*lambda*eye(n))^-1*Ktilde;
yhat_train=yhat_train';
e_train=y_train-yhat_train;
MSE_train=sum(e_train.^2)/98

for i=1:n
    for j=1:m
        Kprime(i,j)=exp(-1/(2*sigma^2)*norm(x_train(i)-x_test(j))^2);
    end
end
Onm=1/n*ones(n,m);
Ktildeprime=Kprime-K*Onm-O*Kprime+O*K*Onm;
yhat_test=ybar+ytilde'*(Ktilde+n*lambda*eye(n))^-1*Ktildeprime;
yhat_test=yhat_test';
e_test=y_test-yhat_test;
MSE_test=sum(e_test.^2)/numel(y_test)