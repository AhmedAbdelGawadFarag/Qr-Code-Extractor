clc, clear
input = imread('./TestCases/Case1/1.1.bmp');

thre = Thresholding(input, 30);

[xCoordinates, yCoordinates] = DetectCorners(thre, input);
while floor(size(xCoordinates, 1) / 3) >= 1
    x1 = xCoordinates(1);
    x2 = xCoordinates(2);
    y1 = yCoordinates(1);
    y2 = yCoordinates(2);
    
    for i = 3:size(xCoordinates, 1)
        x3 = xCoordinates(i);
        y3 = yCoordinates(i);
        check = checkLenghts([x1, x2, x3], [y1, y2, y3]);
        if check == 1
            [center, first, second, lines, orderedCorners] = grouping([x1, x2, x3], [y1, y2, y3], input);
            newPostions = [0 lines(1) 0;0 0 lines(2) ;ones(1,3)];
            outputImage = Alignment(input, orderedCorners, newPostions, 0);
            figure, imshow(outputImage);
            xCoordinates(i) = [];
            yCoordinates(i) = [];
            xCoordinates(2) = [];
            yCoordinates(2) = [];
            xCoordinates(1) = [];
            yCoordinates(1) = [];
            break
        end
    end
end
%[center, first, second, lines, orderedCorners, check] = grouping(xCoordinates, yCoordinates, input);
%disp('center: ');disp(center);
%disp('first: ');disp(first);
%disp('second: ');disp(second);
%disp('lines: '); disp(lines);
%disp('orderedCorners'); disp(orderedCorners);


