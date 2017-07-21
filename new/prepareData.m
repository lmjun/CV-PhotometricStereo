function output = prepareData(imArray, ambientImage)
% PREPAREDATA prepares the images for photometric stereo
%   OUTPUT = PREPAREDATA(IMARRAY, AMBIENTIMAGE)
%
%   Input:
%       IMARRAY - [h w n] image array
%       AMBIENTIMAGE - [h w] image 
%
%   Output:
%       OUTPUT - [h w n] image, suitably processed
%
% Author: Subhransu Maji

% Step 1. Subtract Ambient Image
E = size(imArray);
N = E(3);
for i = 1 : N
    imArray(:,:,i) = imArray(:,:,i) - ambientImage;
end

% Step 2. Make sure no pixel is less than zero
mn = min(imArray(:));

if mn < 0
    imArray = bsxfun(@plus, A, abs(mn));
else
    imArray = bsxfun(@minus, A, abs(mn));
end
    
% Step 3. Rescale the values in imarray to be between 0 and 1
mx = max(imArray(:));
imArray = bsxfun(@rdivide, A, mx);
output = imArray;
