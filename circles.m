clc; clear all; close all;

A = imread('vat.png');
imshow(A);

Rmin = 10;
Rmax = 100;

[centers, radii, metric] = imfindcircles(A,[Rmin Rmax]);

total_area = 0;

for elm = radii
 area = circle_area(elm);
 fprintf('area = %f\n', area);
 total_area = total_area + area;
end

total = sum(total_area);

fprintf('total = %f\n', total); 

viscircles(centers, radii, 'Color', 'b');