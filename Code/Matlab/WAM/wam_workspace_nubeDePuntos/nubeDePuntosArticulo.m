%% el del artículo

% Inserting D-H convention parameters
a1 = 0; alpha1 = pi/2; d1 = 0.0345;
a2 = 0; alpha2 = -pi/2; d2 = 0;
a3 =-0.045; alpha3 = pi/2; d3 = 0.55;
a4 = 0.045; alpha4 = -pi/2; d4= 0;
a5 = 0; alpha5 = -pi/2; d5 = 0.30;
a6 = 0; alpha6 = pi/2; d6 = 0;
a7 = 0; alpha7 = 0; d7 =0.060;

% Inserting joint limits for Arms
t1_min = -2.6; t1_max = 2.6;
t2_min = -1.9; t2_max = 1.9;
t3_min = -2.8; t3_max = 2.8;
t4_min = -0.9; t4_max = 3.14;
t5_min = -4.8; t5_max = 1.3;
t6_min = -1.6; t6_max = 1.6;
t7_min = -2.2; t7_max = 2.2; 

% Monte Carlo method
% sampling size
N = 20000;
t1 = t1_min + (t1_max-t1_min)*rand(N,1);
t2 = t2_min + (t2_max-t2_min)*rand(N,1);
t3 = t3_min + (t3_max-t3_min)*rand(N,1);
t4 = t4_min + (t4_max-t4_min)*rand(N,1);
t5 = t5_min + (t5_max-t5_min)*rand(N,1);
t6 = t6_min + (t6_max-t6_min)*rand(N,1);
t7 = t7_min + (t7_max-t7_min)*rand(N,1);

for i = 1:N
    A1 = TransMat(a1,alpha1,d1,0);
    A2 = TransMat(a2,alpha2,d2,t2(i));
    A3 = TransMat(a3,alpha3,d3,1);
    A4 = TransMat(a4,alpha4,d4,t4(i));
    A5 = TransMat(a5,alpha5,d5,t5(i));
    A6 = TransMat(a6,alpha6,d6,t6(i));
    A7 = TransMat(a7,alpha7,d7,t7(i));
    T = A1*A2*A3*A4*A5;
    X=T(1,4);
    Y=T(2,4);
    Z=T(3,4);
    plot3(X,Y,Z,'.')
hold on;
end

%%
view(3);
title('Isometric view');
xlabel('x (m)');
ylabel('y (m)');
zlabel('z (m) ');
%%
view(2); % top view
title(' Top view');
xlabel('x (m)');
ylabel('y (m)');
%%
view([1 0 0]); % y-z plane
title('Side view, Y-Z');
ylabel('y (m)');
zlabel('z (m)');
%%

function [ T ] = TransMat( a,b,c,d )
T = [ cos(d) -sin(d)*cos(b) sin(d)*sin(b) a*cos(d);
      sin(d) cos(d)*cos(b) -cos(d)*sin(b) a*sin(d);
      0 sin(b) cos(b) c;
      0 0 0 1
    ];
end

