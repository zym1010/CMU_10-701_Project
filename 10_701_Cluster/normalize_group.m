function [ newMembershipArray ] = normalize_group( membershipArray )
%NORMALIZE_GROUP Summary of this function goes here
%   Detailed explanation goes here
uniqueGroups = unique(membershipArray)

newMembershipArray = zeros(size(membershipArray));

for i = 1:length(uniqueGroups)
    idx = (membershipArray==uniqueGroups(i));
    newMembershipArray(idx) = i;
end

end

