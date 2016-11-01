clc; clear all; close all;
%% https://se.mathworks.com/help/images/ref/imfindcircles.html

%% image = imread('vat.png');
 image = imread('coins.png');
imshow(image);

%%[total, centers, radii] = total_of_radius(image, 10, 100);

[total, centers, radii] = total_of_radius(image, 10, 100);

viscircles(centers, radii, 'Color', 'b');