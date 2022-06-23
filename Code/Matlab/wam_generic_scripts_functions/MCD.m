%% Calc transform 0 to tip
syms th1 th2 th3 th4 th5 th6 th7 real
a = [0 0 0.045 -0.045 0 0 0 0];
th = [th1 th2 th3 th4 th5 th6 th7 0];
alpha = [-pi/2 pi/2 -pi/2 pi/2 -pi/2 pi/2 0 0];
d = [0 0 0.55 0 0.3 0 0.06 0];

for i = 1:8
    eval(['T',num2str(i-1),num2str(i),' = transf(a(i),th(i),alpha(i),d(i));']);
end

T = [1 0 0 0;
     0 1 0 0;
     0 0 1 0;
     0 0 0 1];

for j = 1:8
    eval(['T = T*T',num2str(j-1),num2str(j),';']);
end

T = simplify(T)
