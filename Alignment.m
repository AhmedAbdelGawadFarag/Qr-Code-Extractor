function outputImage = Alignment( input, orderedCorners, newPostions, v )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
TransformationMatrix = newPostions * inv(orderedCorners);

[Width,Height,Depth]=size(input);
v = 17 ;
newCorners = newPostions';

maxx = max(newCorners(:,1))+v;
minx = min(newCorners(:,1))-v;

maxy = max(newCorners(:,2))+v;
miny = min(newCorners(:,2))-v;

newW = round(maxx-minx);
newH = round(maxy-miny);

outputImage = uint8(ones(newH, newW, Depth));


temp=[1 0 (minx-1) ;0 1 (miny -1);0 0 1];
mat=inv(TransformationMatrix)*temp;

for i=1:newH
    for j=1:newW
        %i , j , newH, newW
        newpoint=floor(round(mat*[i;j;1]));
       % newpoint
       % if  newpoint(2)<=Height && newpoint(2)>=1 && newpoint(1)<=Width && newpoint(1)>=1
        outputImage(i,j,:) = input(newpoint(1),newpoint(2),:);
    end
    end
end


