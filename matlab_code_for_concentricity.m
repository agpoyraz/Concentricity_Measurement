function c3 = matlab_code_for_concentricity(im_outer,im_inner)
%addpath(genpath('.'));
threshold = 15;
%[im_desired] = eliminate_small_objects(image,250);
edges = subpixelEdges(im_outer, threshold, 'SmoothingIter', 2); 
[xCenter1, yCenter1, radius, a] = circlefit(edges.x, edges.y);
diameter = radius*2;

edges = subpixelEdges(im_inner, threshold, 'SmoothingIter', 2); 
[xCenter2, yCenter2, radius, a] = circlefit(edges.x, edges.y);

distancee = sqrt((xCenter1 - xCenter2)^2 + (yCenter1 - yCenter2)^2);
c3 = distancee/diameter; % Normalized concentricity 

end