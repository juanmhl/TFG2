load("commandNet.mat")
labels = trainedNet.Layers(end).Classes';

moveRobotCommand( ...
    SampleRate = 16e3, ...
    Network = trainedNet, ...
    ClassificationRate = 20, ...
    DecisionTimeWindow = 1.5, ...
    FrameAgreementThreshold = 50, ...
    ProbabilityThreshold = 0.7, ...
    TimeLimit = 300 ...
)

function features = extractAuditorySpectrogram(x,fs)
%extractAuditorySpectrogram Compute auditory spectrogram
%
% features = extractAuditorySpectrogram(x,fs) computes an auditory (Bark)
% spectrogram in the same way as done in the Train Speech Command
% Recognition Model Using Deep Learning example. Specify the audio input,
% x, as a mono audio signal with a 1 second duration.

% Design audioFeatureExtractor object
persistent afe segmentSamples
if isempty(afe)
    designFs = 16e3;
    segmentDuration = 1;
    frameDuration = 0.025;
    hopDuration = 0.01;

    numBands = 50;
    FFTLength = 512;

    segmentSamples = round(segmentDuration*designFs);
    frameSamples = round(frameDuration*designFs);
    hopSamples = round(hopDuration*designFs);
    overlapSamples = frameSamples - hopSamples;

    afe = audioFeatureExtractor( ...
        SampleRate=designFs, ...
        FFTLength=FFTLength, ...
        Window=hann(frameSamples,"periodic"), ...
        OverlapLength=overlapSamples, ...
        barkSpectrum=true);
    setExtractorParams(afe,"barkSpectrum",NumBands=numBands,WindowNormalization=false);
end

% Resample to 16 kHz if necessary
if double(fs)~=16e3
    x = cast(resample(double(x),16e3,double(fs)),like=x);
end

% Ensure the input is equal to 1 second of data at 16 kHz.
x = trimOrPad(x,segmentSamples);

% Extract features
features = extract(afe,x);

% Apply logarithm
features = log10(features + 1e-6);

end

function visualizeClassificationPipeline(audioData,trainedNet)
%visualizeClassificationPipeline Visualize classification pipeline
%
% visualizeClassificationPipeline(audioData,trainedNet) creates a tiled
% layout of the audio data, the extracted auditory spectrogram, and a word
% cloud indicating the relative prediction probability of each class.

% Unpack audio data
audio = audioData{1};
fs = audioData{2};
label = audioData{3};

% Create tiled layout
tiledlayout(3,1)

% Plot audio signal in first tile
nexttile
plotAudio(audio,fs)
title("Known Class = "+label)

% Plot auditory spectrogram in second tile
nexttile
auditorySpectrogram = extractAuditorySpectrogram(audio,fs);
plotAuditorySpectrogram(auditorySpectrogram)

% Plot network predictions as word cloud in third tile
nexttile
[prediction,scores] = classify(trainedNet,auditorySpectrogram);
wordcloud(trainedNet.Layers(end).Classes,scores)
title("Predicted Class = "+string(prediction))

    function plotAuditorySpectrogram(auditorySpectrogram)
        %plotAuditorySpectrogram Plot auditory spectrogram

        % extratAuditorySpectrogram uses 25 ms windows with 10 ms hops.
        % Create a time vector with instants corresponding to the center of
        % the windows
        t = 0.0125:0.01:(1-0.0125);

        bins = 1:size(auditorySpectrogram,2);

        pcolor(t,bins,auditorySpectrogram')
        shading flat
        xlabel("Time (s)")
        ylabel("Bark (bins)")

    end
    function plotAudio(audioIn,fs)
        %plotAudio Plot audio

        t = (0:size(audioIn,1)-1)/fs;
        plot(t,audioIn)
        xlabel("Time (s)")
        ylabel("Amplitude")
        grid on
        axis tight

    end
end

function y = trimOrPad(x,n)
%trimOrPad Trim or pad audio
%
% y = trimOrPad(x,n) trims or pads the input x to n samples along the first
% dimension. If x is trimmed, it is trimmed equally on the front and back.
% If x is padded, it is padded equally on the front and back with zeros.
% For odd-length trimming or padding, the extra sample is trimmed or padded
% from the back.

a = size(x,1);
if a < n
    frontPad = floor((n-a)/2);
    backPad = n - a - frontPad;
    y = [zeros(frontPad,size(x,2),like=x);x;zeros(backPad,size(x,2),like=x)];
elseif a > n
    frontTrim = floor((a-n)/2) + 1;
    backTrim = a - n - frontTrim;
    y = x(frontTrim:end-backTrim,:);
else
    y = x;
end

end

function moveRobotCommand(nvargs)
%detectCommand Detect commands
%
% moveRobotCommand(SampleRate=fs,Network=net,ClassificationRate=cr, ...
%   DecisionTimeWindow=dtw,FrameAgreementThreshold=fat,ProbabilityThreshold=pt, ...
%   Input=audioIn)
% opens a timescope to visualize streaming audio and a dsp.MatrixViewer to
% visualize auditory spectrograms extracted from a simulation of streaming
% audioIn. The scopes display the detected speech command after it has been
% processed by the streaming algorithm. The streaming audio is played to
% your default audio output device.
%
% detectCommand(SampleRate=fs,Network=net,ClassificationRate=cr, ...
%   DecisionTimeWindow=dtw,FrameAgreementThreshold=fat,ProbabilityThreshold=pt, ...
%   TimeLimit=tl)
% opens a timescope to visualize streaming audio and a dsp.MatrixViewer to
% visualize auditory spectrograms extracted from audio streaming from your
% default audio input device. The scopes display the detected speech
% command after it has been processed by the streaming algorithm.

arguments
    nvargs.SampleRate
    nvargs.Network
    nvargs.ClassificationRate
    nvargs.DecisionTimeWindow
    nvargs.FrameAgreementThreshold
    nvargs.ProbabilityThreshold
    nvargs.Input = []
    nvargs.TimeLimit = inf;
end

% Isolate the labels
labels = nvargs.Network.Layers(end).Classes;

if isempty(nvargs.Input)
    % Create an audioDeviceReader to read audio from your microphone.
    adr = audioDeviceReader(SampleRate=nvargs.SampleRate,SamplesPerFrame=floor(nvargs.SampleRate/nvargs.ClassificationRate));

    % Create a dsp.AsyncBuffer to buffer the audio streaming from your
    % microphone into overlapping segments.
    audioBuffer = dsp.AsyncBuffer(nvargs.SampleRate);
else
    % Create a dsp.AsyncBuffer object. Write the audio to the buffer so that
    % you can read from it in a streaming fashion.
    audioBuffer = dsp.AsyncBuffer(size(nvargs.Input,1));
    write(audioBuffer,nvargs.Input);

    % Create an audioDeviceWriter object to write the audio to your default
    % speakers in a streaming loop.
    adw = audioDeviceWriter(SampleRate=nvargs.SampleRate);
end

newSamplesPerUpdate = floor(nvargs.SampleRate/nvargs.ClassificationRate);

% Convert the requested decision time window to the number of analysis frames.
numAnalysisFrame = round((nvargs.DecisionTimeWindow-1)*(nvargs.ClassificationRate) + 1);

% Convert the requested frame agreement threshold in percent to the number of frames that must agree.
countThreshold = round(nvargs.FrameAgreementThreshold/100*numAnalysisFrame);

% Initialize buffers for the classification decisions and probabilities of the streaming audio.
YBuffer = repmat(categorical("background"),numAnalysisFrame,1);
probBuffer = zeros(numel(labels),numAnalysisFrame,"single");

% Create a timescope object to visualize the audio processed in the
% streaming loop. Create a dsp.MatrixViewer object to visualize the
% auditory spectrogram used to make predictions.
wavePlotter = timescope( ...
    SampleRate=nvargs.SampleRate, ...
    Title="...", ...
    TimeSpanSource="property", ...
    TimeSpan=1, ...
    YLimits=[-1,1], ...
    Position=[600,640,800,340], ...
    TimeAxisLabels="none", ...
    AxesScaling="manual");
show(wavePlotter)
specPlotter = dsp.MatrixViewer( ...
    XDataMode="Custom", ...
    AxisOrigin="Lower left corner", ...
    Position=[600,220,800,380], ...
    ShowGrid=false, ...
    Title="...", ...
    XLabel="Time (s)", ...
    YLabel="Bark (bin)");
show(specPlotter)

% Initialize variables for plotting
currentTime = 0;
colorLimits = [-1,1];

% Run the streaming loop.
loopTimer = tic;
palabraEsNueva = true;

% Inicializacion de variables robot

% Creacion del ROS Master
rosinit
disp('Pulsa en la figura creada cuando se haya inicializado el robot.')
waitforbuttonpress
close

% Creacion de clientes de servicios y suscriptores de topics
homeclient = rossvcclient("/wam/go_home");
global jointclient;
jointclient = rossvcclient("/wam/joint_move");
global posesub;
posesub = rossubscriber("/wam/pose");
global jointsub;
jointsub = rossubscriber("/wam/joint_states");

% Creacion de mensajes para los servicios
homemsg = rosmessage(homeclient);
global jointmsg;
jointmsg = rosmessage(jointclient);
jointmsg.Joints = [0 0 0 0 0 0 0];

% Matrices para el movimiento
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

% Inicializacion del movimiento
alpha = 20;
beta = 0;
rho = 0.2;
T = robotTfulcro*PoseCamaraSimulador(rho,beta,alpha)*camTtcp;
send_iksolution_to(T);

while whileCriteria(loopTimer,nvargs.TimeLimit,wavePlotter,specPlotter,nvargs.Input,audioBuffer)

    if isempty(nvargs.Input)
        % Extract audio samples from the audio device and add the samples to
        % the buffer.
        audioIn = adr();
        write(audioBuffer,audioIn);
    end

    % Read samples from the buffer
    y = read(audioBuffer,nvargs.SampleRate,nvargs.SampleRate - newSamplesPerUpdate);
    
    % Extract an auditory spectrogram from the audio
    spec = extractAuditorySpectrogram(y,nvargs.SampleRate);
    
    % Classify the current spectrogram, save the label to the label buffer,
    % and save the predicted probabilities to the probability buffer.
    [YPredicted,probs] = classify(nvargs.Network,spec);
    YBuffer = [YBuffer(2:end);YPredicted];
    probBuffer = [probBuffer(:,2:end),probs(:)];
    
    % Plot the current waveform and spectrogram.
    ynew = y(end-newSamplesPerUpdate+1:end);
    wavePlotter(ynew)
    specPlotter(spec')

    % Declare a detection and display it in the figure if the following hold: 
    %   1) The most common label is not background. 
    %   2) At least countThreshold of the latest frame labels agree. 
    %   3) The maximum probability of the predicted label is at least probThreshold.
    % Otherwise, do not declare a detection.
    [YMode,count] = mode(YBuffer);
    maxProb = max(probBuffer(labels == YMode,:));
    if YMode == "background" || count < countThreshold || maxProb < nvargs.ProbabilityThreshold
        wavePlotter.Title = "...";
        specPlotter.Title = "...";
        palabraEsNueva = true;
    else
        wavePlotter.Title = string(YMode);
        specPlotter.Title = string(YMode);
        if palabraEsNueva
            palabraEsNueva = false;
            if strcmp(string(YMode),'left')
                if beta > -30
                    beta = beta - 5;
                    T = robotTfulcro*PoseCamaraSimulador(rho,beta,alpha)*camTtcp;
                    send_iksolution_to(T);
                end
            elseif strcmp(string(YMode),'right')
                if beta < 30
                    beta = beta + 5;
                    T = robotTfulcro*PoseCamaraSimulador(rho,beta,alpha)*camTtcp;
                    send_iksolution_to(T);
                end
            elseif strcmp(string(YMode),'up')
                if alpha < 80
                    alpha = alpha + 5;
                    T = robotTfulcro*PoseCamaraSimulador(rho,beta,alpha)*camTtcp;
                    send_iksolution_to(T);
                end
            elseif strcmp(string(YMode),'down')
                if alpha > 15
                    alpha = alpha - 5;
                    T = robotTfulcro*PoseCamaraSimulador(rho,beta,alpha)*camTtcp;
                    send_iksolution_to(T);
                end
            elseif strcmp(string(YMode),'on')
                if rho > 0.14
                    rho = rho - 0.02;
                    T = robotTfulcro*PoseCamaraSimulador(rho,beta,alpha)*camTtcp;
                    send_iksolution_to(T);
                end
            elseif strcmp(string(YMode),'off')
                if rho < 0.22
                    rho = rho + 0.02;
                    T = robotTfulcro*PoseCamaraSimulador(rho,beta,alpha)*camTtcp;
                    send_iksolution_to(T);
                end
            end
        end
    end
    
    % Update variables for plotting
    currentTime = currentTime + newSamplesPerUpdate/nvargs.SampleRate;
    colorLimits = [min([colorLimits(1),min(spec,[],"all")]),max([colorLimits(2),max(spec,[],"all")])];
    specPlotter.CustomXData = [currentTime-1,currentTime];
    specPlotter.ColorLimits = colorLimits;

    if ~isempty(nvargs.Input)
        % Write the new audio to your audio output device.
        adw(ynew);
    end
end
release(wavePlotter)
release(specPlotter)

    function tf = whileCriteria(loopTimer,timeLimit,wavePlotter,specPlotter,Input,audioBuffer)
        if isempty(Input)
            tf = toc(loopTimer)<timeLimit && isVisible(wavePlotter) && isVisible(specPlotter);
        else
            tf = audioBuffer.NumUnreadSamples > 0;
        end
    end
end