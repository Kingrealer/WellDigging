% 坐标旋转
% ps: 点集， 2*n
% center: 旋转中心
% arc: 旋转弧度
function pset = protate(ps, center, arc)
pset = zeros(2, size(ps, 2));
for i=1:size(ps, 2)
    px = ps(1, i);
	py = ps(2, i);
	l = sqrt((px - center(1)).^2 + (py - center(2)).^2);
	alpha = asin((py - center(2)) / l);
	px1 = center(1) + l * cos(arc + alpha);
	py1 = center(2) + l * sin(arc + alpha);
	pset(1, i) = px1;
	pset(2, i) = py1;
%     pset
end