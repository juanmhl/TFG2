syms r11 r12 r13 r21 r22 r23 r31 r32 r33 real
syms phi real
syms RLJ dLJ real
syms DWpos1 DWpos2 DWpos3 real
syms d5 real
syms TRz1 TRz2 TRz3 real
%%

Rnorm = [r11 r12 r13; r21 r22 r23; r31 r32 r33];
DWpos = [DWpos1 DWpos2 DWpos3]';
TRz = [TRz1 TRz2 TRz3]';

%%

UJ = Cnorm(RLJ,dLJ,phi)' * Rnorm;

UJVWP = (UJ' - DWpos) / d5;

simplify(dot(UJVWP,TRz))


%%
function p = Cnorm(R,D,phi)

    p = [R*cos(phi) R*sin(phi) D]';

end

function T =  transform(a,alpha,d,th)

    T = [cos(th) -sin(th)*cos(alpha) sin(th)*sin(alpha) a*cos(th);
         sin(th) cos(th)*cos(alpha) -cos(th)*sin(alpha) a*sin(th);
         0 sin(alpha) cos(alpha) d;
         0 0 0 1];

end