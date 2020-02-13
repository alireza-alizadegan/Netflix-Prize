close all; clear; clc
% load 'LASSO'
load 'LASSO_mv10k'


subplot(131)
plot(LASSO(:,3),LASSO(:,1))
xlabel('Train time (sec)')
ylabel('Train error (RMSE)')
subplot(132)
plot(LASSO(:,3),LASSO(:,2))
xlabel('Train time (sec)')
ylabel('Test error (RMSE)')
subplot(133)
plot(LASSO(:,2))
xlabel('Iteration number')
ylabel('Test error (RMSE)')



