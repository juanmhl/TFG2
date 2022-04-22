function TT = inversaT(T)
RT = T(1:3,1:3);
PT = T(1:3,4);
TT = [RT', -RT'*PT; 0 0 0 1];
end