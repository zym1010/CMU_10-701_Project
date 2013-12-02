function getBelief_SVM(test_score, suffix)

load('alleged_device_ID_list.mat');
load('id_list_train.mat');

belief = zeros(90024,1);

fid = fopen(['submission_smooth_' suffix '.csv'], 'w');
fprintf(fid,'QuestionID,IsTrue\n');

for i = 1 : 90024
    device_num = find(id_list == alleged_device_ID_list(i));
    belief(i) = test_score(i,device_num);
    fprintf(fid, '%d,%f\n', i, belief(i));
end

fclose(fid);

end