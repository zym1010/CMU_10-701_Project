load('kNNmodel.mat');
load('test_feature_all.mat');

test_num = size(test_feature_all,1);

label = zeros(test_num,1);
score = zeros(test_num,387);

mdl.NumNeighbors = 25;

for i = 1 : 43
    startPoint = (i-1)*10000+1;
    endPoint = min(i*10000, test_num);
    xNew = test_feature_all(startPoint:endPoint, :);
    [label(startPoint:endPoint), score(startPoint:endPoint, :)] = predict(mdl, xNew);
    disp(i*10000);
end

save('kNNresult.mat', 'label', 'score');