close all; clear; clc
load Netflix_data
% load mv10k

n=numel(y_train);
d=size(x_train,1);

xbar=sum(x_train,2)/n;
ybar=sum(y_train)/n;

%%%  gradient descent %%%
w1(:,1)=randn(d,1);
% w1(:,1)=3e1*ones(d,1);
lambda=0e-1;

rng(0)
indperm=randperm(n);
indcount=1;
niter=1500;
for k=1:niter
    tic
    alpha=1e-1/k;
    w1(:,k+1)=w1(:,k)-2*alpha*((x_train(:,indperm(indcount))-xbar)*(w1(:,k)'*(x_train(:,indperm(indcount))-xbar)-(y_train(indperm(indcount)))-ybar)+(n/2)*lambda*delg(w1(:,k)));
    %     training error
    b(k+1)=ybar-w1(:,k+1)'*xbar;
    y_pred_train=(round(x_train'*w1(:,k+1)+b(k+1)))';
    y_pred_train(y_pred_train>5)=5;
    y_pred_train(y_pred_train<1)=1;
    e_train=y_train-y_pred_train;
    RMSE_train(k+1)=sqrt(sum(e_train.^2)/numel(y_train));
    perc_e_train(k+1)=sum(abs(e_train)>=1)/numel(y_train);
    
    %     test error
    y_pred_test=(round(x_test'*w1(:,k+1)+b(k+1)))';
    y_pred_test(y_pred_test>5)=5;
    y_pred_test(y_pred_test<1)=1;
    e_test=y_test-y_pred_test;
    RMSE_test(k+1)=sqrt(sum(e_test.^2)/numel(y_test));
    perc_e_test(k+1)=sum(abs(e_test)>=1)/numel(y_test);
    %
    indcount=indcount+1;
    elapsed(k)=toc;
end
LASSO(1:niter,:)=[RMSE_train(2:end)' RMSE_test(2:end)' cumsum(elapsed)'];
LASSO_class(1:niter,:)=[perc_e_train(2:end)' perc_e_test(2:end)' cumsum(elapsed)'];
save('LASSONetf');
save('LASSO','LASSO','LASSO_class');
% save('LASSO_mv10k','LASSO','LASSO_class');