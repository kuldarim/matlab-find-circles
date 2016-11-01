function [ total ] = total_of_radius( radii )

total_area = 0;

for elm = radii
 area = circle_area(elm);
 fprintf('area = %f\n', area);
 total_area = total_area + area;
end

total = sum(total_area);

end

