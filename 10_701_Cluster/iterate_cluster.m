load('distances.mat');

membershipArray = zeros(90024,2);

membershipArray(:,1) = 1:90024;
membershipArray(:,2) = 1:90024;

checked = zeros(90024,1);
near_distance_all = zeros(90024,2);

for i = 1:90024
    if checked(i)
        continue;
    end
    
%     distance_vector = full(distances(i,:));
%     
%     number_zero = length(distance_vector) - nnz(distance_vector);
%     
%     [~,idx] = sort(distance_vector);
%     
%     nearIdx = idx([number_zero+1 number_zero+2]);
    
    distance_vector = full(distances(i,:));
    
    non_zeros = nonzeros(distance_vector);
    
    non_zeros = sort(non_zeros);
    
    
    %fprintf('distance 1: %f, distance 2: %f\n', near_distance(1), near_distance(2));
    near_distance_all(i,:)=non_zeros(1:2);
    i
end