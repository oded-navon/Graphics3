function [ num_matches,matches,dist_vals ] = match(image1, image2, distRatio)
%match Summary of this function goes here
%   Detailed explanation goes here
[im1, des1, loc1] = sift(image1);
[im2, des2, loc2] = sift(image2);

dist_vals_not_final = zeros(size(des1,1),1);

% For each descriptor in the first image, select its match to second image.
des2t = des2';                          % Precompute matrix transpose
for i = 1 : size(des1,1)
   dotprods = des1(i,:) * des2t;        % Computes vector of dot products
   [vals,indx] = sort(acos(dotprods));  % Take inverse cosine and sort results

   % Check if nearest neighbor has angle less than distRatio times 2nd.
   if (vals(1) < distRatio * vals(2))
       dist_vals_not_final(i) = vals(1);
      match(i) = indx(1);
   else
      match(i) = 0;
   end
end

num_matches = sum(match > 0);
matches = zeros(num_matches,4);
dist_vals = zeros(num_matches,1);
count = 1;

for i = 1: size(des1,1)
  if (match(i) > 0)
      dist_vals(count) = dist_vals_not_final(i);
      matches(count,1:2) = [loc1(i,2) loc1(i,1)];
      matches(count,3:4) = [loc2(match(i),2) loc2(match(i),1)];
      count = count+1;
  end
end

fprintf('Found %d matches.\n', num_matches);

end

