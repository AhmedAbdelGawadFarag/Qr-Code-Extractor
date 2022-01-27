function  check  = checkLenghts( xCoordinates, yCoordinates )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
point1 = [xCoordinates(1); yCoordinates(1)];
point2 = [xCoordinates(2); yCoordinates(2)];
point3 = [xCoordinates(3); yCoordinates(3)];

line1 = sqrt(((point2(1)-point1(1))^2+(point2(2)-point1(2))^2));
line2 = sqrt(((point2(1)-point3(1))^2+(point2(2)-point3(2))^2));
line3 = sqrt(((point1(1)-point3(1))^2+(point1(2)-point3(2))^2));

sorted = sort([line1, line2, line3]);
if sorted(2) - sorted(1) < 5
    check = 1;
else
    check = 0;
end
end

