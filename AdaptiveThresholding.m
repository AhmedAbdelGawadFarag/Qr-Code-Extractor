function [ Result ] = AdaptiveThresholding( input, sampleSize)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
[H W L] = size(input);

for i = 1:(H/sampleSize)
    for j = 1:(W/sampleSize)
        
        iIndex = i * sampleSize;
        jIndex=  j * sampleSize;
        
        zone = input(iIndex - sampleSize + 1 : iIndex, jIndex - sampleSize + 1: jIndex);
        %zone = input(1:30, 1:30)
        zone = sort(zone(:));
        
        regionSize = sampleSize * sampleSize;
        zoneMin = zone(1);
        
        
        range = (sum(zone(regionSize - 14: regionSize)) / 15) - (sum(zone(1:15)) / 15);
        % range = average max - average min
        
        threshold = zoneMin + range / 1.5;
        
        if range > 50   
            bool = input(iIndex - sampleSize + 1: iIndex, jIndex - sampleSize + 1 : jIndex) > threshold;
            input(iIndex - sampleSize + 1: iIndex, jIndex - sampleSize + 1 : jIndex) = bool * 255;
        end
    end
end
Result = input;
 %Result = im2bw(Result, 0.5);
end

