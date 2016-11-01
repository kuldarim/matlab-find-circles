clc; clear all; close all;
% https://se.mathworks.com/help/images/examples/detect-and-measure-circular-objects-in-an-image.html
% 2 var. Suskaic?iuoti visu? atvaizdo skrituliu? bendra? plota?. Skrituliu? plotus paz?yme?ti vaizde (failas "vat- lab02-4.png").

rgb = imread('vat.png');
% rgb = imread('coins.png');
% rgb = imread('coloredChips.png');
figure
imshow(rgb)

[centers1, radii1] = imfindcircles(rgb,[30 40], 'Sensitivity', 0.92,'EdgeThreshold', 0.3);

[centers2, radii2] = imfindcircles(rgb,[15 100], 'Sensitivity', 0.90,'EdgeThreshold', 0.2);

[centers3, radii3] = imfindcircles(rgb,[15 100], 'ObjectPolarity', 'dark', 'Sensitivity', 0.91,'EdgeThreshold', 0.2);

%[centers, radii] = imfindcircles(rgb,[100 120],'ObjectPolarity', 'dark', 'Sensitivity', 0.96,'EdgeThreshold', 0.1);

viscircles(centers1, radii1,'Color','b');
viscircles(centers2, radii2,'Color','b');
viscircles(centers3, radii3,'Color','b');

total1 = total_of_radius(radii1);
total2 = total_of_radius(radii2);
total3 = total_of_radius(radii3);

sum = total1 + total2 + total3;

fprintf('sum = %f\n', sum);