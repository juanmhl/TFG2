function a = tr2zyz(T,m)

    if nargin==1, m=1; end
    M = sign(m);

    Sbeta = M*sqrt(T(3,1)^2+T(3,2)^2);
    beta = atan2(Sbeta,T(3,3));
    if abs(Sbeta) > 1e-3,
        alfa = atan2(T(2,3)/Sbeta,T(1,3)/Sbeta);
        gamma = atan2(T(3,2)/Sbeta,-T(3,1)/Sbeta);
    else
        alfa = 0;
        gamma = atan2(T(3,2),sign(T(3,3))*T(1,1));
        warning('Configuración degenerada');
    end

    a = [alfa,beta,gamma];

end