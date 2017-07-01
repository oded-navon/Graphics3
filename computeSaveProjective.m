function [ TransformedIm ] = computeSaveProjective(Im, H )
%ComputeProjective computes a projective transformation of the input image.
%   Detailed explanation goes here
img = imread(Im);
tform = projective2d(H);
TransformedIm = imwarp(img,tform);

figure;
imshow(TransformedIm);
imwrite(TransformedIm, 'output.pgm', 'pgm');
end

