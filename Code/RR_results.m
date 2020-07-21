close all; clear; clc
load 'RR'
% load 'RR_mv10k'

subplot(131)
plot(RR(:,3),RR(:,1))
xlabel('Train time (sec)')
ylabel('Train error (RMSE)')
subplot(132)
plot(RR(:,3),RR(:,2))
xlabel('Train time (sec)')
ylabel('Test error (RMSE)')
subplot(133)
plot(RR(:,2))
xlabel('Iteration number')
ylabel('Test error (RMSE)')


