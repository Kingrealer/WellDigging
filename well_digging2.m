file_name = 'old_wells.xlsx';
old_wells = xlsread(file_name);

d = 0.05;





max_count = 0;
max_ij = [0 0];
max_arc = 0;

range = 10;

old_wells = protate(old_wells, [0 0], pi);

% for i = 1:length(old_wells)
%     axis equal;
%     plot(old_wells(1, i), old_wells(2, i), 'ro');
%     hold on;
% end



for i=0:0.05:1
    for j=0:0.05:1
        for arc=0:0.02:2*pi
            count = 0;
            pset = protate(old_wells, [range/2 range/2], arc);
            for k = 1:length(pset)
                p = [pset(1, k) - i, pset(2, k) - j];
                if (pdistance(p, [ceil(p(1)), ceil(p(2))]) <= d) || (pdistance(p, [ceil(p(1)), floor(p(2))])  <= d) || (pdistance(p, [floor(p(1)), ceil(p(2))]) <= d) || (pdistance(p, [floor(p(1)), floor(p(2))]) <= d)
                    count = count + 1;
                    if count > max_count
                        max_count = count;
                        max_ij = [i; j];
                        max_arc = arc;
                    end
                end
            end
        end 
    end
end

trans_wells = old_wells;

trans_wells = protate(trans_wells, [range/2 range/2], max_arc);

for i = 1:length(trans_wells)
    trans_wells(1, i) = trans_wells(1, i) - max_ij(1);
    trans_wells(2, i) = trans_wells(2, i) - max_ij(2);
end


for i = 1:length(old_wells)
    plot(trans_wells(1, i), trans_wells(2, i), 'bo');
    hold on;
end

for i=-2:1:8
    for j=10:1:25
        plot(i, j, 'ro');
    end
end