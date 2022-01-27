function RES = Square( input )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
stats = regionprops(input,'Perimeter','Area', 'centroid');
RES = 0 ;
circularities = [stats.Perimeter].^2 ./ (4 * pi * [stats.Area]);
%figure, imshow(input);
sz = size(circularities,2);
imsize = size(input);
%imshow(input);

for I = 1 : sz
    if circularities(I) >= 1.5 && circularities(I) <= 1.85 && CheckCenter(input)
        if stats(I).Centroid(1) > (imsize(1) / 2) - 2 && stats(I).Centroid(2) > (imsize(2) / 2) - 2
            RES = 1;
            %imshow(input);
        end
    end
end
end

