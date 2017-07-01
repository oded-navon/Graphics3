function [pnts_gt,pnts_computed] = ComputeTestPoints(H_gt,H_computed)
num_of_pts = 1;
for i=1:100
  for j=1:100
    pts = [i,j,1]';
    pnts_gt(num_of_pts,:) = H_gt*pts;
    pnts_computed(num_of_pts,:) = H_computed*pts;
    num_of_pts = num_of_pts + 1;
  end
end
end