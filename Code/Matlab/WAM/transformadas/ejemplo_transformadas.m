% Ejemplo de coordenas homogeneas

view(45,45);
xlim([0,5]); ylim([0,5]); zlim([0,5]);
grid


TA=[1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1];
FA=createFRAME(TA,'b','A',2);

TB=[1,0,0,2;0,1,0,2;0,0,1,2;0,0,0,1];
FB=createFRAME(TB,'r','B');