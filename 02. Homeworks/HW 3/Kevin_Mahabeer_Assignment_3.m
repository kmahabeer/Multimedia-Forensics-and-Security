%% Kevin Mahabeer | ECES 435 | Assignment 3

%% Part 1. Least Significant Bit Data Hiding
clear; close all; clc;
%{
Write a Matlab function that extracts and displays a user specified bit 
plane from an image. 

Use this function to examine each of the bit planes in the peppers.tif 
and baboon.tif images. 

As you examine progressively lower bit planes, you should notice that 
each bit plane increasingly resembles noise.
%}
fileName = 'peppers.tif';
test = bitPlaneExtract(fileName);

function outImage = bitPlaneExtract(image)
% image = file directory to image (string)
% bitPlaneNumber = number of bit plane (double)
    
    image = imread(image); % read in the image
    itemp = image(:,:,1);
    [rows, cols] = size(itemp);
    outImage = zeros(rows, cols, 8);
    for k = 1:8
       for i = 1:rows
           for j = 1:cols
              outImage(i,j,k) = bitget(itemp(i,j),k);
           end
       end
    end
    figure;
    imshow(uint8(itemp));
    title('Original Image');
%     title(['Original Image, File Name = ', image]);
    
    figure;
    subplot(241);
    imshow(outImage(:,:,8)); 
    title('8th(MSB)Plane');
    
    subplot(242);
    imshow(outImage(:,:,7));
    title('7th Plane');
    
    subplot(243);
    imshow(outImage(:,:,6));
    title('6th Plane');
    
    subplot(244);
    imshow(outImage(:,:,5));
    title('5th Plane');
    
    subplot(245);
    imshow(outImage(:,:,4));
    title('4th Plane');
    
    subplot(246);
    imshow(outImage(:,:,3));
    title('3th Plane');
    
    subplot(247);
    imshow(outImage(:,:,2));
    title('2nd Plane');
    
    subplot(248);
    imshow(outImage(:,:,1));
    title('1st(LSB)Plane') 

end

%{
Use your Matlab function from the previous part to examine the different 
bit planes of the following images:

LSBwmk1.tiff, LSBwmk2.tiff, LSBwmk3.tiff. 

Do any of these images contain hidden content? 

If any of these images contain hidden information, please make note of the 
image and include the hidden content in your report.
%}






