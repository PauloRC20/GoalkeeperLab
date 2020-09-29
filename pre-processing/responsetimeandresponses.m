clc;
% This script organises the response time, response, the stocastic chain 
% and randomness of the data collect of the Goalkeeper game.
%
% Author: Paulo Roberto Cabral Passos.
% Last Modification: 18/07/2019
%
% All information is stored in "data" variable, in a numerical form, that is
% organized in columns as follows: 
% data(:,1) = group; (check) 
% data(:,2) = day; (check)
% data(:,3) = cell; (check)
% data(:,4) = step; (check)
% data(:,5) = tree; (check)
% data(:,6) = alternative identification; (check)
% data(:,7) = response time (check)
% data(:,8) = response (check)
% data(:,9) = stochastic chain (check)
% data(:,10) = randomness (1 - yes, 0 - no) (check)
% data(:,11) = logical or not? (1 - yes, 0 - no) 
%
% Reading and organizing the data
%
% ATENTION. MAY BE NECESSARY TO CHANGE FOLDER ADRESS.
% If you are at INDC, type the following line:
% addpath('D:\Roberto062019backup\Documentos\Dr. Fisiologia\Jogo do Goleiro\MatlabScripts');
% If you are at home, type the following line:
% addpath('/home/roberto/Documents/Dr. Fisiologia/Jogo do Goleiro/MatlabScripts');
% The following *.csv files were created by a C routine.

% Opening numerical data

dir = '/home/roberto/Documents/Dr. Fisiologia/Jogo do Goleiro/MatlabScripts/Goalkeeper_Routines/data_files/response_time_analysis/'; % directory containing the *.csv files.
ppg_f = 'participants_pergroup.csv'; % *.csv file containing how many participants each group have. It has twice the number of participants because it counts per day.
ppg = csvread([dir ppg_f]); ppg = ppg(1:size(ppg,2)-1); % Opening and rectifying
spp_f = 'steps_perparticipant.csv'; % *.csv file containing how many steps each participant completed.
spp = csvread([dir spp_f]); spp = spp(1:size(spp,2)-1); % Opening and rectifying
cells_f = 'cells.csv'; % containing the number of cells in each opened file.
cells = csvread([dir cells_f]); cells = cells(1:size(cells,2)-1); % Opening and rectifying
rtime_f = 'rtime.csv'; % containing the response time of the participant.
rtime = csvread([dir rtime_f]); rtime = rtime(1:size(rtime,2)-1); % Opening and rectifying
schain_f = 'schain.csv'; % containing the stochastic chain.
schain = csvread([dir 'schain.csv']); schain = schain(1:size(schain,2)-1); % Opening and rectifying
sresponse_f = 'sresponse.csv'; % containing the responses of the player;
sresponse = csvread([dir 'sresponse.csv']); sresponse = sresponse(1:size(sresponse,2)-1);

% Opening non-numerical data
id_f = fopen([dir 'data_id.csv']); % *.csv file containing the identification of the participants
id = textscan(id_f,'%s'); id = id{1,1}{1,1}; id = id(1:length(id)-1); %rectifying
rndness_f = fopen([dir 'randomness.csv']); % *.csv file containing the identification if the chain element is random or not.
rndness = textscan(rndness_f, '%s'); rndness = rndness{1,1}{1,1}; rndness(1:length(rndness)-1); %rectifying


% Building data matrix
 
mlength = sum(cells); % each participant has a number of steps he played, for each there will be N cells, 12 for the first and 102, 104 for the others. How many lines the data matrix must have?
data = zeros(mlength,7);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%THIS PROCEEDING TAKES TOO LONG, UPLOAD THE DATA USING:
upload = open('/home/roberto/Documents/Dr. Fisiologia/ProgramasC/Planilhas/rtime_analysis/processedDATA.mat');
id_alt = upload.id_alt;
clear upload

% Setting the alternative id (need to store that data, to much time to
% build)

% lim = max(cells)*max(spp)*2*max(ppg);
%id_alt = set_idalt_improv(mlength, id, lim);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Determining the group and the day
data = groupday_multi(data, ppg,spp,cells);
% Determining the step
data(:,3:4) = step_cell(id_alt, cells);
% Determining the tree
data(:,5) = treeid(data(:,1:4));
% Determining the alternative id
data(:,6) = id_alt;
% Determining the response time
data(:,7) = rtime';
% Determining the response
data(:,8) = sresponse';
% Determining the expected response
data(:,9) = schain';
% Determining the randomness of the expected response.
data(:,10) = rndvec(rndness, mlength);
% Determining if the response is logic or not.
data(:,11) = log_or_not(data(:,3),data(:,9),data(:,8),data(:,5));

