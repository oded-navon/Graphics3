function [ TransformedIm ] = ComputeProjective(Im, H )
%ComputeProjective computes a projective transformation of the input image.
%   Detailed explanation goes here
img = imread(Im);
tform = projective2d(H);
TransformedIm = imwarp(img,tform);

figure;
imshow(TransformedIm);
imwrite(TransformedIm, 'dogOutput.pgm', 'pgm');
end

