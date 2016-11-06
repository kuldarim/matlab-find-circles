clc; clear all; close all;
% https://se.mathworks.com/help/images/examples/detect-and-measure-circular-objects-in-an-image.html
% 2 var. Suskaic?iuoti visu? atvaizdo skrituliu? bendra? plota?. Skrituliu? plotus paz?yme?ti vaizde (failas "vat- lab02-4.png").

 RGB = imread('vat.png');
% rgb = imread('coins.png');
% rgb = imread('coloredChips.png');
bw = im2bw(RGB, 0.9);
figure; imshow(bw);

bw = bwareaopen(bw,30);

se = strel('disk',2);
bw = imclose(bw,se);

[B,L] = bwboundaries(bw,'noholes');

stats = regionprops(L,'Area','Centroid');
threshold = 0.82;

% Display the label matrix and draw each boundary
hold on

% loop over the boundaries
for k = 1:length(B)

  % obtain (X,Y) boundary coordinates corresponding to label 'k'
  boundary = B{k};

  % compute a simple estimate of the object's perimeter
  delta_sq = diff(boundary).^2;
  perimeter = sum(sqrt(sum(delta_sq,2)));

  % obtain the area calculation corresponding to label 'k'
  area = stats(k).Area;

  % compute the roundness metric
  metric = 4*pi*area/perimeter^2;

  % display the results
  metric_string = sprintf('%2.2f',metric);

  % mark objects above the threshold with a black circle
  if metric > threshold
    centroid = stats(k).Centroid;
    plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
    text(boundary(1,2)-35,boundary(1,1)+13,metric_string,'Color','y',...
       'FontSize',14,'FontWeight','bold');
  end
end

title(['Metrics closer to 1 indicate that ',...
       'the object is approximately round']);