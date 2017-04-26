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
close all;

im_orig = imread('canoe.jpg');
figure();
imshow(im_orig, []);

[x, y] = ginput(2);
x = int32(x);
y = int32(y);

window1 = im_orig(y(1)-3:y(1)+3, x(1)-3:x(1)+3, :);
window2 = im_orig(y(2)-3:y(2)+3, x(2)-3:x(2)+3, :);

X1 = double(reshape(window1, 49, 3));
X2 = double(reshape(window2, 49, 3));


C1 = cov(X1);
C2 = cov(X2);
u1 = mean(X1);
u2 = mean(X2);

w = ((C1+C2)^-1)*(u2-u1)';


%% 11.7
close all;

load testdata_svm.mat;

training = [X1, X2]';
classes = [ones(length(X1), 1); zeros(length(X2), 1)];
figure();
svm_struct = svmtrain(training, classes, 'showplot', true);
result = svmclassify(svm_struct, training);

sample_count = length(classes);
correct_preds = sum(classes == result);

disp(['Correctly predicted ' num2str(100*correct_preds/sample_count) '% of samples']);

%% 11.8
close all;

kernels = {'quadratic', 'polynomial', 'rbf'};
figure();

for i=1:length(kernels)
    kernel = kernels{i};

    figure();
    svm_struct = svmtrain(training, classes, 'showplot', true, 'kernel_function', kernel);
    result = svmclassify(svm_struct, training);

    sample_count = length(classes);
    correct_preds = sum(classes == result);

    disp(['Correctly predicted ' num2str(100*correct_preds/sample_count) '% of samples with ' kernel ' kernel']);
end
