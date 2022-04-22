%% Definición de posiciones articulares máximas y mínimas
th1Min = -2.6;      th1Max = 2.6;
th2Min = -2.0;      th2Max = 2.0;
th3Min = -2.8;      th3Max = 2.8;
th4Min = -0.9;      th4Max = 3.1;
th5Min = -4.8;      th5Max = 1.3;
th6Min = -1.6;      th6Max = 1.6;
th7Min = -2.2;      th7Max = 2.2;

%% Cálculo de la nube de puntos mediante el método de Monte Carlo
N = 20000;
th1 = th1Min + (th1Max-th1Min)*rand(N,1);
th2 = th2Min + (th2Max-th2Min)*rand(N,1);
th3 = th3Min + (th3Max-th3Min)*rand(N,1);
th4 = th4Min + (th4Max-th4Min)*rand(N,1);
th5 = th5Min + (th5Max-th5Min)*rand(N,1);
th6 = th6Min + (th6Max-th6Min)*rand(N,1);
th7 = th7Min + (th7Max-th7Min)*rand(N,1);

for i = 1:N
    punto = posicionWAM(0,th2(i),th3(i),th4(i),th5(i),th6(i),th7(i));
    X = punto(1);
    Y = punto(2);
    Z = punto(3);
    plot3(X,Y,Z,'.');
    hold on;
end