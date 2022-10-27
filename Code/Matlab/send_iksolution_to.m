function thRad = send_iksolution_to(T)

    global jointclient;
    global jointmsg;
%     global wamTree;

    [thRad] = mci_wam(T,'O',0.11,0,0,0,0.4);

%     figure; show(wamTree,th);

    jointmsg.Joints = thRad;

    call(jointclient,jointmsg);

end