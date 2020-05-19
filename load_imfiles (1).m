%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Name: load_imfiles.m
%
% Purpose: Load image files collected on EVOS scope and ID color channels
%
% Written by: Gregory T. Tietjen 02.19.2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NOTES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This script assumes you are already in the local directory of the image
%files and that files were collected on the Tietjen Lab EVOS scope and have
%the standard file names *.dX.TIF where dX is one of d0, d1, d2, or d3 for
%the various color channels.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get files names for each of the 4 channels
    d0_files = dir('*d0.TIF');
    d1_files = dir('*d1.TIF');
    d2_files = dir('*d2.TIF');
    d3_files = dir('*d3.TIF');
    
    %% 
% Load the files into a matrix
    
    if isempty(d0_files)==0 %Test if this channel was collected
        
        hWaitBar = waitbar(0,'Reading D0 files');
        d0_num = length(d0_files); %Get # of files for preallocation
        d0_im = zeros(1048,1328,d0_num); %Preallocation for EVOS images
        
        for j = 1:length(d0_files)
            
            d0_im(:,:,j) = imread(d0_files(j).name);
            waitbar(j/d0_num);
        end
        
        delete(hWaitBar);
        
        hWaitBar = waitbar(0,'Reading D1 files');
        d1_num = length(d1_files); %Get # of files for preallocation
        d1_im = zeros(1048,1328,d1_num); %Preallocation for EVOS images
        
        for j = 1:length(d0_files)
            
            d1_im(:,:,j) = imread(d1_files(j).name);
            waitbar(j/d1_num);
        end
        
        delete(hWaitBar);
        
        hWaitBar = waitbar(0,'Reading D2 files');
        d2_num = length(d2_files); %Get # of files for preallocation
        d2_im = zeros(1048,1328,d2_num); %Preallocation for EVOS images
        
        for j = 1:length(d2_files)
            
            d2_im(:,:,j) = imread(d2_files(j).name);
            waitbar(j/d2_num);
        end
        
        delete(hWaitBar);
        
        hWaitBar = waitbar(0,'Reading D3 files');
        d3_num = length(d3_files); %Get # of files for preallocation
        d3_im = zeros(1048,1328,d3_num); %Preallocation for EVOS images
        
        for j = 1:length(d0_files)
            
            d3_im(:,:,j) = imread(d3_files(j).name);
            waitbar(j/d3_num);
        end
        
        delete(hWaitBar);
    end
    
    im.dapi = uint16(d0_im);
    im.dio = uint16(d1_im);
    im.dii = uint16(d2_im);
    im.ulex = uint16(d3_im);
    
    im.filenames.dapi = d0_files.name;
    im.filenames.dio = d1_files.name;
    im.filenames.dii = d2_files.name;
    im.filenames.ulex = d3_files.name;
    
    clearvars -except im
    
    save im.mat im
            
    %% 
            