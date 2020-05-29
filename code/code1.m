close all
clc
clear all

I = imread('/Users/garvilsinghal/Downloads/Archive 2/image(20).tif'); 
J = I

%disk structural element
se = strel('disk',12,0);

%Closing image I by se
J = imclose(J,se);
J = J - I;

%Adjusting Contrast
J = imadjust(J,[0.05 0.2]);
imshow(J);