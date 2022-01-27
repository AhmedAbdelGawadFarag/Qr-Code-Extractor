function [ center, first, second, lines, orderedCorners ] = grouping( xCoordinates, yCoordinates, image )
%UNTITLED6 Summary of measureis function goes here
%   Detailed explanation goes here

%figure('name', 'grouped edges'), imshow(image);
%hold on;
draw = 0;
point1 = [xCoordinates(1); yCoordinates(1)];
point2 = [xCoordinates(2); yCoordinates(2)];
point3 = [xCoordinates(3); yCoordinates(3)];

line1 = sqrt(((point2(1)-point1(1))^2+(point2(2)-point1(2))^2));
line2 = sqrt(((point2(1)-point3(1))^2+(point2(2)-point3(2))^2));
line3 = sqrt(((point1(1)-point3(1))^2+(point1(2)-point3(2))^2));

lines = sort([line1; line2; line3]);
measure = lines(2) - lines(1) + 10;

if abs(line1-line2)<measure
    if draw == 1
        plot(point2(1),point2(2),'r-o')
    end
    center = point2;
    first = point1;
    second = point3;
elseif abs(line1-line3)<measure
    if draw == 1
        plot(point1(1),point1(2),'r-o')
    end
    center = point1;
    first = point2;
    second = point3;
else
    if draw == 1
        plot(point3(1),point3(2),'r-o')
    end
    center = point3;
    first = point1;
    second = point2;
end

minx=min(xCoordinates);
maxx=max(xCoordinates);
miny=min(yCoordinates);
maxy=max(yCoordinates);


if abs(center(1)-minx)<10
    
    if first(2)>= center(2)
        orderedCorners=[center , second, first ;ones(1,3)];
    else
        orderedCorners=[center , first, second ;ones(1,3)];
    end
    
elseif abs(center(1)-maxx)<10
    if first(2)<= center(2)
        orderedCorners=[center  , second , first ;ones(1,3)];
    else
        orderedCorners=[center , first , second ;ones(1,3)];
    end
    
elseif abs(center(2)-miny)<10
    if first(1)<= center(1)
        
        orderedCorners=[center , second , first ;ones(1,3)];
    else
        orderedCorners=[center , first , second ;ones(1,3)];
    end
    
elseif abs(center(2)-maxy)<10
    if first(1)>= center(1)
        orderedCorners=[center, second , first ;ones(1,3)];
    else
        
        orderedCorners=[center  , first ,  second ;ones(1,3)];
        
    end
    
end
end

