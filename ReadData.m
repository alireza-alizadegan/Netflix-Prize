close all; clear; clc;
%load NetflixData_1000_1000
load mv10k
 
userCnt=size(CompleteData,1);
movieCnt=size(CompleteData,2);
 
[U,S,V]=svd(CompleteData.*Itrain);
 
train_count=1;
test_count=1;
desDim=4;
for i=1:userCnt
    for j=1:movieCnt
        if Itrain(i,j)==1
            x_train(:,train_count)=[U(i,1:desDim) V(j,1:desDim)]';
            y_train(train_count)=CompleteData(i,j);
            train_count=train_count+1;
        elseif CompleteData(i,j) ~= 0
            x_test(:,test_count)=[U(i,1:desDim) V(j,1:desDim)]';
            y_test(test_count)=CompleteData(i,j);
            test_count=test_count+1;
        end
    end
end
 
%save('Netflix_data','x_train','y_train','x_test','y_test')
save('mv10k_p','x_train','y_train','x_test','y_test')
