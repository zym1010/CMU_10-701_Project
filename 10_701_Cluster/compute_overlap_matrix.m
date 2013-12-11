overlap_matrix = zeros(387,387,3);


for i = 1:387
    for j = i+1:387
        for k = 1:3
            set1 = values{i}{k};
            set2 = values{j}{k};
            setInterLength = length(intersect(set1,set2));
            overlap_matrix(i,j,k) = max(setInterLength/length(set1),setInterLength/length(set2));
            overlap_matrix(j,i,k) = overlap_matrix(i,j,k);
        end
    end
    disp(i);
    
end
            
            