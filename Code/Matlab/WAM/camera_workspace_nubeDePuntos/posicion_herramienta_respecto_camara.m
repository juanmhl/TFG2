% addpath('funciones_matlab');

Ti = desp([0.07 -0.15 0])*rotZ(pi/3)*rotY(-pi/6)*desp([0.175 0 0]) % para el de la izda
Td = desp([-0.07 -0.15 0])*rotZ(-pi/3)*rotY(pi/6)*rotZ(pi)*desp([0.175 0 0]) % para el de la drch