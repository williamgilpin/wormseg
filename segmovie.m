function segmovie(directory, thres)
%
% This function segments a time series of microscope images using simple
% thresholding, and writes the resulting segmented images to tifs in a
% subfolder in the same directory
%
% directory : string
%   a string specifying the relative path of the files to be segmented
%
% thres : double
%   a number between 0 and 1 that determines the brightness thresolding
%
% The code was developed by the Brangwynne laboratory at Princeton University. 
% If using this code (or a modified form) please cite:
%
%  W.Gilpin, S. Uppaluri, C. Brangwynne "Worms under pressure: 
%  bulk mechanical properties of C. elegans are independent of the cuticle"�� 
%  Biophysical Journal, 2015.

addpath(directory);
pics = dir(fullfile(directory,'*.tif'));
mkdir(['seg' directory]);
addpath(['seg' directory]);
N = numel(pics);

for k = 1:N
    pic = imread(pics(k).name);
    pic=im2double(pic);
    pic=pic(:,:,1);
    pic=imadjust(pic);
    pic=im2bw(pic,thres); % use ~ if you want white on black
    imwrite(pic, fullfile(['seg' directory],pics(k).name),'Compression','None');
end