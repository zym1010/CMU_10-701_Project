function calcDist_par_sparse(len)

if nargin < 1
    len = 90024;
end
    
load('start_end_test_double.mat');

distances = sparse([],[],[],len,len);

start_end_d = start_end_d(1:len,:);

for i = 1 : len
    dist1 = Inf(len,1);
    dist2 = Inf(len,1);
    
    idx1 = (start_end_d(i,1) >= start_end_d(:,2));
    idx1(i) = 0;
    
%     idx1_debug = (start_end_d(i,1) > start_end_d(:,2));
    
%     assert(isequal(idx1_debug,idx1));
    
    dist1(idx1) = start_end_d(i,1) - start_end_d(idx1,2);
    
    idx2 = (start_end_d(i,2) <= start_end_d(:,1));
    idx2(i) = 0;
%     idx2_debug = (start_end_d(i,2) < start_end_d(:,1));
    
%     assert(isequal(idx2_debug,idx2));
    
    dist2(idx2) = start_end_d(idx2,1) - start_end_d(i,2);
    
    tempDist = min(dist1,dist2);
    
    [tempDist,distIdx] = sort(tempDist);
    
    distance_to_be_saved = tempDist(1:5);
    
    distance_to_be_saved(distance_to_be_saved==0) = eps;
    
    distances(i,distIdx(1:5)) = distance_to_be_saved;
    
    disp(i);
end

save('distances.mat', 'distances');

end