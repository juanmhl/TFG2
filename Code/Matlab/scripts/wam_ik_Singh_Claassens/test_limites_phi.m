T = [1 0 0 0.5;
     0 1 0 0;
     0 0 1 0.1;
     0 0 0 1];

phi = -pi/2;

[thRad, th] = mci_wam(T,phi,'O',0,0,0);

wamTree = importrobot("mirobot.urdf");
figure; show(wamTree,th);