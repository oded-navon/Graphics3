function [displayedCorr] = DisplayCorr(image1, image2, matches, dist_vals, x)
%DisplayCorr Displays a chosen number of the top correspondences.
%   Detailed explanation goes here
%[ a,matches,dist_vals ] = match(image1, image2, 0.5);

num_matches = size(matches,1);
displayedCorr = zeros(num_matches,4);

matches_with_dist = zeros(num_matches,5);
matches_with_dist(:,1:4) = matches(:,1:4);
matches_with_dist(:,5) = dist_vals(:,1);

sorted = sortrows(matches_with_dist,5);
im1 = imread(image1);
im2 = imread(image2);
cols1 = size(im1,2);

% Create a new image showing the two images side by side.
im3 = appendimages(im1,im2);

% Show a figure with lines joining the accepted matches.
figure('Position', [100 100 size(im3,2) size(im3,1)]);
colormap('gray');
imagesc(im3);
hold on;
for i = 1:x
    text(sorted(i,1), sorted(i,2), num2str(i),'Color','red','FontSize',20);
    text(sorted(i,3)+cols1, sorted(i,4), num2str(i),'Color','red','FontSize',20);
end
hold off;


end

