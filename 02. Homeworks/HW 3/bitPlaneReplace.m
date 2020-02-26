function reconstructed = bitPlaneReplace(image1, image2, N)
%bitPlaneReplace Replaces N bit plane of an image with N bit plane of other image.
% Takes as input:
%   image1 = to be used as host image
%   image2 = to be used as watermark
%   N = bit plane of host image to be replaced

    host = bitPlaneExtract(image1, 0);
    waterMark = bitPlaneExtract(image2, 0);

    [rows, cols] = size(imread(image1));
    reconstructed = zeros(rows, cols);
    
    for i = 0:1:7
        if i <= N-1
            reconstructed = reconstructed + waterMark(:,:,8-(N-1-i))*(2 .^ i);
        else
            reconstructed = reconstructed + host(:,:,i+1)*(2 .^ i);
        end
    end

%{
% Ideal for N = 3
    
% Referenced:
%     reconstructed = host(:,:,1)+host(:,:,2)*2+host(:,:,3)*4+host(:,:,4)*8+...
%     host(:,:,5)*16+host(:,:,6)*32+host(:,:,7)*64+host(:,:,8)*128;
    
    reconstructed = waterMark(:,:,6)*1+...
        waterMark(:,:,7)*2+...
        waterMark(:,:,8)*4+...
        host(:,:,4)*8+...
        host(:,:,5)*16+...
        host(:,:,6)*32+...
        host(:,:,7)*64+...
        host(:,:,8)*128;
    figure;
    imshow(uint8(reconstructed));
    title('Recovered Image'); % display the reconstructed image
%}    
end