function [optionsOUT]=DSC_mri_getOptions()

optionsOUT.module = 'CTP'; % 'MRP'

% OPZIONI DI VISUALIZZAZIONE
optionsOUT.display=2; % 0:off, 1:notify (text), 2:notify (images), 3:debug
optionsOUT.waitbar=1; % 0:off, 1:on


% OPZIONI PER LA PREPARAZIONE DEI DATI
optionsOUT.mask.npixel=300; 
% rappresenta il numero di pixel minimi di una componente connessa che �
% utilizzata come soglia per escludere dall'immagine lo scalpo e le zone 
% adiacenti all'esterno dell'encefalo

optionsOUT.conc=0; 
% 0: i dati forniti sono segnale, 1: i dati forniti sono concentrazioni

optionsOUT.S0.nSamplesMin=0; 
% Numero minimo di scansioni iniziali sulle quali calcolare S0

optionsOUT.S0.nSamplesMax=30;  % 80
% Numero massimo di scansioni iniziali sulle quali calcolare S0

optionsOUT.S0.thresh=0.01;
% Soglia utilizzata per scegliere l'istante di comparsa del tracciante

% OPZIONI PER LA FASE DI INDIVIDUAZIONE DELL'AIF
optionsOUT.aif.enable= 1; 
% 0: non calcola la AIF, 1: calcola la AIF

optionsOUT.aif.ricircolo= 0;
% 0: non tiene conto del ricircolo, 1: fitta il ricircolo

optionsOUT.aif.nSlice= 0;
% Slice sulla quale cercare la AIF (0: fa selezionare la slice
% all'operatore)

optionsOUT.aif.semiasseMaggiore= 0.25;  %0.35
% Dimensione del semiasse maggiore per l'area di ricerca

optionsOUT.aif.semiasseMinore= 0.1; % 0.15
% Dimensione del semiasse minore per l'area di ricerca

optionsOUT.aif.pArea= 0.4000; 
% Percentuali di voxel scartati a causa della AUC

optionsOUT.aif.pTTP= 0.4000; 
% Percentuali di voxel scartati a causa del TTP

optionsOUT.aif.pReg= 0.0500; 
% Percentuali di voxel scartati a causa della regolarit� dell'andamento

optionsOUT.aif.diffPicco= 0.0400; 
% Soglia per decidere se selezionare il cluster sulla base del picco o del 
% TTP

optionsOUT.aif.nVoxelMax= 6; 
% n� massimo di voxel scelti per la AIF

optionsOUT.aif.nVoxelMin= 4; 
% n� minimo di voxel scelti per la AIF


% Correzione della formula per il calcolo della concentrazione dal segnale
% nel caso di calcolo della AIF
optionsOUT.qr.enable= 0; % 0: non applica la correzione, 1: applica la correzione
optionsOUT.qr.b= 5.7400e-004;
optionsOUT.qr.a= 0.0076;
optionsOUT.qr.r= 0.0440;

% OPZIONI PER I METODI DI DECONVOLUZIONE
optionsOUT.deconv.SVD.threshold= 0.2; % soglia della SVD
optionsOUT.deconv.SVD.residual= 1; % 0: non salva i residui, 1: salva i residui

optionsOUT.deconv.cSVD.threshold= 0.1; % soglia della cSVD (0.1 vale per dati ottenuti a 1.5T)
optionsOUT.deconv.cSVD.residual= 1; % 0: non salva i residui, 1: salva i residui

optionsOUT.deconv.oSVD.OIthres = 0.035;    % threshold del 10% con in Ostergaard e Calamante
optionsOUT.deconv.oSVD.OIcounter = 1;
optionsOUT.deconv.oSVD.residual= 1; % 0: non salva i residui, 1: salva i residui

%DA AGGIUNGERE PARAMETRI PER STABLE SPLINE
optionsOUT.deconv.SS.residual = 1;
optionsOUT.deconv.method={'SVD'}; 
%optionsOUT.deconv.method={'SVD';'cSVD';'oSVD'}; % Metodi da applicare per il calcolo della perfusione

% COSTANTI DI PROPORZIONALITA'
optionsOUT.par.kh= 1;
optionsOUT.par.rho= 1;
optionsOUT.par.kvoi= 1;
