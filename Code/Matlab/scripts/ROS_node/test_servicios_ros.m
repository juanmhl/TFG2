% PRIMERO INICIAR ROS CON ROSCORE EN TERMINAL !!
% Habiendo conectado el nodo en el pc de control del wam, ya se tienen los
% servicios habilitados

% Importante para generar mensajes, configurar bien python, con:
% https://es.mathworks.com/matlabcentral/answers/1690800-error-in-building-custom-ros-messages?s_tid=ans_lp_feed_leaf

rosinit

% Creación de clientes de servicios
homeclient = rossvcclient("/wam/go_home");
jointclient = rossvcclient("/wam/joint_move");

% Creación de mensajes para los servicios
homemsg = rosmessage(homeclient);
jointmsg = rosmessage(jointclient);

jointmsg.Joints = [-0.8 0.9 0 0.3 0 0.1 0];

% LLamada a servicios
call(homeclient,homemsg);
call(jointclient,jointmsg);

rosshutdown;