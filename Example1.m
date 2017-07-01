image = 'city.jpg';
distRatio = 0.8;
H = [1 .2 0; .1 1 0; 0.5 0.2 1];
fprintf('Transform matrix from project instructions: \n');
disp(H);
im1_rgb = imread(image);
im1 = rgb2gray(im1_rgb);

TransformedIm = ComputeProjective(im1, H );
figure(1);
title('original image transformed by H given')
imshow(TransformedIm);
imwrite(im1, 'input.pgm', 'pgm');
imwrite(TransformedIm, 'output.pgm', 'pgm');

[num_matches,matches,dist_vals] = match('input.pgm', 'output.pgm', distRatio);
[displayedCorr]  =  DisplayCorr('input.pgm', 'output.pgm',matches, dist_vals, 15);

H_computed = DLT(matches);
fprintf('Transform matrix from DLT: \n');
disp(H);
TransformedIm = ComputeProjective(im1, H_computed );
figure(2);
title('original image transformed by H_computed')
imshow(TransformedIm);

[pnts_gt,pnts_computed] = ComputeTestPoints(H,H_computed);
error = ComputeError(pnts_gt,pnts_computed);


