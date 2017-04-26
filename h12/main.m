% H11

%% 11.1
close all;

load testdata_fisher.mat;

C1 = cov(X1);
C2 = cov(X2);
u1 = mean(X1);
u2 = mean(X2);

w = ((C1+C2)^-1)*(u2-u1)';

figure();
scatter(X1(:,1), X1(:,2), [], 'red');
hold on;
scatter(X2(:,1), X2(:,2), [], 'green');
plot(w);
axis equal;

hold off;

%% 11.2
close all;

c = (dot(w,u1) + dot(w,u2))/2;

sample_count = length(X1) + length(X2);
correct_preds = 0;

for i=1:length(X1)
    sample = X1(i,:);
    if dot(w, sample) < c
        correct_preds = correct_preds + 1;
    end
end

for i=1:length(X2)
    sample = X2(i,:);
    if dot(w, sample) >= c
        correct_preds = correct_preds + 1;
    end
end

disp(['Correctly predicted ' num2str(100*correct_preds/sample_count) '% of samples']);

%% 11.3

%% 11.7

%% 11.8
