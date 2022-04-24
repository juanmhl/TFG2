% Apertura ROS Master
rosinit

% Creacion del nodo
node = ros.Node('/WAMremote');

% Creación de clientes de servicios
homeclient = rossvcclient("/wam/go_home");
global jointclient = rossvcclient("/wam/joint_move");

% Creación de mensajes para los servicios
homemsg = rosmessage(homeclient);
global jointmsg = rosmessage(jointclient);

jointmsg.Joints = [-0.8 0.9 0 0.3 0 0.1 0];

% LLamada a servicios
call(homeclient,homemsg);
call(jointclient,jointmsg);

T = [1 0 0 0;
     0 1 0 0;
     0 0 1 0.6;
     0 0 0 1];

phi = 0;

r = rosrate(200);

reset(r);

while (r.TotalElapsedTime < 10)
    send_iksolution_to(T,phi);
end

rosshutdown;

function send_iksolution_to(T,phi)

    global jointclient;
    global jointmsg;

    thRad = mci_wam(T,phi,'O',0.15,0,0);

    jointmsg.Joints = thRad;

    call(jointclient,jointmsg);

end