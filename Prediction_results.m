close all; clear; clc
load 'RidgeNetf'
load 'LASSONetf'


No=1e3;

plot(y_train(1:No)); hold on
plot(y_pred_train(1:No),'-r')

figure
plot(y_test(1:No)); hold on
plot(y_pred_test(1:No),'-r')