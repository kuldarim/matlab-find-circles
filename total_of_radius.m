function [ total, centers, radii ] = total_of_radius( image, Rmin, Rmax )


[centers, radii] = imfindcircles(image,[Rmin Rmax], 'Method', 'TwoStage');

total_area = 0;

for elm = radii
 area = circle_area(elm);
 fprintf('area = %f\n', area);
 total_area = total_area + area;
end

total = sum(total_area);

fprintf('total = %f\n', total);

end

