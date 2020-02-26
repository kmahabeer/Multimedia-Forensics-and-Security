function outImage = bitPlaneExtract(image, display_images)
%bitPlaneExtract Gets each bit plane out of image.
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
    
    if display_images == 1
        
        figure;
        imshow(uint8(itemp));
        title('Original Image');
    
        figure;
        for i = 0:7
            subplot(2,4,(i+1));
            imshow(outImage(:,:,8-i));
            if i == 0
                title(['Bit Plane # ', num2str(8-i), ' (MSB)']);
            elseif i == 7
                title(['Bit Plane # ', num2str(8-i), ' (LSB)']);
            else
                title(['Bit Plane # ', num2str(8-i)]);
            end
        end
        
    end   
    
end