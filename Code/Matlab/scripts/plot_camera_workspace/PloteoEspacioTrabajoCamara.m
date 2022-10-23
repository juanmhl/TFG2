%% Calculo de poses limite camara

limiteHorizontal = 30;
limiteVerticalBajo = 15;
limiteVerticalAlto = 80;
limiteLargoBajo = 0.14;
limiteLargoAlto = 0.22;

figure;

for largo = limiteLargoBajo:0.02:limiteLargoAlto
    for alpha = limiteVerticalBajo:10:limiteVerticalAlto
        for beta = -limiteHorizontal:10:limiteHorizontal
            % calcula posicion de {cam} respecto {fulcro}
            punto = PosCamaraSimulador(largo,beta,alpha);
            plot3(punto(1),punto(2),punto(3),'k.');
            hold on
        end
    end
end

xlabel('x [m]')
ylabel('y [m]')
zlabel('z [m]')

plot3(0,0,0,'k*'); % punto de fulcro

grid on

function pos = PosCamaraSimulador(rho,beta,alpha)
%Input en metros y en grados

T = eye(4);

% Rotacion ejes fijos en X de alpha grados
T = rotX(alpha*pi/180)*T;
% Rotacion eje movil Z de beta grados
T = T*rotZ(beta*pi/180);
% Desplazamiento ejes moviles de rhocm en y
T = T*desp([0 rho 0]);

pos = T(1:3,4);

end
