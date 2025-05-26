% görüntü çap ölçme algoritması
function [c1, c2, c3, c4] = concentricity_measurement_methods(im)

    im = eliminate_small_objects(im,254); % th = 254 
    %% Algorithm 1 Connected Component Based Concentricity Measurement
    % DOI: 
    c1 = calculateConcentricityCanny(im);
    
    %% Algorithm 2 Devernay
    % DOI:
    sigma       = 1.0;       
    high_thresh = 15.0;    % default H and L = 0
    low_thresh  = 5.0;

    im_outer = imcomplement(imfill(imcomplement(im),"holes"));

    [x1, y1] = devernay_edges(im_outer, sigma, high_thresh, low_thresh);
    [xCenter1, yCenter1, ~, ~] = circlefit(x1, y1);
    
    im_inner = find_inner_diameter(im);

    [x2, y2] = devernay_edges(im_inner, sigma, high_thresh, low_thresh);
    [xCenter2, yCenter2, r, ~] = circlefit(x2, y2);

    diameter = r*2;
    
    distancee = sqrt((xCenter1 - xCenter2)^2 + (yCenter1 - yCenter2)^2);
    c2 = distancee/diameter; % Normalized concentricity

    %% Algorithm 3 Subpixel Edge 
    % DOI:
    c3 = matlab_code_for_concentricity(im_outer,im_inner);

    %% Algorithm 4 Proposed
    % DOI:
    c4 = proposed_method(im_outer,im_inner);
