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
         
%% Cargar archivo         
load('testsFinal.mat');

for i = 1:length(tests)
    tests(i).rho_real_cart = sqrt( tests(i).T_real(1,4)^2 + tests(i).T_real(2,4)^2 + tests(i).T_real(3,4)^2 );
end

%% Calculo de angulos intermedios (los realmente enviados)
for i = 1:length(tests)
    T = inv(robotTfulcro)*tests(i).T_tras_mci*inv(camTtcp)*rotZ(pi/2);
    % Calculo de parametros alcanzados
    alpha_interm    = rad2deg(atan2(-T(2,3),T(3,3)));
    beta_interm     = rad2deg(atan2(-T(1,2),T(1,1)));
    rho_interm      = sqrt( (T(2,4)/T(3,3))^2 + T(1,4)^2 );
    rho_cart_interm = sqrt( T(1,4)^2 + T(2,4)^2 + T(3,4)^2 );
    tests(i).alpha_interm    = alpha_interm;
    tests(i).beta_interm     = beta_interm;
    tests(i).rho_interm      = rho_interm;
    tests(i).rho_cart_interm = rho_cart_interm;
end

% Resultado de este test guardado en testsFinalFinalInterm.mat

%% Extraccion de datos

alpha = [];
beta = [];
rho = [];
alpha_real = [];
beta_real = [];
rho_real = [];
rho_real_cart = [];
% T_deseada = [];
% T_tras_mci = [];
% T_real = [];

% % Descomentar para analizar error entre consigna y parametros leidos por
% % encoder
% for i = 1:930
%     alpha = [alpha, tests(i).alpha];
%     alpha_real = [alpha_real, tests(i).alpha_real];
%     beta = [beta, tests(i).beta];
%     beta_real = [beta_real, tests(i).beta_real];
%     rho = [rho, tests(i).rho];
%     rho_real = [rho_real, tests(i).rho_real];
%     rho_real_cart = [rho_real_cart, tests(i).rho_real_cart];
% end

% Descomentar para analizar error entre consigna y parametros tras mci
for i = 1:930
    alpha = [alpha, tests(i).alpha];
    alpha_real = [alpha_real, tests(i).alpha_interm];
    beta = [beta, tests(i).beta];
    beta_real = [beta_real, tests(i).beta_interm];
    rho = [rho, tests(i).rho];
    rho_real = [rho_real, tests(i).rho_real];
    rho_real_cart = [rho_real_cart, tests(i).rho_cart_interm];
end


%%
e_alpha = alpha - alpha_real;
e_beta = beta - beta_real;
% e_rho = rho - rho_real;
e_rho = rho - rho_real_cart;


%%

e_alpha(66)=0;
e_beta(66)=0;

figure; plot(e_alpha); ylabel('Error en \alpha (º)'); grid on; xlabel('Muestras'); title('Análisis de error de ángulo de cámara \alpha');
figure; plot(e_beta); ylabel('Error en \beta (º)'); grid on; xlabel('Muestras'); title('Análisis de error de ángulo de cámara \beta');
figure; plot(e_rho); ylabel('Error en \rho (m)'); grid on; xlabel('Muestras'); title('Análisis de error de distancia de cámara \rho');


e_alpha_mean = mean(e_alpha)
e_beta_mean = mean(e_beta)
e_rho_mean = mean(e_rho)
e_alpha_stdv = std(e_alpha)
e_beta_stdv = std(e_beta)
e_rho_stdv = std(e_rho)

%% e_alpha y e_beta parecen tener correlacion con el valor de beta, se grafica

dict_alpha_e = dictionary([],[]);
dict_alpha_n = dictionary([],[]);
dict_beta_e = dictionary([],[]);
dict_beta_n = dictionary([],[]);
dict_rho_e = dictionary([],[]);
dict_rho_n = dictionary([],[]);

for i = 1:length(tests)
    beta_dict_ind = tests(i).beta;

    if isKey(dict_alpha_e,beta_dict_ind)
        dict_alpha_e(beta_dict_ind) = dict_alpha_e(beta_dict_ind) + tests(i).alpha - tests(i).alpha_real;
        dict_beta_e(beta_dict_ind) = dict_beta_e(beta_dict_ind) + tests(i).beta - tests(i).beta_real;
        dict_rho_e(beta_dict_ind) = dict_rho_e(beta_dict_ind) + tests(i).rho - tests(i).rho_real;
        dict_alpha_n(beta_dict_ind) = dict_alpha_n(beta_dict_ind) + 1;
        dict_beta_n(beta_dict_ind) = dict_beta_n(beta_dict_ind) + 1;
        dict_rho_n(beta_dict_ind) = dict_rho_n(beta_dict_ind) + 1;
    else
        dict_alpha_e(beta_dict_ind) = tests(i).alpha - tests(i).alpha_real;
        dict_beta_e(beta_dict_ind) = tests(i).beta - tests(i).beta_real;
        dict_rho_e(beta_dict_ind) = tests(i).rho - tests(i).rho_real;
        dict_alpha_n(beta_dict_ind) = 1;
        dict_beta_n(beta_dict_ind) = 1;
        dict_rho_n(beta_dict_ind) = 1;
    end

end

figure; xlabel('Consigna de \beta (º)'); ylabel('Error medio de \alpha (º)');title('Análisis de error de ángulo de cámara \alpha');
hold on; grid on;
for key = keys(dict_alpha_e)'
    dict_alpha_e(key) = dict_alpha_e(key) / dict_alpha_n(key);
    plot(key,dict_alpha_e(key),'*b',LineStyle='-')
end

figure; xlabel('Consigna de \beta (º)'); ylabel('Error medio de \beta (º)');title('Análisis de error de ángulo de cámara \beta');
hold on; grid on;
for key = keys(dict_beta_e)'
    dict_beta_e(key) = dict_beta_e(key) / dict_beta_n(key);
    plot(key,dict_beta_e(key),'*b',LineStyle='-')
end

figure; xlabel('Consigna de \beta (º)'); ylabel('Error medio de \rho (m)'); title('Análisis de error de distancia de cámara \rho');
hold on; grid on;
for key = keys(dict_rho_e)'
    dict_rho_e(key) = dict_rho_e(key) / dict_rho_n(key);
    plot(key,dict_rho_e(key),'*b',LineStyle='-')
end

%% Estudiamos también la correlación con alpha

dict_alpha_e = dictionary([],[]);
dict_alpha_n = dictionary([],[]);
dict_beta_e = dictionary([],[]);
dict_beta_n = dictionary([],[]);
dict_rho_e = dictionary([],[]);
dict_rho_n = dictionary([],[]);

for i = 1:length(tests)
    alpha_dict_ind = tests(i).alpha;

    if isKey(dict_alpha_e,alpha_dict_ind)
        dict_alpha_e(alpha_dict_ind) = dict_alpha_e(alpha_dict_ind) + tests(i).alpha - tests(i).alpha_real;
        dict_beta_e (alpha_dict_ind) = dict_beta_e (alpha_dict_ind) + tests(i).beta - tests(i).beta_real;
        dict_rho_e  (alpha_dict_ind) = dict_rho_e  (alpha_dict_ind) + tests(i).rho - tests(i).rho_real_cart;
        dict_alpha_n(alpha_dict_ind) = dict_alpha_n(alpha_dict_ind) + 1;
        dict_beta_n (alpha_dict_ind) = dict_beta_n (alpha_dict_ind) + 1;
        dict_rho_n  (alpha_dict_ind) = dict_rho_n  (alpha_dict_ind) + 1;
    else
        dict_alpha_e(alpha_dict_ind) = tests(i).alpha - tests(i).alpha_real;
        dict_beta_e (alpha_dict_ind) = tests(i).beta - tests(i).beta_real;
        dict_rho_e  (alpha_dict_ind) = tests(i).rho - tests(i).rho_real;
        dict_alpha_n(alpha_dict_ind) = 1;
        dict_beta_n (alpha_dict_ind) = 1;
        dict_rho_n  (alpha_dict_ind) = 1;
    end

end

figure; xlabel('Consigna de \alpha (º)'); ylabel('Error medio de \alpha (º)');title('Análisis de error de ángulo de cámara \alpha');
hold on; grid on;
for key = keys(dict_alpha_e)'
    dict_alpha_e(key) = dict_alpha_e(key) / dict_alpha_n(key);
    plot(key,dict_alpha_e(key),'*b',LineStyle='-')
end

figure; xlabel('Consigna de \alpha (º)'); ylabel('Error medio de \beta (º)');title('Análisis de error de ángulo de cámara \beta');
hold on; grid on;
for key = keys(dict_beta_e)'
    dict_beta_e(key) = dict_beta_e(key) / dict_beta_n(key);
    plot(key,dict_beta_e(key),'*b',LineStyle='-')
end

figure; xlabel('Consigna de \alpha (º)'); ylabel('Error medio de \rho (metros)'); title('Análisis de error de distancia de cámara \rho');
hold on; grid on;
for key = keys(dict_rho_e)'
    dict_rho_e(key) = dict_rho_e(key) / dict_rho_n(key);
    plot(key,dict_rho_e(key),'*b',LineStyle='-')
end

%% Estudio del error de rho, tomando como base el error medio de rho en función de alpha, pero cuanto lo desplaza beta
dict_rho_beta_alpha = dictionary([],[]);
dict_rho_beta_alpha_n = dictionary([],[]);

for i = 1:length(tests)
    beta_dict_ind = tests(i).beta;

    if isKey(dict_rho_beta_alpha,beta_dict_ind)
        dict_rho_beta_alpha  (beta_dict_ind) = dict_rho_beta_alpha(beta_dict_ind) + ( (tests(i).rho - tests(i).rho_real_cart) - dict_rho_e(tests(i).alpha) );
        dict_rho_beta_alpha_n(beta_dict_ind) = dict_rho_beta_alpha_n(beta_dict_ind) + 1;
    else
        dict_rho_beta_alpha  (beta_dict_ind) = (tests(i).rho - tests(i).rho_real_cart) - dict_rho_e(tests(i).alpha);
        dict_rho_beta_alpha_n(beta_dict_ind) = 1;
    end

end

figure; xlabel('Consigna de \beta (º)'); ylabel('Error medio de \rho respecto a la media de error según \alpha (m)'); title('Análisis de error de distancia de cámara \rho');
hold on; grid on;
for key = keys(dict_rho_beta_alpha)'
    dict_rho_beta_alpha(key) = dict_rho_beta_alpha(key) / dict_rho_beta_alpha_n(key);
    plot(key,dict_rho_beta_alpha(key),'*b',LineStyle='-')
end

