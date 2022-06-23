function [rout, hayInterseccion] = calc_interseccion(r1, r2)

min1enr2 = (r1(1) > r2(1)) && (r1(1) < r2(2));
max1enr2 = (r1(2) > r2(1)) && (r1(2) < r2(2));
min2enr1 = (r2(1) > r1(1)) && (r2(1) < r1(2));
max2enr1 = (r2(2) > r1(1)) && (r2(2) < r1(2));

hayInterseccion =  (min1enr2 || min2enr1 || max1enr2 || max2enr1);

if ~hayInterseccion
    rout = [0, 0];
elseif hayInterseccion
    rout = [max([r1(1),r2(1)]), min([r1(2),r2(2)])];
end

end