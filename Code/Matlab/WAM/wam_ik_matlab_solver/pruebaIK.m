wamTree = importrobot("barrett_model\robots\mirobot.urdf");
showdetails(wamTree);
%%
randConfig = wamTree.randomConfiguration;
otherConfig = wamTree.randomConfiguration;

tform = getTransform(wamTree,randConfig,'wam/wrist_palm_stump_link','wam/base_link');

th = wam_ik(tform,pi/2,'out');

for i = 1:6
    otherConfig(i).JointPosition = th(i);
end

show(wamTree,randConfig);
figure;
show(wamTree.otherConfig);

%%
ik = inverseKinematics('RigidBodyTree',wamTree);
ik.SolverAlgorithm = 'LevenbergMarquardt';
ik.SolverParameters.MaxIterations = 1e6;
ik.SolverParameters.MaxTime = 60*1;
ik.SolverParameters.AllowRandomRestart = 1;
% ik.SolverParameters.SolutionTolerance.
weights = [0.25 0.25 0.25 1 1 1];
initialguess = wamTree.homeConfiguration;
%%
%[configSoln,solnInfo] = ik('wam/wrist_palm_stump_link',tform,weights,initialguess)
[configSoln,solnInfo] = ik('wam/wrist_palm_stump_link',tform,weights,randConfig)
%%
figure;
show(wamTree,configSoln);