function [im_inner] = find_inner_diameter(im)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    im_binary = im<254;
    im_binary = imfill(im_binary,"holes");
    cc = bwconncomp(im_binary);
    stats = regionprops(cc, 'Centroid', 'Area', 'EquivDiameter');  
    % 'Area' değerlerini al
    areas = [stats.Area];

    % En büyük alanı ve indeksini bul
    [maxArea, maxIdx] = max(areas); 

    % En büyük objenin bilgileri
    largestObj = stats(maxIdx);

    
    % Çemberin merkezi ve yarıçapı (örnek değerler)
    centerX = largestObj.Centroid(1);
    centerY = largestObj.Centroid(2);
    radius = largestObj.EquivDiameter/2 - 50;
    
    % Görüntü boyutları
    [height, width] = size(im);
    
    % Koordinat matrisleri oluştur
    [xGrid, yGrid] = meshgrid(1:width, 1:height);
    
    % Çember maskesi oluştur: (x - cx)^2 + (y - cy)^2 <= r^2
    circleMask = (xGrid - centerX).^2 + (yGrid - centerY).^2 <= radius^2;

    im2 = im<255;
    im3 = imfill(im2,"holes");
    im4 = uint8(im3).*im;
    
    % Maskeyi uygula
    im_inner = uint8(circleMask) .* im4;
    
    % Sonucu göster
%     imshow(im_inner);
%     title('Only pixels inside the circle are kept');
end