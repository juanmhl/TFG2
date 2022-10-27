% instalar add-on MATLAB Support Package for USB Webcams
% instalar add-on Image Acquisition Toolbox Support Package for OS Generic Video Interface
% instalar OBS y crear una escena con la imagen de la webcam o la
% capturadora
% iniciar camara virtual obs
% acceder a camara virtual obs mediante cam = videoinput('winvideo',1)
% Esta última instrucción depende de la plataforma: crear selector o crear
% independencia de la plataforma

clear all

VisualizarVideo('CAEHdemo.mp4')

% % adap = imaqhwinfo('winvideo');
% % 
% % cam = videoinput('winvideo',2); % manejador de la camara
% % preview(cam);                   % abre figura con video entrante de cam
% 
% % Captura de imagen cuando se pulse una tecla
% figure;
% while true
%     waitforbuttonpress; 
%     im = getsnapshot(cam);
% end
% 
% 
% % closepreview(cam);


function VisualizarVideo(fichero)
% Muestra sobre una figura el video contenido en fichero especificado con
% entrada. Se muestra frame a frame hasta completar el fichero o se emplee
% la rueda del ratón sobre la figura. Se puede pausar el video haciendo
% clic sobre la figure, reanudándose al pulsar una tecla.

% Define las condiciones de finalización y pausa del programa, se invoca 
% a la función 'Terminar' o 'Pausar' por medio del ratón
    global fin
    fin = 0;
    f = figure;
    f.ButtonDownFcn = @Pausar;
    f.WindowScrollWheelFcn = @Terminar;
    %--------------------------------------------------------------
    v = VideoReader(fichero);   % Abre el fichero y se posiciona sobre el 
                                % primer frame, el objeto video se define
                                % sobre la variable 'v'

    % Se ejecuta hasta que se complete en video o se cancele la ejecución. 
    while (not(fin) && hasFrame(v)) 
        im = readFrame(v); %Lee el siguiente frame del fichero.
        getToolTips(im);
%         imshow (im);
         drawnow;
    end
end

function Pausar(~,~) %Se invoca al hacer clic
    pause
end

function Terminar(~,~) %Se invoca al mover la rueda del ratón
    global fin
    fin = 1;
end