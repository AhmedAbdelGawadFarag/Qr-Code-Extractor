function [midPoint , isWhiteBorder] = whiteBorder( comp )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%imshow(comp);
%comp = ~comp;
%imshow(comp);

connectedComponents = bwconncomp(comp);
%labels = labelmatrix(connectedComponents);
%imshow(label2rgb(labels));

[x, y] = ind2sub(size(comp), connectedComponents.PixelIdxList{1});
numOfPixels = cellfun(@numel,connectedComponents.PixelIdxList);
[biggest,idx] = max(numOfPixels);

if biggest < 50
    isWhiteBorder = 0;
else
    xSorted = sort(x(:));
    W = xSorted(end) - xSorted(1);
    
    ySorted = sort(y(:));
    H = ySorted(end) - ySorted(1);
    midPoint = H /2;
    
    if abs(H-W) < 5
        isWhiteBorder = 1;
    else
        isWhiteBorder = 0;
    end
end

end

