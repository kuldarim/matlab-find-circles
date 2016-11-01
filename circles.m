clc; clear all; close all;

image = imread('coins.png');
imshow(image);

[total, centers, radii] = total_of_radius(image, 10, 100);

viscircles(centers, radii, 'Color', 'b');