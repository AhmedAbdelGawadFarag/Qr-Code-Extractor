function [ XCoordinates, YCoordinates ] = DetectCorners( input, original )

%get connected components from binary image
connectedComponents = bwconncomp(input, 8);
%L = labelmatrix(connectedComponents);
%imshowpair(label2rgb(L), input, 'montage');

%applying numel function to all components to get count of each component
%pixels
numOfPixels = cellfun(@numel,connectedComponents.PixelIdxList);

%holding variables
cornerCount = 0;
XCoordinates = [];
YCoordinates = [];

inputSize = size(input);

cnt = 0;
%loop throu all components
for i = 1: connectedComponents.NumObjects
    %exclude very small components
    if numOfPixels(i)>50 %&&  numOfPixels(i)<300
        %convert from pixel location in component to location from the
        %original image
        
        [x,y] = ind2sub(inputSize, connectedComponents.PixelIdxList{i});
        xSorted = sort(x(:));
        W = xSorted(end) - xSorted(1);
        ySorted = sort(y(:));
        H = ySorted(end) - ySorted(1);
        temp = input(xSorted(1):xSorted(end), ySorted(1):ySorted(end));
        %imshow(temp);
        if abs(H-W) < 25
            RES = Square(temp);
            %imshow(temp);
            if RES == 1
                cnt = cnt + 1 ;
                XCoordinates = [XCoordinates; round((xSorted(end)+ xSorted(1))/2)];
                YCoordinates = [YCoordinates; round((ySorted(end)+ ySorted(1))/2)];
                %plot(round((ySorted(end)+ySorted(1))/2),round((xSorted(end)+xSorted(1))/2),'r-o')
            end
            
        end
        
    end
end
disp('corner Count'); disp(cnt);
end

