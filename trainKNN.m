load('train_feature_all.mat');


labels = zeros(387*50,1);

for i = 1 : (387*50)
    labels(i) = ceil(i/50);
    if mod(i,50) == 0
        disp(i/50);
    end
end

mdl = ClassificationKNN.fit(train_feature_all, labels);

save('kNNmodel.mat', 'mdl');