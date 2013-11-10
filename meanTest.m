totalLength = zeros(90024,1);
for i = 1 : 90024
    load(['test', int2str(i), '.mat']);
    totalLength(i) = recording(end,1);
    assert(recording(1,1)==0);
end

std(totalLength)
mean(totalLength)

%[IDX2, C2] = kmeans(totalLength,2);
%[IDX3, C3] = kmeans(totalLength,3);

%{
newTotalLength = totalLength(find(abs(zscore(totalLength))<=2));
std(newTotalLength)
mean(newTotalLength)

newTotalLength = newTotalLength(find(abs(zscore(newTotalLength))<=2));
std(newTotalLength)
mean(newTotalLength)
%}

%{
newTotalLength = totalLength(find(abs(zscore(totalLength))<=1.5));
std(newTotalLength)
mean(newTotalLength)

newTotalLength = newTotalLength(find(abs(zscore(newTotalLength))<=1.5));
std(newTotalLength)
mean(newTotalLength)

newTotalLength = totalLength(find(abs(zscore(totalLength))<=1.2));
std(newTotalLength)
mean(newTotalLength)

newTotalLength = newTotalLength(find(abs(zscore(newTotalLength))<=1.2));
std(newTotalLength)
mean(newTotalLength)
%}

newTotalLength = totalLength(find(abs(zscore(totalLength))<=1));
std(newTotalLength)
mean(newTotalLength)

newTotalLength = newTotalLength(find(abs(zscore(newTotalLength))<=1));
std(newTotalLength)
mean(newTotalLength)