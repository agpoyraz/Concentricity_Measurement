function concentricity = calculateConcentricityCanny(imageInput)
% CALCULATECONCENTRICITY calculates the normalized concentricity value
% from an input image containing two concentric circular shapes.
%
% INPUT:
%   imageInput - Image file path (e.g., 'image.bmp') or grayscale RGB image matrix
%
% OUTPUT:
%   concentricity - Normalized concentricity (distance between centers / outer diameter)

    % Read image if input is a file path
    if ischar(imageInput) || isstring(imageInput)
        img = imread(imageInput);
    else
        img = imageInput;
    end

    % Convert to grayscale if RGB
    if size(img, 3) == 3
        grayImg = rgb2gray(img);
    else
        grayImg = img;
    end

    % Detect edges using Canny method
    edges = edge(grayImg, 'Canny');

    % Find connected components
    cc = bwconncomp(edges);

    % Extract region properties
    stats = regionprops(cc, 'Centroid', 'Area', 'EquivDiameter');

    % Require at least two regions
    if numel(stats) < 2
        error('Less than two circular regions detected.');
    end

    % Sort by area and take two largest regions
    [~, idx] = sort([stats.Area], 'descend');
    centers = cat(1, stats(idx(1:2)).Centroid);
    diameters = [stats(idx(1)).EquivDiameter, stats(idx(2)).EquivDiameter];

    % Calculate distance between centers
    centerDistance = norm(centers(1,:) - centers(2,:));

    % Normalize by the larger diameter (assumed to be the outer circle)
    % Normalize edilmiş halini aldık. Normalize etmek demek, büyük çapa
    % göre yüzde kaç bozukluk var demek oluyor.
    concentricity = centerDistance / max(diameters);

%     % Optional: Visualization (can be commented out if used as a batch tool)
%     figure; imshow(img); hold on;
%     
%     % Draw centers
%     plot(centers(:,1), centers(:,2), 'r*', 'MarkerSize', 10);
% 
%     % Draw line between centers
%     line([centers(1,1), centers(2,1)], [centers(1,2), centers(2,2)], 'Color', 'g');
% 
%     % Calculate mid-point of the line
%     midX = mean([centers(1,1), centers(2,1)]);
%     midY = mean([centers(1,2), centers(2,2)]);
% 
%     % Display concentricity value on the green line
%     text(midX, midY, sprintf('%.4f px', concentricity), ...
%         'Color', 'green', 'FontSize', 12, 'FontWeight', 'bold', ...
%         'HorizontalAlignment', 'center', 'BackgroundColor', 'white');
% 
%     title(sprintf('Concentricity = %.4f', concentricity));

end