%% Kevin Mahabeer | ECES 435 | Assignment 3
%% Part 1. Least Significant Bit Data Hiding
%% 1.a 
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
image1 = bitPlaneExtract(fileName, 1);
clear fileName image 

%% 1.b
clear; close all; clc;
%{
Use your Matlab function from the previous part to examine the different 
bit planes of the following images:

LSBwmk1.tiff, LSBwmk2.tiff, LSBwmk3.tiff. 

Do any of these images contain hidden content? 

If any of these images contain hidden information, please make note of the 
image and include the hidden content in your report.

- Yes. There are hidden messages in all three of the listed files. The
hidden messages are as follows:
%}

for i = 1:3
    fileName = strcat('LSBwmk',num2str(i),'.tiff');
    image = bitPlaneExtract(fileName, 1);
end

%% 1.c
clear; close all; clc;
%{
Write a Matlab function that replaces the N least significant bit planes 
from one image with the N most significant bit planes from another image. 

This function should accept both images along with the parameter N as 
inputs and return the modified image containing hidden data in unsigned 
8-bit integer format as an output.
%}

host1 = 'peppers.tif';
host2 = 'baboon.tif';
waterMark1 = 'Barbara.bmp';

numN = 8;

% Watermark peppers.tif
for i = 1:numN
    waterMarkedImage1 = bitPlaneReplace(host1, waterMark1, i);
    fileName = strcat('.\WaterMarkedPeppers\waterMarkedImage', num2str(i), '.tif');
    imwrite(uint8(waterMarkedImage1), fileName);
    
    newImage = bitPlaneExtract(fileName, 0);
    image = imread(fileName);
%{
    figure;
    imshow(uint8(image));
    title(['WaterMarked Image: peppers.tif, N = ', num2str(i)]);

    figure;
    for j = 0:7
        subplot(2,4,(j+1));
        imshow(newImage(:,:,8-j));
        if j == 0
            title(['Bit Plane # ', num2str(8-j), ' (MSB)']);
        elseif j == 7
            title(['Bit Plane # ', num2str(8-j), ' (LSB)']);
        else
            title(['Bit Plane # ', num2str(8-j)]);
        end
    end
%}
end
clear i

% Watermark baboons.tif
for i = 1:numN
    waterMarkedImage1 = bitPlaneReplace(host2, waterMark1, i);
    fileName = strcat('.\WaterMarkedBaboons\waterMarkedImage', num2str(i), '.tif');
    imwrite(uint8(waterMarkedImage1), fileName);
    
    newImage = bitPlaneExtract(fileName, 0);
    image = imread(fileName);
%{   
    figure;
    imshow(uint8(image));
    title(['WaterMarked Image: baboons.tif, N = ', num2str(i)]);

    figure;
    for j = 0:7
        subplot(2,4,(j+1));
        imshow(newImage(:,:,8-j));
        if j == 0
            title(['Bit Plane # ', num2str(8-j), ' (MSB)']);
        elseif j == 7
            title(['Bit Plane # ', num2str(8-j), ' (LSB)']);
        else
            title(['Bit Plane # ', num2str(8-j)]);
        end
    end
%}
end

%{
waterMarkedImage1 = bitPlaneReplace(host1, waterMark1, 7);
imwrite(uint8(waterMarkedImage1), '.\Images\test.tif');
newImage = bitPlaneExtract('.\Images\test.tif', 1);
%}

%{
Use this function to hide the top N layers of the Barbara.bmp image in both 
the peppers.tif and baboon.tif images. 

How many bit planes of Barbara.bmp can you embed in each image before you 
start to notice distortion in the host image? 

- After about N = 4, peppers.tif begins to exhibit noticeable distortion. 
After about N = 5, baboons.tif begins to exhibit noticeable distortion.

How many bit planes of Barbara.bmp can you embed in each image before you 
can begin to see the hidden content? 

- At 5 bit planes of Barbara.bmp, you can begin to see the hidden content
in peppers.tif. At 7 bit planes of Barbara.bmp, you can begin to see the 
hidden content in baboon.tif.

Are the number of bit planes that you can embed the same or different for 
each image? 

- The number of bit planes are different for each image.

If they are different, why would this be the case?

- They are different because baboon.tif appears to have more noise in the
image due to the texture of the baboon's face. While the peppers.tif image
is smoother. Therefore, you are able to hide more bit planes in the
baboon.tif image because of the noise, making it harder to distinguish
between the baboon image and the watermark.
%}



