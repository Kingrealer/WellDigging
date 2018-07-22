file_name = 'old_wells.xlsx';
old_wells = xlsread(file_name);

d = 0.05;

for i = 1:length(old_wells)
    plot(old_wells(1, i), old_wells(2, i), 'bo');
    hold on;
end

max_count = 0;
max_ij = [0 0];

range = 10;

for i=0:0.01:range
    for j=0:0.01:range
        count = 0;
        for k = 1:length(old_wells)
%             p0 = [old_wells(1, k), old_wells(2, k)]
            p = [old_wells(1, k) - i, old_wells(2, k) - j];
%             cp01 = ceil(p(1))
%             cp02 = ceil(p(2))
            if (ceil(p(1)) - p(1) <= d && ceil(p(2)) - p(2) <= d) || (ceil(p(1)) - p(1) <= d && p(2) - floor(p(2))  <= d) || (p(1) - floor(p(1)) <= d && ceil(p(2)) - p(2) <= d) || (p(1) - floor(p(1)) <= d && p(2) - floor(p(2)) <= d)
                count = count + 1;
            end
        end
        if count > max_count
            max_count = count;
            max_ij = [i j];
        end
    end
end

for i=0:1:range
    for j=0:1:range
        plot(max_ij(1) + i, max_ij(2) + j, 'ro');
    end
end