function  Result  = CheckCenter( input )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[H W] = size(input);
input = ~input;

connectedComponents = bwconncomp(input);
numOfPixels = cellfun(@numel,connectedComponents.PixelIdxList);

Result = 0;
if (input(floor(H/2),floor(W/2))== 1)
    [biggest,idx] = max(numOfPixels);
    [x, y] = ind2sub(size(input), connectedComponents.PixelIdxList{idx});
    
    xSorted = sort(x(:));
    W = xSorted(end) - xSorted(1);
    
    ySorted = sort(y(:));
    H = ySorted(end) - ySorted(1);
       
    if abs(H-W) < 25 && biggest > 50 &&input(xSorted(1),ySorted(1)) == 0 && input(xSorted(end), ySorted(end)) == 0  
        Result = 1;
       
    else
        Result = 0;
    end
end

end

