%% Calculo de aristas para el poliedro
addpath('funciones_matlab')

% limiteHorizontal = 40;
% limiteVerticalBajo = 10;
% limiteVerticalAlto = 100;
% limiteLargoBajo = 0.15;
% limiteLargoAlto = 0.30;

limiteHorizontal = 30;
limiteVerticalBajo = 15;
limiteVerticalAlto = 80;
limiteLargoBajo = 0.14;
limiteLargoAlto = 0.22;

figure;

for largo = limiteLargoBajo:0.02:limiteLargoAlto
    for alpha = limiteVerticalBajo:10:limiteVerticalAlto
        for beta = -limiteHorizontal:10:limiteHorizontal
            punto = PosCamaraSimulador(largo,beta,alpha);
            plot3(punto(1),punto(2),punto(3),'k.');
            hold on
        end
    end
end

xlabel('x')
ylabel('y')
zlabel('z')

% Dibujo de poligonos
% figure;
% patch('XData',[p1(1), p2(1), p3(1), p4(1)],'YData',[p1(2), p2(2), p3(2), p4(2)],'ZData',[p1(3), p2(3), p3(3), p4(3)]);
% hold on
% patch('XData',[p5(1), p6(1), p7(1), p8(1)],'YData',[p5(2), p6(2), p7(2), p8(2)],'ZData',[p5(3), p6(3), p7(3), p8(3)]);
% patch('XData',[p1(1), p4(1), p8(1), p5(1)],'YData',[p1(2), p4(2), p8(2), p5(2)],'ZData',[p1(3), p4(3), p8(3), p5(3)]);
% patch('XData',[p1(1), p2(1), p6(1), p5(1)],'YData',[p1(2), p2(2), p6(2), p5(2)],'ZData',[p1(3), p2(3), p6(3), p5(3)]);
% patch('XData',[p6(1), p2(1), p3(1), p7(1)],'YData',[p6(2), p2(2), p3(2), p7(2)],'ZData',[p6(3), p2(3), p3(3), p7(3)]);
% patch('XData',[p8(1), p7(1), p3(1), p4(1)],'YData',[p8(2), p7(2), p3(2), p4(2)],'ZData',[p8(3), p7(3), p3(3), p4(3)]);

