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

