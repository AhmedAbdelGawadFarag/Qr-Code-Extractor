function [ Result ] = Thresholding( input, sampleSize )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

%get average of min 15 pixels
sorted = sort((input(:)));
min = sum(sorted(1:15)) / 15;

%to gray scale
gray = rgb2gray(input);

%apply median filtering
filt = medfilt2(gray, [3 3]);

%normalize to get true black color (remove variable light effect)
filt = filt - min; % normilization 

%applying local thresholding
thre = AdaptiveThresholding(filt, sampleSize);

%convert result to binary image
Result = imbinarize(thre, 0.5);

end