function pos = posicionWAM(th1, th2, th3, th4, th5, th6, th7)
% This function, given the articular positions for the WAM robot, returns
% the position of the tool tip in cartesian space
%   pos = posicionWAM(th1 th2 th3 th4 th5 th6 th7)
% Forward kinematics from MCD.m

% NO SE BIEN SI FUNCIONA

pos = [(pi*(5300678235884640897300936261632*sin(th3) - 5300678235884640897300936261632*sin(th3 + th4) + 2554957116271851592749310373775*sin(th5) + 5063931335854543533571426890689*cos(th3 + th4)*sin(th5) + 5300678235884640897300936261632*sin(th3 + th4)*cos(th5)))/20282409603651670423947251286016;
cos(th1 + th2)/3602879701896396800 + (pi*(sin(th5)*((4302453056439517*cos(th4)*(sin(th1 + th2)*sin(th3) - (479928639983925*cos(th1 + th2)*cos(th3))/562949953421312))/4503599627370496 + (4302453056439517*sin(th4)*((479928639983925*cos(th1 + th2)*sin(th3))/562949953421312 + sin(th1 + th2)*cos(th3)))/4503599627370496) - cos(th5)*((83021313437387*sin(th1 + th2 - th3 - th4))/1125899906842624 + (1042878593405237*sin(th1 + th2 + th3 + th4))/1125899906842624) + (6265830110855575236766478924431*cos(th1 + th2)*sin(th5))/40564819207303340847894502572032))/2 - (pi*((479928639983925*cos(th1 + th2)*sin(th3))/562949953421312 + sin(th1 + th2)*cos(th3)))/2 + (pi*sin(th1 + th2))/2 - (pi*sin(th1))/2 + (pi*(83021313437387*sin(th1 + th2 - th3 - th4) + 1042878593405237*sin(th1 + th2 + th3 + th4)))/2251799813685248;
sin(th1 + th2)/3602879701896396800 - pi/2 - (pi*((479928639983925*sin(th1 + th2)*sin(th3))/562949953421312 - cos(th1 + th2)*cos(th3)))/2 + (pi*(cos(th4)*((479928639983925*sin(th1 + th2)*sin(th3))/562949953421312 - cos(th1 + th2)*cos(th3)) + sin(th4)*(cos(th1 + th2)*sin(th3) + (479928639983925*sin(th1 + th2)*cos(th3))/562949953421312)))/2 - (pi*cos(th1 + th2))/2 + (pi*cos(th1))/2 - (pi*(sin(th5)*((4302453056439517*cos(th4)*(cos(th1 + th2)*sin(th3) + (479928639983925*sin(th1 + th2)*cos(th3))/562949953421312))/4503599627370496 - (4302453056439517*sin(th4)*((479928639983925*sin(th1 + th2)*sin(th3))/562949953421312 - cos(th1 + th2)*cos(th3)))/4503599627370496) - (6265830110855575236766478924431*sin(th1 + th2)*sin(th5))/40564819207303340847894502572032 + cos(th5)*(cos(th4)*((479928639983925*sin(th1 + th2)*sin(th3))/562949953421312 - cos(th1 + th2)*cos(th3)) + sin(th4)*(cos(th1 + th2)*sin(th3) + (479928639983925*sin(th1 + th2)*cos(th3))/562949953421312))))/2];

end