%% pruebas solver numerico

wamTree = importrobot("mirobot.urdf");
ik = inverseKinematics('RigidBodyTree',wamTree);
weights = [0.25 0.25 0.25 1 1 1];
th(1).JointName = 'wam/base_yaw_joint';
th(2).JointName = 'wam/shoulder_pitch_joint';
th(3).JointName = 'wam/shoulder_yaw_joint';
th(4).JointName = 'wam/elbow_pitch_joint';
th(5).JointName = 'wam/wrist_yaw_joint';
th(6).JointName = 'wam/wrist_pitch_joint';
th(7).JointName = 'wam/palm_yaw_joint';

th(1).JointPosition = 0;
th(2).JointPosition = 0;
th(3).JointPosition = 0;
th(4).JointPosition = 0;
th(5).JointPosition = 0;
th(6).JointPosition = 0;
th(7).JointPosition = 0;
%%
th(1).JointName = 'wam/base_yaw_joint';
th(2).JointName = 'wam/shoulder_pitch_joint';
th(3).JointName = 'wam/shoulder_yaw_joint';
th(4).JointName = 'wam/elbow_pitch_joint';
th(5).JointName = 'wam/wrist_yaw_joint';
th(6).JointName = 'wam/wrist_pitch_joint';
th(7).JointName = 'wam/palm_yaw_joint';
th(1).JointPosition = 0;
th(2).JointPosition = 0;
th(3).JointPosition = 0;
th(4).JointPosition = 0;
th(5).JointPosition = 0;
th(6).JointPosition = 0;
th(7).JointPosition = 0;
transform = getTransform(wamTree,th,'wam/shoulder_yaw_link');
altura = transform(3,4);
%%
camTtcp = [ -1 0  0 0;
             0 1  0 0;
             0 0 -1 0;
             0 0  0 1
          ];

robotTfulcro = [ -1  0 0  0.583;
                0 -1 0  0;
                0  0 1 -0.118;
                0  0 0  1
             ];
robotTobjetivo = robotTfulcro*PoseCamaraSimulador(0.2,0,20)*camTtcp
[thRad, error_estudiado_ahora, phiOut, semilla, A, UJ, LJ] = mci_wam_antiguo(robotTobjetivo,'O',0.11,0,0,0);
figure; show(wamTree,semilla); title('sin corregir');
robotTobjetivo_tras_mci = MCD_WAM(thRad);
[configSoln,solnInfo] = ik('wam/wrist_palm_stump_link',desp([0 0 altura])*robotTobjetivo*desp([0 0 -0.11]),weights,semilla);
figure; show(wamTree,configSoln); title('corregido');
transformThen = desp([0 0 -altura])*getTransform(wamTree,configSoln,'wam/wrist_palm_stump_link')*desp([0 0 0.11])

for i = 1:7
    thRad_tras_numIK(i) = configSoln(i).JointPosition;
end

robotTobjetivo_tras_numIK =  MCD_WAM(thRad_tras_numIK);

error_tras_mci = norm(robotTobjetivo(1:3,4)-robotTobjetivo_tras_mci(1:3,4))
error_tras_solver = norm(robotTobjetivo(1:3,4)-robotTobjetivo_tras_numIK(1:3,4))

