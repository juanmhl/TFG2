function T = MCD_WAM(th)

th1 = th(1);
th2 = th(2);
th3 = th(3);
th4 = th(4);
th5 = th(5);
th6 = th(6);
th7 = th(7);

% Parametros WAM
a1 = 0;
a2 = 0;
a3 = 0.045;
a4 = -0.045;
a5 = 0;
a6 = 0;
a7 = 0;

alpha1 = -pi/2;
alpha2 = pi/2;
alpha3 = -pi/2;
alpha4 = pi/2;
alpha5 = -pi/2;
alpha6 = pi/2;
alpha7 = 0;

d1 = 0;
d2 = 0;
d3 = 0.55;
d4 = 0;
d5 = 0.3;
d6 = 0;
d7 = 0.06;

toolOffset = 0.11;
ToolLength = d7 + toolOffset;

T = transform(a1,alpha1,d1,th1) * transform(a2,alpha2,d2,th2) * ...
    transform(a3,alpha3,d3,th3) * transform(a4,alpha4,d4,th4) * ...
    transform(a5,alpha5,d5,th5) * transform(a6,alpha6,d6,th6) * ...
    transform(a7,alpha7,ToolLength,th7);

end

% Para el MCD
function T =  transform(a,alpha,d,th)
    % Transformada con parametros DH1
    T = [cos(th) -sin(th)*cos(alpha) sin(th)*sin(alpha) a*cos(th);
         sin(th) cos(th)*cos(alpha) -cos(th)*sin(alpha) a*sin(th);
         0 sin(alpha) cos(alpha) d;
         0 0 0 1];
end