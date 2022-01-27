function [ Result ] = NormalizeBlack( input )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

sorted = sort((input(:)));
min = (sum(sorted(1:15)) + 100) / 15;
Result = input - min;
end

